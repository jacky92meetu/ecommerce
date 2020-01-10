<?php

class ControllerMerchantProfile extends Controller {

    public function index() {
        $this->load->model('merchant/merchant');
        $merchant = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());        
        if(strlen($merchant['birthday'])>0 && $merchant['birthday']!='0000-00-00'){                
            $merchant['birthday'] = date('d-m-Y',strtotime($merchant['birthday']));
        }
        $merchant['gender'] = ($merchant['gender']==1)?"Male":($merchant['gender']==2)?"Female":"";
        $merchant['store_short_url'] = (strlen($merchant['store_short_url'])>0)?"http://".$merchant['store_short_url'].".ubib.my":"";
        $merchant['comp_desc'] = html_entity_decode($merchant['comp_desc']);
        $merchant['comp_operation_hour'] = html_entity_decode($merchant['comp_operation_hour']);
        $merchant['store_shipment'] = html_entity_decode($merchant['store_shipment']);
        $merchant['store_policy'] = html_entity_decode($merchant['store_policy']);
        $this->data['pdata'] = $merchant;
        
        $this->load->model('tool/image');
        $merchant['store_img_url'] = $this->model_tool_image->resize($merchant['store_img_url'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
        $merchant['store_img_cover'] = $this->model_tool_image->resize($merchant['store_img_cover'], 980, 240);
        $this->data['store_image'] = $this->merchant->image_link($merchant['store_img_url']);
        $this->data['store_image_cover'] = $this->merchant->image_link($merchant['store_img_cover']);
        
        $this->template = 'merchant/profile/profile.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function ajaximageupload(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";
        $width = "240";
        $height = "240";
        
        if (!empty($_FILES)) {
            $filename = $_FILES['file']['name'];
            $ext = "";
            $tempFile = $_FILES['file']['tmp_name'];            
            $category = "merchant";
            $merchant_id = $this->merchant->getId();
            
            if(!$error){
                $this->merchant->merchant_dir_check();
                $targetPath = DIR_IMAGE.$category.DS.$merchant_id.DS;                
                $newfn = $merchant_id."_".str_ireplace(".","_",microtime(true))."_".$width."x".$height.".jpg";
                $targetFile =  $targetPath.$newfn;                
            }
             
            if(!$error){
                /*resize*/
                $image = new Image($tempFile);
                $image->resize($width, $height, 'h');
                $image->save($targetFile,85);
                
                $json->status = "success";
                $this->load->model('tool/image');
                $json->img_url = $this->model_tool_image->resize("merchant/".$merchant_id."/".$newfn, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
                $json->img_url = $this->merchant->image_link($json->img_url);
                $json->id = $newfn;
                
                $this->load->model('merchant/merchant');
                $query_result = $this->model_merchant_merchant->updateProfileImage(array("merchant_id"=>$this->merchant->getId(),"image_url"=>str_ireplace("\\","/","merchant/".$merchant_id."/".$newfn)));
            }
            unlink($tempFile);
        }
        
        $this->response->setOutput(json_encode($json));
    }
    
    public function ajaximagecoverupload(){
        $error = 0;        
        $json = new stdClass();
        $json->status = "error";
        $width = "980";
        $height = "300";
        
        if (!empty($_FILES)) {
            $filename = $_FILES['file']['name'];
            $ext = "";
            $tempFile = $_FILES['file']['tmp_name'];            
            $category = "merchant";
            $merchant_id = $this->merchant->getId();
            
            if(!$error){
                $this->merchant->merchant_dir_check();
                $targetPath = DIR_IMAGE.$category.DS.$merchant_id.DS;                
                $newfn = $merchant_id."_".str_ireplace(".","_",microtime(true))."_".$width."x".$height.".jpg";
                $targetFile =  $targetPath.$newfn;                
            }
             
            if(!$error){
                /*resize*/
                $image = new Image($tempFile);
                $image->resize($width, $height, 'w');
                $image->save($targetFile,85);
                
                $json->status = "success";
                $json->img_url = str_ireplace("\\","/","/image/merchant/".$merchant_id."/".$newfn);
                $json->id = $newfn;
                
                $this->load->model('merchant/merchant');
                $query_result = $this->model_merchant_merchant->updateProfileCover(array("merchant_id"=>$this->merchant->getId(),"image_url"=>str_ireplace("\\","/","merchant/".$merchant_id."/".$newfn)));
            }
            unlink($tempFile);
        }
        
        $this->response->setOutput(json_encode($json));
    }
    
    public function package(){
        $this->load->model('merchant/merchant');
        $error = $this->validate_package();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];
            return $this->response->setOutput(json_encode($json));
        }        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");            
        }
        
        $this->template = 'merchant/profile/packagelist.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

