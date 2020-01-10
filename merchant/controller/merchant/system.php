<?php

class ControllerMerchantSystem extends Controller {

    public function __construct($registry) {
        parent::__construct($registry);
        if ($this->merchant->getInfo("user_type") != 1) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
    }

    public function index() {
        $this->link();
    }

    public function link() {
        $option = array(            
            "order" => array("modified_date"=>"desc","sort_order" => "asc"),
            "route" => "merchant/system/link"
        );
        $data_header = array();
        $data_header['link_id'] = array("display_name" => "Link ID", "url" => "/merchant/system/link_manage?link_type={link_type}&link_id={link_id}");
        $data_header['link_name'] = array("display_name" => "Link Name", "url" => "/merchant/system/link_manage?link_type={link_type}&link_id={link_id}");
        $data_header['link_type'] = array("display_name" => "Link Type", "status_value" => array("" => '<span class="label label-sm label-grey">Default</span>',"redirect" => '<span class="label label-sm label-success">Redirect</span>', "page" => '<span class="label label-sm label-info">Page</span>', "product" => '<span class="label label-sm label-warning">Product</span>'));
        /*
        $data_header['link_value'] = array("display_name" => "Link Value", "content" => function($record) {
        $content = "";
        $temp = json_decode($record['link_value'],true);        
        foreach ($temp as $key => $value) {
            $temp = $value;
            if(is_array($value)){                
                $temp = "<ul>";
                foreach($value as $key2 => $value2){
                    if(is_array($value2)){
                        if($key2=="filter_option_value"){
                            foreach($value2 as $key3 => $value3){
                                if(strlen($value3)>0){
                                    $temp2 = (isset($value['filter_option_op']) && isset($value['filter_option_op'][$key3]))?$value['filter_option_op'][$key3]:" = ";
                                    $temp .= "<li>".$key3." ".$temp2." ".$value3."</li>";
                                }                                
                            }
                        }else if($key2=="filter_sort_name"){
                            foreach($value2 as $key3 => $value3){
                                if(strlen($value3)>0){
                                    $temp2 = (isset($value['filter_sort_order']) && isset($value['filter_sort_order'][$key3]))?$value['filter_sort_order'][$key3]:" = ";
                                    $temp .= "<li>".$value3." ".$temp2."</li>";
                                }                                
                            }
                        }
                    }else{
                        $temp .= "<li>".$key2.": ".$value2."</li>";
                    }                    
                }
                $temp .= "</ul>";
            }else{
                $len = 200;                
                if(utf8_strlen($temp)>$len){
                    $pos = utf8_strrpos(utf8_substr($temp,0,$len), " ");
                    $temp = utf8_substr($temp,0,$pos)."<strong> ...</strong>";
                }
            }
            $content .= "<div>" . $key . " : " . $temp . "</div>";
        }
        return $content;
    });
    */
        $this->load->model('merchant/link');
        $temp = array("" => "default");
        foreach($this->model_merchant_link->getLinkPosition() as $value){
            $temp[$value['position_id']] = $value['position_name'];
        }
        $data_header['link_position'] = array("display_name" => "Link Position", "status_value" => $temp);
        $data_header['link_status'] = array("display_name" => "Link Status", "status_value" => array("0" => '<span class="label label-sm label-danger">Disabled</span>', "1" => '<span class="label label-sm label-success">Enabled</span>'));
        $data_header['sort_order'] = array("display_name" => "Sort Order");
        $data_header['modified_date'] = array("display_name" => "Modified Date");
        $this->data['report_title'] = "Link List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        $button_group['create_redirect'] = array("display_name" => "Redirect Link", "url" => "/merchant/system/link_manage?link_type=redirect", "icon_class" => "fa-plus", "class" => "btn-success");
        $button_group['create_page'] = array("display_name" => "Page Link", "url" => "/merchant/system/link_manage?link_type=page", "icon_class" => "fa-plus", "class" => "btn-info");
        $button_group['create_product'] = array("display_name" => "Product Link", "url" => "/merchant/system/link_manage?link_type=product", "icon_class" => "fa-plus", "class" => "btn-warning");        
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        $tool_group['view'] = array("display_name" => "View", "url" => "/merchant/system/link_manage?link_type={link_type}&link_id={link_id}", "icon_class" => "fa-file-o");
        $tool_group['delete'] = array("display_name" => "Delete", "url" => "/merchant/system/link_delete?link_id={link_id}", "icon_class" => "fa-trash-o red", "confirm" => "Confirm to delete {link_name}?");
        $tool_group['duplicate'] = array("display_name" => "Duplicate", "url" => "/merchant/system/link_duplicate?link_id={link_id}", "icon_class" => "fa-refresh green", "confirm" => "Confirm to duplicate {link_name}?");
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT * FROM " . DB_PREFIX . "merchant_management_link", $option, TRUE);

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

    public function link_delete() {
        $this->load->model('merchant/link');
        $link = $this->model_merchant_link->getLinkById($this->request->get['link_id']);
        if ($link) {
            $result = $this->model_merchant_link->deleteLink($link['link_id']);
            $this->merchant->set_notice($link['link_type'] . " link (" . $link['link_name'] . ") deleted successfully.", "success");
        } else {
            $this->merchant->set_notice("Link delete error!", "error");
        }
        $this->link();
    }
    
    public function link_duplicate() {
        $this->load->model('merchant/link');
        $link = $this->model_merchant_link->getLinkById($this->request->get['link_id']);
        if ($link) {
            $result = $this->model_merchant_link->duplicateLink($link['link_id']);
            $this->merchant->set_notice($link['link_type'] . " link (" . $link['link_name'] . ") duplicated successfully.", "success");            
            $this->redirect($this->url->link('merchant/system/link_manage',"link_type=".$link['link_type']."&link_id=".$result));
        } else {
            $this->merchant->set_notice("Link duplicate error!", "error");
        }
        $this->link();
    }

    public function link_manage() {
        $this->load->model('merchant/link');

        $link_type = $this->request->get['link_type'];
        $available_type = array("redirect", "page", "product");
        if (array_search($link_type, $available_type) === FALSE) {
            $this->merchant->set_notice("Invalid link type!", "error");
            $this->redirect($this->url->link('merchant/system/link'));
        }
        $this->request->post['link_type'] = $link_type;
        if (!method_exists($this, "validate_link_type_" . $link_type)) {
            $this->merchant->set_notice("Invalid link type!", "error");
            $this->redirect($this->url->link('merchant/system/link'));
        }

        $error = call_user_func(array($this,"validate_link_type_" . $link_type));

        if ($error->status != 'pass' && isset($this->request->post['isajax'])) {
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            if ($error->status == "success") {
                unset($json->text);
                $json->redirect = $this->url->link('merchant/system/link');
                $this->merchant->set_notice($error->text, "success");
            }
            return $this->response->setOutput(json_encode($json));
        }

        if ($error->status == "error") {
            $this->merchant->set_notice($error->text, "error");
        }
        if ($error->status == "success") {
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->url->link('merchant/system/link'));
        }
        
        if (utf8_strlen($this->request->post['link_name']) < 1 && isset($this->request->get['link_id'])) {
            $link = $this->merchant->getLinkManagement($this->request->get['link_id']);            
            if (strlen($link['link_value']['start_date']) > 0 && $link['link_value']['start_date'] != '0000-00-00') {
                $link['start_date'] = date('d-m-Y', strtotime($link['link_value']['start_date']));
            } else {
                $link['start_date'] = "";
            }
            if (strlen($link['link_value']['end_date']) > 0 && $link['link_value']['end_date'] != '0000-00-00') {
                $link['end_date'] = date('d-m-Y', strtotime($link['link_value']['end_date']));
            } else {
                $link['end_date'] = "";
            }
            $this->request->post = array_merge($this->request->post, $link);
        }

        $this->data['pdata'] = $this->request->post;

        
        $available_position = $this->model_merchant_link->getLinkPosition();
        $this->data['available_position'] = array();
        foreach($available_position as $key => $value){
            $this->data['available_position'][$value['position_id']] = $value;
        }        

        $available_status = array("1" => "Enabled", "0" => "Disabled");
        $this->data['available_status'] = $available_status;

        $this->template = 'merchant/link/link_' . $link_type . '.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function floor() {
        $option = array(            
            "order" => array("modified_date"=>"desc","sort_order" => "asc"),
            "route" => "merchant/system/floor"
        );
        $data_header = array();
        $data_header['floor_id'] = array("display_name" => "Floor ID", "url" => "/merchant/system/floor_manage?floor_id={floor_id}");
        $data_header['floor_name'] = array("display_name" => "Floor Name", "url" => "/merchant/system/floor_manage?floor_id={floor_id}");        
        $data_header['floor_status'] = array("display_name" => "Floor Status", "status_value" => array("0" => '<span class="label label-sm label-danger">Disabled</span>', "1" => '<span class="label label-sm label-success">Enabled</span>'));
        $data_header['sort_order'] = array("display_name" => "Sort Order");
        $data_header['modified_date'] = array("display_name" => "Modified Date");
        $this->data['report_title'] = "Floor List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        $button_group['create_floor'] = array("display_name" => "New Floor", "url" => "/merchant/system/floor_manage", "icon_class" => "fa-plus", "class" => "btn-success", "confirm" => "Please enter name to create a new floor.","is_prompt"=>1);        
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        $tool_group['view'] = array("display_name" => "View", "url" => "/merchant/system/floor_manage?floor_id={floor_id}", "icon_class" => "fa-file-o");
        $tool_group['delete'] = array("display_name" => "Delete", "url" => "/merchant/system/floor_delete?floor_id={floor_id}", "icon_class" => "fa-trash-o red", "confirm" => "Confirm to delete {floor_name}?");
        $tool_group['duplicate'] = array("display_name" => "Duplicate", "url" => "/merchant/system/floor_duplicate?floor_id={floor_id}", "icon_class" => "fa-refresh green", "confirm" => "Confirm to duplicate {floor_name}?");
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT * FROM " . DB_PREFIX . "merchant_management_floor", $option, TRUE);

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function floor_manage() {
        $this->load->model('merchant/floor');
        
        $error = $this->validate_floor_manage();

        if ($error->status != 'pass' && isset($this->request->post['isajax'])) {
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            if ($error->status == "success") {
                unset($json->text);
                $json->redirect = $this->url->link('merchant/system/floor');
                $this->merchant->set_notice($error->text, "success");
            }
            return $this->response->setOutput(json_encode($json));
        }

        if ($error->status == "error") {
            $this->merchant->set_notice($error->text, "error");
        }
        if ($error->status == "success") {
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->url->link('merchant/system/floor'));
        }
        
        if (utf8_strlen($this->request->post['floor_name']) < 1 && isset($this->request->get['floor_id'])) {
            $temp = $this->model_merchant_floor->getLinkById($this->request->get['floor_id']);            
            $temp['floor_value'] = json_decode($temp['floor_value'],true);
            $temp['floor_value']['stringify_template_image'] = json_encode($temp['floor_value']['template_image']);
            if (strlen($temp['floor_value']['start_date']) > 0 && $temp['floor_value']['start_date'] != '0000-00-00') {
                $temp['start_date'] = date('d-m-Y', strtotime($temp['floor_value']['start_date']));
            } else {
                $temp['start_date'] = "";
            }
            if (strlen($temp['floor_value']['end_date']) > 0 && $temp['floor_value']['end_date'] != '0000-00-00') {
                $temp['end_date'] = date('d-m-Y', strtotime($temp['floor_value']['end_date']));
            } else {
                $temp['end_date'] = "";
            }
            $this->request->post = array_merge($this->request->post, $temp);
        }
        
        
        $this->merchant->merchant_dir_check();
        $targetPath = DIR_IMAGE."floor_template".DS."temp".DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        $targetPath = DIR_IMAGE."floor_template".DS."temp".DS.$this->request->post['floor_id'].DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        array_map('unlink', glob(DIR_IMAGE."floor_template".DS."temp".DS.$this->request->post['floor_id'].DS."*.jpg"));
        foreach(glob(DIR_IMAGE."floor_template".DS.$this->request->post['floor_id'].DS."*.jpg") as $file){
            copy($file,str_ireplace("floor_template", "floor_template".DS."temp", $file));
        }

        $this->data['pdata'] = $this->request->post;        

        $available_status = array("1" => "Enabled", "0" => "Disabled");
        $this->data['available_status'] = $available_status;
        
        $available_template = array();
        if ($dh = @opendir(DIR_TEMPLATE."floor_template")) {
            while (($file = readdir($dh)) !== false) {                
                if(substr($file,-4)==".tpl"){                    
                    $name = substr($file,0,  strrpos($file, "."));                    
                    $available_template[$name] = $name;
                }                
            }
            closedir($dh);
        }        
        $this->data['available_template'] = $available_template;

        $this->template = 'merchant/floor/floor_manage.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function ajaxloadtemplate(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";
            
        if(isset($this->request->get['template']) && strlen($this->request->get['template'])>0){
            $file = DIR_TEMPLATE."floor_template".DS.$this->request->get['template'].".tpl";
            if(is_file($file)){
                ob_start();
                require $file;
                $json->html = ob_get_contents();
                ob_end_clean();
                $json->status = "success";
            }            
        }
        
        $this->response->setOutput(json_encode($json));
    }
    
