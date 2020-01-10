<?php

class ControllerMerchantRegister extends Controller {

    public function index() {
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_register();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){                
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];
            if($error->status=="success"){
                $json->text = "";
                $this->merchant->login($this->request->post['email'], $this->request->post['password']);                
                $json->redirect = $this->url->link('merchant/dashboard');
                $this->merchant->set_notice($error->text, "success");
            }
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");            
        }       
        
        if($error){
            $this->merchant->set_notice($error,"error");
        }        

        $this->data['pdata'] = $this->request->post;

        $this->template = 'merchant/login/login.tpl';
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_register() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        
        if ($this->request->post['form_action'] != "register") {
            $error += 1;
        }
        if ($error == 0 && ((utf8_strlen($this->request->post['email']) > 255) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {
            $msg = "Invalid email address!";
            $error += 1;
        }

        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->post['email']);
        if ($error == 0 && $user_info) {
            $msg = "Email exists! Please choose another email address.";
            $error += 1;
        }

        if ($error == 0 && (utf8_strlen($this->request->post['name']) < 1) || (utf8_strlen($this->request->post['name']) > 255)) {
            $msg = "Invalid name!";
            $error += 1;
        }
        
        if ($error == 0 && (utf8_strlen($this->request->post['store_name']) < 1) || (utf8_strlen($this->request->post['store_name']) > 255)) {
            $msg = "Invalid store name!";
            $error += 1;
        }
        
        if ($error == 0 && (utf8_strlen($this->request->post['password']) < 6)) {
            $msg = "Password must contains 6 or more characters!";
            $error += 1;
        }
        /*
        if ($error == 0 && $this->request->post['password2'] != $this->request->post['password']) {
            $msg = "Confirm password not match!";
            $error += 1;
        }         
         */
        /*
          if ($error==0 && (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha']))) {
          $msg = "Invalid captcha!";
          $error += 1;
          }
         * 
         */
        
        if ($error==0) {
            $this->request->post['activation_code'] = $this->merchant->generate_code();
            $query_result = $this->model_merchant_merchant->addMerchant($this->request->post);
            if($query_result){
                $this->load->model('merchant/message');
                $message = $this->model_merchant_message->getTemplateMessage("wel01");                
                $this->model_merchant_message->sendMessage(array("merchant_id"=>$query_result,"code"=>"wel01"));
                $message = $this->model_merchant_message->getTemplateMessage("wel02",$this->request->post['name'], $this->request->post['email'], $this->request->post['store_name']);
                if($message){                    
                    $this->merchant->send_mail($this->request->post['email'],$message['title'],$message['message']);
                }
                $msg = "Merchant registered successfully. Welcome to the merchant dashboard.";
            }else{
                $error += 1;
                $msg = "Registration error!";                
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