    public function editprofile() {        
        $this->load->model('merchant/merchant');
        $error = $this->validate_editprofile();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];
            if($error->status=="success"){                
                unset($json->text);
                $this->merchant->set_notice($error->text, "success");
                $json->redirect = $this->merchant->link('merchant/profile',"merchant_id=".$this->merchant->getId());
            }
            return $this->response->setOutput(json_encode($json));
        }        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice("Merchant profile saved.", "success");
            $this->redirect($this->merchant->link('merchant/profile',"merchant_id=".$this->merchant->getId()));
        }        
                
        if(!isset($this->request->post['username'])){
            $merchant = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
            if(strlen($merchant['birthday'])>0 && $merchant['birthday']!='0000-00-00'){                
                $merchant['birthday'] = date('d-m-Y',strtotime($merchant['birthday']));
            }
            $this->data['pdata'] = $merchant;            
        }else{
            $this->data['pdata'] = $this->request->post;
        }

        $this->template = 'merchant/profile/editprofile.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function changepassword() {
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_changepassword();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){                
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];            
            if($error->status=="success"){                    
                $json->redirect = $this->merchant->link('merchant/profile',"merchant_id=".$this->merchant->getId());
                $this->merchant->set_notice($error->text, "success");                    
            }
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->merchant->link('merchant/profile',"merchant_id=".$this->merchant->getId()));
        }
        
        $this->data['pdata'] = $this->request->post;
        $this->data['pdata']['merchant_id'] = $this->merchant->getId();
        
        $this->template = 'merchant/profile/changepassword.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_editprofile() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "editprofile") {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        
        if ($error == 0 && (utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 255)) {
            $msg = "Invalid name!";
            $error += 1;
        }
        $part = explode("-", $this->request->post['birthday']);
        if ($error == 0 && checkdate($part[1], $part[0], $part[2])!==TRUE) {
            $msg = "Invalid birthday!";
            $error += 1;
        }else{
            $this->request->post['v_birthday'] = $part[2]."-".$part[1]."-".$part[0];
        }
        if ($error == 0 && (in_array($this->request->post['gender'],array(1,2)===FALSE))) {
            $msg = "Please choose your gender!";
            $error += 1;
        }
        if ($error == 0 && (utf8_strlen($this->request->post['comp_email'])>0 && ((utf8_strlen($this->request->post['comp_email']) > 255) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['comp_email'])))) {
            $msg = "Invalid email address!";
            $error += 1;
        }
        if ($error == 0 && stripos(html_entity_decode($this->request->post['comp_desc']), "<script")!==FALSE) {
            $msg = "Invalid script in company description!";
            $error += 1;
        }
        if ($error == 0 && stripos(html_entity_decode($this->request->post['comp_operation_hour']), "<script")!==FALSE) {
            $msg = "Invalid script in company operation hour!";
            $error += 1;
        }
        if ($error == 0 && stripos(html_entity_decode($this->request->post['store_shipment']), "<script")!==FALSE) {
            $msg = "Invalid script in store shipment!";
            $error += 1;
        }
        if ($error == 0 && stripos(html_entity_decode($this->request->post['store_policy']), "<script")!==FALSE) {
            $msg = "Invalid script in store policy!";
            $error += 1;
        }
        
        if ($error==0) {
            $data = $this->request->post;
            $data['merchant_id'] = $this->merchant->getId();
            $query_result = $this->model_merchant_merchant->editMerchant($data);            
            if ($query_result) {
                $msg = "Merchant profile saved.";                
            }else{
                $error += 1;
                $msg = "Merchant profile change error!";
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
    
    private function validate_changepassword() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "changepassword") {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        
        $merchant = $this->model_merchant_merchant->getMerchantById($this->merchant->getId());
        if ($error == 0 && ($this->request->post['old_password']!=$merchant['password'])) {
            $msg = "Your old password not match!";
            $error += 1;
        }        
        if ($error == 0 && (utf8_strlen($this->request->post['new_password']) < 1)) {
            $msg = "Invalid new password!";
            $error += 1;
        }        
        if ($error == 0 && ($this->request->post['new_password']!=$this->request->post['new_password2'])) {
            $msg = "New password & confirm password not match!";
            $error += 1;
        }
        
        if ($error==0) {
            $data = $this->request->post;
            $data['merchant_id'] = $merchant['merchant_id'];
            $query_result = $this->model_merchant_merchant->changePassword($data);
            if ($query_result) {
                $msg = "Merchant password saved.";                
            }else{
                $error += 1;
                $msg = "Merchant password change error!";
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
    
    private function validate_package() {
        $this->load->model('merchant/message');
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        if ($error == 0 && strlen($this->request->post['msg']) <= 0) {
            $err_msg = "Invalid choice";
            $error += 1;
        }
        
        if ($error==0) {
            $user_info = $this->merchant->getInfo();            
            $message = $this->model_merchant_message->getTemplateMessage("buy01",$user_info['store_name'],$user_info['name'],$user_info['comp_tel'],$user_info['email'],$this->request->post['msg']);
            $status = false;
            if($message){
                $status = $this->merchant->send_mail("sales@ubib.my",$message['title'],$message['message']);
            }
            
            if ($status) {                
                $message = $this->model_merchant_message->getTemplateMessage("buy02",$this->request->post['msg']);
                if($message){                    
                    $this->model_merchant_message->sendMessage(array("merchant_id"=>$this->merchant->getId(),"code"=>"buy02","message"=>$this->request->post['html']));
                }
            }
            
            if($status){
                $msg = "Your request have been made and please wait for our sales team to contact you.";
            }else{                
                $error += 1;
                $msg = "Buy package error!";
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
   
}

?>