    public function ajaxloadtemplateimage(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";
        $image_list = array();
        $this->merchant->merchant_dir_check();
        if(file_exists(DIR_IMAGE."floor_template")){
            $targetPath = DIR_IMAGE."floor_template".DS;
            if ($dh = opendir($targetPath)) {
                while (($file = readdir($dh)) !== false) {                    
                    if(substr($file,-4)==".jpg"){                        
                        $image_list[$file] = "/image/floor_template/".$file;
                    }                
                }
                closedir($dh);
            }            
        }
        if(file_exists(DIR_IMAGE."product")){
            foreach(glob(DIR_IMAGE."product/*",GLOB_ONLYDIR) as $dir){
                $targetPath = $dir.DS;
                if ($dh = opendir($targetPath)) {
                    while (($file = readdir($dh)) !== false) {
                        if(substr($file,-4)==".jpg"){
                            $image_list[] = array("file_id"=>"/image/product/".  basename($dir)."/".$file,"file_url"=>"/image/product/".  basename($dir)."/".$file);
                        }                
                    }
                    closedir($dh);
                }                
            }            
        }
        $json->image_list = $image_list;
        $json->file_length = sizeof($image_list);
        $json->status = "success";        
        
        $this->response->setOutput(json_encode($json));
    }
    
    public function ajaxuploadtemplateimage(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";        
        $this->load->model('merchant/floor');
        $floor = $this->model_merchant_floor->getLinkById($this->request->get['floor_id']);
        if ($floor) {
            $this->merchant->merchant_dir_check();            
            $targetPath = DIR_IMAGE."floor_template".DS."temp".DS;
            if(!is_dir($targetPath)){
                mkdir($targetPath);
            }
            $targetPath = DIR_IMAGE."floor_template".DS."temp".DS.$floor['floor_id'].DS;
            if(!is_dir($targetPath)){
                mkdir($targetPath);
            }
            if(!$error){
                $pos = strripos($filename, ".");
                if($pos>0){
                    $ext = substr($filename, $pos);
                    $filename = substr($filename, 0, $pos);
                }
                $newfn = $this->request->post['image_id'].".jpg";                
                $targetFile =  $targetPath.$newfn;                
                if(file_exists($targetFile)){
                    unlink($targetFile);
                }
            }
            $file = $this->merchant->image_path($this->request->post['transform_info']['image_src']);
            if(!$error && $file){
                /*resize*/
                $image = new Image($file);
                $image->resize($this->request->post['transform_info']['image_width'],$this->request->post['transform_info']['image_height'], false);
                $image->crop($this->request->post['transform_info']['image_x'],$this->request->post['transform_info']['image_y'],$this->request->post['transform_info']['image_x2'],$this->request->post['transform_info']['image_y2']);
                $image->save($targetFile,85);
                $json->status = "success";
                $json->img_url = str_ireplace("\\","/","/image/floor_template/temp/".$floor['floor_id']."/".$newfn);
                $json->id = $newfn;
            }else if(isset($this->request->post['image_class'])){
                $temp = explode("_",$this->request->post['image_class']);
                $json->img_url = "/image/floor_template/default/box-".$temp[2]."px-".$temp[3]."px.jpg";
            }else{
                $json->img_url = "";
            }
            $json->status = "success";
            unlink($tempFile);
        }
        
        $this->response->setOutput(json_encode($json));
    }

