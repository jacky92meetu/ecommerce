<?php

class ControllerMerchantProduct extends Controller {
    
    var $max_size = 2;  /*file size upload limit in mb*/
    var $max_file = 5;  /*total file upload limit*/
    var $max_product = 5; /*product upload limit*/
    
    public function __construct($registry) {
        parent::__construct($registry);
        if ($this->merchant->getInfo("user_type") == 1) {
            $this->max_file = 99999;
        }
    }

    public function index() {        
        $this->load->model('merchant/merchant');
        $this->load->model('merchant/product');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        
        $option = array(
            "limit" => 20,
            "order" => array("a.date_added" => "desc"),
            "route" => "merchant/product?merchant_id=".$store['merchant_id']
        );        
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT a.*,b.name,b.description FROM `" . DB_PREFIX . "product` a left join `" . DB_PREFIX . "product_description` b on a.product_id=b.product_id WHERE language_id=".(int)$this->config->get('config_language_id')." AND a.product_id in (select product_id from `" . DB_PREFIX . "merchant_product` where store_id=".(int)$store['store_id']." and status=1)", $option, FALSE);
        
        $this->load->model('tool/image');        
        foreach($this->data['data_list']['data'] as $key => $result){
            $result['category_group'] = $this->model_merchant_product->getProductCategory($result['product_id']);
            $result['product_visit'] = $this->model_merchant_product->getProductVisit($result['product_id']);
            $result['image'] = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
            $result['image'] = $this->merchant->image_link($result['image']);
            $len = 200;
            $description = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
            if(utf8_strlen($description)>$len){
                $pos = utf8_strrpos(utf8_substr($description,0,$len), " ");
                $description = utf8_substr($description,0,$pos)."<strong> ...</strong>";
            }
            $result['description'] = $description;
            $this->data['data_list']['data'][$key] = $result;
        }
        
        $package = $this->model_merchant_merchant->getMerchantPackageById($store['merchant_id']);
        $this->data['max_product'] = $this->max_product;
        if($package){
            $this->data['max_product'] = $package['package_posting'];
        }
        
        $this->data['store'] = $store;

        $this->template = 'merchant/product/productlist.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

    public function create() {        
        $this->load->model('merchant/product');
        
        $error = $this->validate_createproduct();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];            
            if($error->status=="success"){
                unset($json->text);
                $this->merchant->set_notice($error->text, "success");
                $json->redirect = $this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId());
            }
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="product_error"){            
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        
        $this->merchant->merchant_dir_check();
        $files = array();
        $targetPath = DIR_IMAGE."product".DS."session".DS.$this->merchant->getId().DS;
        if ($dh = opendir($targetPath)) {
            while (($file = readdir($dh)) !== false) {
                if($file!='.' && $file!='..'){
                    $files[$file] = "/image/product/session/".$this->merchant->getId()."/".$file;
                }                
            }
            closedir($dh);
        }
        $this->data['files'] = $files;
        
        if(isset($this->request->get['category_id'])){
            $this->data['selected_category'] = json_encode(array("0"=>array("category_id"=>$this->request->get['category_id'])));
        }        
        
        $this->data['pdata'] = $this->request->post;
        
        $category = $this->model_merchant_product->getCategoryGroup();
        $this->data['category_list'] = $category;
        
        $this->data['main_option_list'] = $this->model_merchant_product->getProductAllOption(true);
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        if($store['package_id']>0){
            $this->data['stock_status_list'] = $this->model_merchant_product->getProductStockStatus();
        }else{
            $this->data['stock_status_list'] = $this->model_merchant_product->getProductStockStatus(5);
        }        
        
        $this->data['max_file_size'] = $this->max_size;        
        $this->data['max_file_upload'] = $this->max_file;
        
        $this->template = 'merchant/product/createproduct.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function update() {
        if(isset($this->request->get['product_id'])){            
            $this->request->post['product_id'] = $this->request->get['product_id'];
        }
        if(!isset($this->request->post['product_id'])){
            $this->merchant->set_notice("Invalid product id","error");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        
        $this->load->model('merchant/product');
        
        $error = $this->validate_updateproduct();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];            
            if($error->status=="success"){
                unset($json->text);
                $this->merchant->set_notice($error->text, "success");
                $json->redirect = $this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId());
            }
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="product_error"){            
            $this->merchant->set_notice($error->text,"error");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        
        $id = $this->request->post['product_id'];        
        $images = $this->model_merchant_product->getProductImages($id, true);
        $this->load->model('tool/image');
        $this->data['files'] = array();
        foreach($images as $result){
            $result['thumb'] = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));            
            $this->data['files'][] = $result;
        }
        
        if(!isset($this->request->post['username'])){            
            $product = $this->request->post['product'];
            if(strlen($product['start_date'])>0 && $product['start_date']!='0000-00-00'){                
                $product['start_date'] = date('d-m-Y',strtotime($product['start_date']));
            }else{
                $product['start_date'] = "";
            }
            if(strlen($product['end_date'])>0 && $product['end_date']!='0000-00-00'){                
                $product['end_date'] = date('d-m-Y',strtotime($product['end_date']));
            }else{
                $product['end_date'] = "";
            }            
            $this->data['pdata'] = $product;            
            $this->data['option_data'] = $this->model_merchant_product->getProductOption($this->request->post['product_id']);            
        }else{
            $this->data['pdata'] = $this->request->post;
        }
        
        $this->data['product_id'] = $this->request->post['product_id'];
        $this->data['selected_category'] = json_encode($this->request->post['product']['category_group']);
        
        $category = $this->model_merchant_product->getCategoryGroup();
        $this->data['category_list'] = $category;
                         
        $this->data['main_option_list'] = $this->model_merchant_product->getProductAllOption(true);
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        if($store['package_id']>0){
            $this->data['stock_status_list'] = $this->model_merchant_product->getProductStockStatus();
        }else{
            $this->data['stock_status_list'] = $this->model_merchant_product->getProductStockStatus(5);
        }
        
        $this->data['max_file_size'] = $this->max_size;
        $this->data['max_file_upload'] = $this->max_file;
        
        $this->template = 'merchant/product/updateproduct.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    /*
    public function uploadimage(){
        if(!isset($this->request->get['product_id'])){
            $this->merchant->set_notice("Invalid product id","error");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        
        $this->load->model('merchant/product');
        $data = array();
        $data['merchant_id'] = $this->merchant->getId();
        $data['product_id'] = $this->request->get['product_id'];
        $product = $this->model_merchant_product->getProduct($data);
        if(!$product){
            $this->merchant->set_notice("Invalid product id","error");
            $this->redirect($this->merchant->link('merchant/product',"merchant_id=".$this->merchant->getId()));
        }
        
        $this->merchant->merchant_dir_check($this->request->get['product_id']);
        $files = array();
        if ($dh = opendir($targetPath)) {
            while (($file = readdir($dh)) !== false) {
                if($file!='.' && $file!='..'){
                    $files[$file] = "/image/product/".$id."/".$file;
                }                
            }
            closedir($dh);
        }        
        $this->data['files'] = $files;
        $this->data['product_id'] = $id;
        $this->template = 'merchant/product/product_upload_image.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    */
    public function categorygroup(){        
        $this->load->model('merchant/product');
        
        if(isset($this->request->get['category_id'])){
            $this->data['selected_category'] = $this->request->get['category_id'];
        }
        $category = $this->model_merchant_product->getCategoryGroup();
        $this->data['category'] = $category;
        
        $this->template = 'merchant/product/categorygroup.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function ajaximageupload(){
        $error = 0;
        $msg = "";
        $json = new stdClass();
        $json->status = "error";        
        
        if (!empty($_FILES)) {
            $filename = $_FILES['file']['name'];
            $ext = "";
            $tempFile = $_FILES['file']['tmp_name'];            
            $category = "product";
            
            if(filesize($tempFile)>($this->max_size*1024*1024)){
                $msg = "Your uploaded image file size exceed ".($this->max_size*1024)."Kb. Please upload image with the file size less than ".($this->max_size*1024)."Kb.";
                $error += 1;
            }
            $info = getimagesize($tempFile);
            if(!$info || !is_array($info)){
                $msg = "Invalid uploaded image.";
                $error += 1;
            }            
            if(($info[0]<640 && $info[1]<640)){
                $msg = "Image too small! (Minimum 640px X 640px)";
                $error += 1;
            }
            
            if(isset($this->request->get['product_id']) && strlen($this->request->get['product_id'])>0){
                $product_id = $this->request->get['product_id'];
            }else{                
                if(isset($this->request->get['merchant_id'])){
                    $merchant_id = $this->request->get['merchant_id'];
                }else{
                    $merchant_id = $this->merchant->getId();
                }
                $product_id = "session".DS.$merchant_id;
            }
            
            if(!$error){
                $this->merchant->merchant_dir_check($this->request->get['product_id']);
                $targetPath = DIR_IMAGE.$category.DS.$product_id.DS;
                /*
                $pos = strripos($filename, ".");
                if($pos>0){
                    $ext = substr($filename, $pos);
                    $filename = substr($filename, 0, $pos);
                }
                $newfn = str_ireplace(" ","-",$filename).".jpg";
            * 
            */                
                $newfn = $merchant_id."_".str_ireplace(".","_",microtime(true)).".jpg";
                $targetFile =  $targetPath.$newfn;
                
                if(file_exists($targetFile)){
                    unlink($targetFile);
                }
            }
             
            if(!$error){
                /*resize*/
                $image = new Image($tempFile);
                $image->resize( 'h');
                $image->save($targetFile,85);                
                
                $json->status = "success";
                $json->img_url = str_ireplace("\\","/","/image/product/".$product_id."/".$newfn);                
                $json->id = $newfn;
                
                $this->load->model('merchant/product');
                $this->model_merchant_product->insertProductImage(array("product_id"=>$product_id,"image"=>str_ireplace("\\","/","product/".$product_id."/".$newfn)));
            }
            unlink($tempFile);
        }        
        $json->text = $msg;
        $this->response->setOutput(json_encode($json));
    }
    
    public function ajaximageremove(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";
        
        $category = "product";            
            
        if(isset($this->request->post['product_id']) && strlen($this->request->post['product_id'])>0){
            $product_id = $this->request->post['product_id'];
        }else{
            if(isset($this->request->get['merchant_id'])){
                $merchant_id = $this->request->get['merchant_id'];
            }else{
                $merchant_id = $this->merchant->getId();
            }
            $product_id = "session".DS.$merchant_id;
        }        

        if(!$error){
            $image_id = $this->request->post['image_id'];
            $file = DIR_IMAGE.$category.DS.$product_id.DS.$image_id;
            $this->load->model('merchant/product');
            $this->model_merchant_product->deleteProductImage(array("product_id"=>$product_id,"image"=>str_ireplace("\\","/","product/".$product_id."/".$image_id)));
            if(is_file($file)){
                unlink($file);
            }
            $json->status = "success";
        }
        
        $this->response->setOutput(json_encode($json));
    }
    /*
    public function ajaxproductremove(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";           
        
        $this->load->model('merchant/product');
        $data = $this->request->post;
        if(isset($this->request->get['merchant_id'])){
            $data['merchant_id'] = $this->request->get['merchant_id'];
        }else{
            $data['merchant_id'] = $this->merchant->getId();
        }
        
        if(isset($this->request->post['product_id']) && strlen($this->request->post['product_id'])>0){
            $product = $this->model_merchant_product->getProduct($data);
            if(!$product){
                $json->text = "Invalid product id!";
                $error = 1;
            }
        }else{
            $json->text = "Invlid product id!";
            $error = 1;
        }        

        if(!$error){
            $query_result = $this->model_merchant_product->deleteProduct($data);
            if($query_result){
                $json->text = "Product deleted!";
                $json->status = "success";
            }
        }
        
        $this->response->setOutput(json_encode($json));
    }
    */
    public function ajaxproductpause(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";           
        
        $this->load->model('merchant/product');
        $data = $this->request->post;
        if(isset($this->request->get['merchant_id'])){
            $data['merchant_id'] = $this->request->get['merchant_id'];
        }else{
            $data['merchant_id'] = $this->merchant->getId();
        }
        
        if(isset($this->request->post['product_id']) && strlen($this->request->post['product_id'])>0){
            $product = $this->model_merchant_product->getProduct($data);
            if(!$product){
                $json->text = "Invalid product id!";
                $error = 1;
            }
        }else{
            $json->text = "Invlid product id!";
            $error = 1;
        }        

        if(!$error){
            $data['status'] = "1";
            if($product['status']=="1"){
                $data['status'] = "0";
            }
            $query_result = $this->model_merchant_product->updateProductStatus($data);
            if ($query_result) {
                /*
                $dir = DIR_IMAGE."product".DS.$this->request->post['product_id'].DS;
                if(is_dir($dir)){
                    rmdir($dir);                    
                    $json->text = "Product deleted!";
                    $json->status = "success";
                }
                 * 
                 */
                $json->result = $data['status'];
                $json->text = "Product deleted!";
                $json->status = "success";
            }
        }
        
        $this->response->setOutput(json_encode($json));
    }

    public function order() {
        $this->template = 'merchant/product/orderlist.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_createproduct() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        $this->load->model('merchant/merchant');
        $merchant = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        $product_list = $this->model_merchant_product->getAllProduct($this->merchant->getId());
        /*
        if(sizeof($product_list)>5){
            $result->status = "product_error";            
            return $result;
        }
    */         
        if($error==0){
            $result = $this->extra_validate();
            if($result->status!="success"){
                return $result;
            }
        }
        
        if ($error==0) {
            $data = $this->request->post;            
            $data['store_id'] = $merchant['store_id'];
            $query_result = $this->model_merchant_product->createProduct($data);
            if ($query_result) {
                $result->id = $query_result;
                rename(DIR_IMAGE."product".DS."session".DS.$merchant['merchant_id'], DIR_IMAGE."product".DS.$result->id);
                $this->model_merchant_product->updateProductDefaultImage($result->id,  $data['image_list']);
                $msg = "Product created!";
            }else{
                $error += 1;
                $msg = "Product create error!";
            }
        }
        
        if($error>0){
            $result->status = "error";
            $result->text = $msg;
        }else{
            $result->status = "success";
            $result->text = $msg;
        }
        
        return $result;
    }
    
    private function validate_updateproduct() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        $data = array();
        $data['merchant_id'] = $this->merchant->getId();
        $data['product_id'] = $this->request->post['product_id'];
        $product = $this->model_merchant_product->getProduct($data);
        if(!$product){
            $result->status = "product_error";
            $result->text = "Invalid product id";
            return $result;
        }else{
            $this->request->post['product'] = $product;
        }
        
        if($error==0){
            $result = $this->extra_validate();
            if($result->status!="success"){
                return $result;
            }
        }
        
        if ($error==0) {
            $data = $this->request->post;            
            $query_result = $this->model_merchant_product->updateProduct($data);
            if ($query_result) {                
                $this->model_merchant_product->updateProductDefaultImage($data['product_id'],  $data['image_list']);
                $msg = "Product updated!";                
            }else{
                $error += 1;
                $msg = "Product update error!";
            }
        }
        
        if($error>0){
            $result->status = "error";
            $result->text = $msg;
        }else{
            $result->status = "success";
            $result->text = $msg;
        }
        
        return $result;
    }
    
    private function extra_validate() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;        
        
        if ($error==0 && $this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($error==0 && !in_array($this->request->post['form_action'], array("create","update"))) {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        
        if ($error==0 && !isset($this->request->post['category_group'])) {
            $msg = "Invalid category!";
            $error += 1;
        }
        
        if($error==0){
            $this->request->post['category_group'] = json_decode(html_entity_decode($this->request->post['category_group']),true);
            foreach($this->request->post['category_group'] as $category_id){
                $category = $this->model_merchant_product->getCategory(array('category_id'=>$category_id));
                if ($error==0 && !$category) {
                    $msg = "Invalid category!";
                    $error += 1;
                    break;
                }
            }
        }
        
        if($error==0){            
            $this->request->post['image_list'] = json_decode(html_entity_decode($this->request->post['image_list']),true);
        }
        
        if ($error == 0 && (utf8_strlen($this->request->post['name']) < 1)) {
            $msg = "Invalid product name!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['description']) < 1)) {
            $msg = "Invalid product description!";
            $error += 1;
        }
        if ($error == 0 && stripos(html_entity_decode($this->request->post['description']), "<script")!==FALSE) {
            $msg = "Invalid script in product description!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['price']) < 1 && is_numeric($this->request->post['price']))) {
            $msg = "Invalid product price!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['discount_price']) < 1 && is_numeric($this->request->post['discount_price']))) {
            $msg = "Invalid product discount price!";
            $error += 1;
        }
        if ($error == 0 && ($this->request->post['discount_price']<10)) {
            $msg = "Product discount price must greater than RM10!";
            $error += 1;
        }
        if ($error == 0 && ($this->request->post['discount_price']>=$this->request->post['price'])) {
            $msg = "Product discount price must lower than normal price!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['quantity']) < 1 && is_int($this->request->post['quantity']))) {
            $msg = "Invalid product quantity!";
            $error += 1;
        } 
        if ($error == 0 && (utf8_strlen($this->request->post['stock_status_id']) < 1 && is_int($this->request->post['stock_status_id']))) {
            $msg = "Invalid product out of stock status!";
            $error += 1;
        } 
        
        if($error==0 && strlen($this->request->post['start_date'])>0){
            $part = explode("-", $this->request->post['start_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2])!==TRUE) {
                $err_msg = "Invalid start date!";
                $error += 1;
            }else{
                $this->request->post['v_start_date'] = $part[2]."-".$part[1]."-".$part[0];
            }
        }
        
        if($error==0 && strlen($this->request->post['end_date'])>0){
            $part = explode("-", $this->request->post['end_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2])!==TRUE) {
                $err_msg = "Invalid end date!";
                $error += 1;
            }else{
                $this->request->post['v_end_date'] = $part[2]."-".$part[1]."-".$part[0];
            }
        }
                
        if ($error == 0 && strlen($this->request->post['v_start_date'])>0 && strlen($this->request->post['v_end_date'])>0 && strtotime($this->request->post['v_start_date'])>=strtotime($this->request->post['v_end_date'])) {
            $err_msg = "End date must greater than start date!";
            $error += 1;
        }
        
        if($error>0){
            $result->status = "error";
            $result->text = $msg;
        }else{
            $result->status = "success";
            $result->text = $msg;
        }
        
        return $result;
    }

}

?>