    private function validate_link_type_redirect() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;

        if ($error == 0) {
            $result = $this->validate_link_extra();
            if ($result->status != "success") {
                return $result;
            }
        }

        if ($error == 0 && (utf8_strlen($this->request->post['link_value']['link_url']) < 1)) {
            $msg = "Invalid link url!";
            $error += 1;
        }

        if ($error == 0) {
            $result = $this->validate_link_process();
            return $result;
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }

    private function validate_link_type_page() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;

        if ($error == 0) {
            $result = $this->validate_link_extra();
            if ($result->status != "success") {
                return $result;
            }
        }

        if ($error == 0 && (utf8_strlen($this->request->post['link_value']['content']) < 1)) {
            $msg = "Invalid page content!";
            $error += 1;
        }
        
        if ($error == 0 && stripos(html_entity_decode($this->request->post['link_value']['content']), "<script")!==FALSE) {
            $msg = "Invalid script in page content!";
            $error += 1;
        }

        if ($error == 0) {
            $result = $this->validate_link_process();
            return $result;
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }
    
    private function validate_link_type_product() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        $this->load->model('merchant/product');
        $category = $this->model_merchant_product->getCategoryGroup();        
        $this->data['category_list'] = $category;        

        if ($error == 0) {
            $result = $this->validate_link_extra();
            if ($result->status != "success") {
                return $result;
            }
        }
        
        if (is_array($this->request->post['link_value'])) {
            foreach($this->request->post['link_value']['filter_option']['filter_option_op'] as $key => $value){
                $this->request->post['link_value']['filter_option']['filter_option_op'][$key] = html_entity_decode($value);
            }            
        }        

        if ($error == 0) {
            $result = $this->validate_link_process();
            return $result;
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }

    private function validate_link_extra() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;

        if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['link_id'])) {
            if(isset($this->request->get['link_type'])){
                $link = $this->merchant->getLinkManagement($this->request->get['link_id']);
                if(!$link || strcasecmp($link['link_type'], $this->request->get['link_type'])!=0){
                    $this->merchant->set_notice("Invalid link type!", "error");
                    $this->redirect($this->url->link('merchant/system/link'));
                }
            }
            $this->request->post['link_id'] = $this->request->get['link_id'];
        }

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }

        if ($error == 0 && (utf8_strlen($this->request->post['link_name']) < 1)) {
            $msg = "Invalid link name!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['sort_order']) > 0) && is_nan($this->request->post['sort_order'])) {
            $msg = "Invalid sort order!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['link_status']) < 1)) {
            $msg = "Invalid link status!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['link_position']) < 1)) {
            $msg = "Invalid link position!";
            $error += 1;
        }
        if ($error == 0 && $this->request->post['link_position']=="6") {
            $this->load->model('merchant/floor');
            $temp = $this->model_merchant_floor->getLinkById($this->request->post['link_value']['display_option']['floor_id']);
            if(!$temp){
                $msg = "Invalid floor id!";
                $error += 1;
            }            
        }
        if ($error == 0 && (utf8_strlen($this->request->post['sort_order']) < 1)) {
            $this->request->post['sort_order'] = 0;
        }
        if ($error == 0 && strlen($this->request->post['start_date']) > 0) {
            $part = explode("-", $this->request->post['start_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2]) !== TRUE) {
                $err_msg = "Invalid date!";
                $error += 1;
            } else {
                $this->request->post['link_value']['start_date'] = $part[2] . "-" . $part[1] . "-" . $part[0];
            }
        }
        if ($error == 0 && strlen($this->request->post['end_date']) > 0) {
            $part = explode("-", $this->request->post['end_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2]) !== TRUE) {
                $err_msg = "Invalid date!";
                $error += 1;
            } else {
                $this->request->post['link_value']['end_date'] = $part[2] . "-" . $part[1] . "-" . $part[0];
            }
        }
        if ($error == 0 && (strlen($this->request->post['link_value']['start_date']) > 0 && strlen($this->request->post['link_value']['end_date']) > 0 && strtotime($this->request->post['link_value']['start_date']) >= strtotime($this->request->post['link_value']['start_date']) || strlen($this->request->post['link_value']['start_date']) == 0 && strlen($this->request->post['link_value']['end_date']) > 0)) {
            $temp = $this->request->post['link_value']['start_date'];
            $this->request->post['link_value']['start_date'] = $this->request->post['link_value']['end_date'];
            $this->request->post['link_value']['end_date'] = $temp;
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }

    private function validate_link_process() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;

        if ($error == 0) {
            if (is_array($this->request->post['link_value'])) {
                $this->request->post['link_value'] = json_encode($this->request->post['link_value']);
            }
            $data = $this->request->post;
            if (isset($data['link_id']) && utf8_strlen($data['link_id'])>0) {
                $query_result = $this->model_merchant_link->updateLink($data);
                if ($query_result) {
                    $msg = ucfirst($data['link_type']) . " link(" . $data['link_name'] . ") updated.";
                } else {
                    $error += 1;
                    $msg = "Redirect link update error!";
                }
            } else {
                $query_result = $this->model_merchant_link->createLink($data);
                if ($query_result) {
                    $msg = "New " . ucfirst($data['link_type']) . " link(" . $data['link_name'] . ") saved.";
                } else {
                    $error += 1;
                    $msg = "Add redirect link error!";
                }
            }
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }
    
    private function validate_floor_manage() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;

        if ($error == 0) {
            $result = $this->validate_floor_extra();
            if ($result->status != "success") {
                return $result;
            }
        }

        if ($error == 0) {
            if (is_array($this->request->post['floor_value'])) {
                $this->request->post['floor_value']['template_image'] = json_decode(html_entity_decode($this->request->post['floor_value']['template_image']), true);
                $this->request->post['floor_value'] = json_encode($this->request->post['floor_value']);
            }
            $data = $this->request->post;            
            if (isset($data['floor_id']) && utf8_strlen($data['floor_id'])>0) {
                $query_result = $this->model_merchant_floor->updateFloor($data);
                if ($query_result) {
                    $targetPath = DIR_IMAGE."floor_template".DS;
                    if(!is_dir($targetPath)){
                        mkdir($targetPath);
                    }
                    $targetPath = DIR_IMAGE."floor_template".DS.$this->request->post['floor_id'].DS;
                    if(!is_dir($targetPath)){
                        mkdir($targetPath);
                    }
                    array_map('unlink', glob(DIR_IMAGE."floor_template".DS.$this->request->post['floor_id'].DS."*.jpg"));
                    foreach(glob(DIR_IMAGE."floor_template".DS."temp".DS.$this->request->post['floor_id'].DS."*.jpg") as $file){
                        copy($file,str_ireplace("floor_template".DS."temp", "floor_template", $file));
                    }
                    $msg = "Floor(" . $data['floor_name'] . ") updated.";
                } else {
                    $error += 1;
                    $msg = "Floor update error!";
                }
            } else {
                $error += 1;
                $msg = "Add floor error!";
            }
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }
    
    private function validate_floor_extra() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
         if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['prompt_value'])) {
            $data = array('floor_name'=>$this->request->get['prompt_value']);
            $query_result = $this->model_merchant_floor->createFloor($data);
            if ($query_result) {                
                $this->merchant->set_notice("New Floor(" . $data['floor_name'] . ") created.Please enter other information and save it.", "success");                
                $this->request->get['floor_id'] = $query_result;
            }else{
                $this->merchant->set_notice("Add floor error!", "error");
                $this->redirect($this->url->link('merchant/system/floor'));
            }            
        }

        if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['floor_id'])) {
            $temp = $this->model_merchant_floor->getLinkById($this->request->get['floor_id']);
            if(!$temp){
                $this->merchant->set_notice("Invalid floor id!", "error");
                $this->redirect($this->url->link('merchant/system/floor'));
            }
            $this->request->post['floor_id'] = $this->request->get['floor_id'];
        }

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }

        if ($error == 0 && (utf8_strlen($this->request->post['floor_name']) < 1)) {
            $msg = "Invalid name!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['sort_order']) > 0) && is_nan($this->request->post['sort_order'])) {
            $msg = "Invalid sort order!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['floor_status']) < 1)) {
            $msg = "Invalid status!";
            $error += 1;
        }        
        if ($error == 0 && (utf8_strlen($this->request->post['sort_order']) < 1)) {
            $this->request->post['sort_order'] = 0;
        }
        if ($error == 0 && strlen($this->request->post['start_date']) > 0) {
            $part = explode("-", $this->request->post['start_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2]) !== TRUE) {
                $err_msg = "Invalid date!";
                $error += 1;
            } else {
                $this->request->post['floor_value']['start_date'] = $part[2] . "-" . $part[1] . "-" . $part[0];
            }
        }
        if ($error == 0 && strlen($this->request->post['end_date']) > 0) {
            $part = explode("-", $this->request->post['end_date']);
            if ($error == 0 && checkdate($part[1], $part[0], $part[2]) !== TRUE) {
                $err_msg = "Invalid date!";
                $error += 1;
            } else {
                $this->request->post['floor_value']['end_date'] = $part[2] . "-" . $part[1] . "-" . $part[0];
            }
        }
        if ($error == 0 && (strlen($this->request->post['floor_value']['start_date']) > 0 && strlen($this->request->post['floor_value']['end_date']) > 0 && strtotime($this->request->post['floor_value']['start_date']) >= strtotime($this->request->post['floor_value']['start_date']) || strlen($this->request->post['floor_value']['start_date']) == 0 && strlen($this->request->post['floor_value']['end_date']) > 0)) {
            $temp = $this->request->post['floor_value']['start_date'];
            $this->request->post['floor_value']['start_date'] = $this->request->post['floor_value']['end_date'];
            $this->request->post['floor_value']['end_date'] = $temp;
        }

        if ($error > 0) {
            $result->status = "error";
            $result->text = $msg;
        } else {
            $result->status = "success";
            $result->text = $msg;
        }

        return $result;
    }

}

?>