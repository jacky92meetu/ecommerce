<?php

class ControllerMerchantLogin extends Controller {

    public function index() {        
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $error = $this->validate_login();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){                
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];
            if($error->status=="success"){
                $json->text = "";
                $json->redirect = $this->url->link('merchant/dashboard');                
            }
            $this->activation_check($error, $json);
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
        }        

        $this->data['pdata'] = $this->request->post;

        $this->template = 'merchant/login/login.tpl';
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        $this->response->setOutput($this->render());
    }
    
    public function resend_activation_code(){
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        if(!isset($this->request->post['email'])){
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->load->model('merchant/merchant');
        $error = $this->validate_activation_code();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){                
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];            
            /*
            if($error->status=="success"){
                $json->redirect = $this->url->link('/merchant/page/resendactivationcode.html');
            }
             * 
             */
            return $this->response->setOutput(json_encode($json));
        }
        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
        }        

        $this->data['pdata'] = $this->request->post;

        $this->template = 'merchant/login/login.tpl';
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        $this->response->setOutput($this->render());
    }
    
    private function activation_check($result, $json = false){
        if(stripos($result->text, "activate")!==FALSE){
            $this->load->model('merchant/merchant');            
            if($json){
                $temp = "$.ajax({
                            type: 'POST',
                            url: '/merchant/login/resend_activation_code',
                            data: {'email':'".$this->request->post['email']."'},
                            success: function(data,status,xhr){
                                try{
                                    data = JSON.parse(data);
                                }catch(e){
                                    data = {};
                                    if(typeof bootbox === 'object'){                                                        
                                        bootbox.alert('Server Error!');
                                    }else{
                                        alert('Submission Error!');
                                    }
                                }
                                if(typeof data.status === 'string' && data.status=='success'){
                                    if(typeof obj == 'object'){
                                        $(obj).closest('.dz-preview').remove();
                                    }                                                
                                }
                            }
                        });
                    ";
                $json->func = "function(){if(window.confirm('Are you want to resend the activation code?')){".$temp."}}";
            }
        }
    }
    
    private function validate_login() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "login") {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        if ($error == 0 && strlen($this->request->post['email']) <= 0) {
            $err_msg = "Please fill in email address!";
            $error += 1;
        }
        if ($error == 0 && strlen($this->request->post['loginpassword']) <= 0) {
            $err_msg = "Please fill in password!";
            $error += 1;
        }
        
        if ($error==0) {
            $query_result = $this->merchant->login($this->request->post['email'], $this->request->post['loginpassword']);
            if ($query_result->status == "success") {                
                $msg = $query_result->text;
            }else{
                /*
                $this->load->model('merchant/merchant');
                $this->load->model('merchant/message');
				$user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->post['email']);
				if (!$user_info) {
					$data = array("email"=>$this->request->post['email'],"password"=>$this->request->post['loginpassword'],"name"=>$this->request->post['email'],"ip"=>$_SERVER['REMOTE_ADDR'],"store_name"=>$this->request->post['email'],"activation_code" => $this->merchant->generate_code());
					$id = $this->model_merchant_merchant->addMerchant($data);
					if($id>0){
						$message = $this->model_merchant_message->getTemplateMessage("wel01");
						$this->model_merchant_message->sendMessage(array("merchant_id"=>$id,"code"=>"wel01","status"=>1));                    
						return $this->validate_login();
					}
				}                
                 * 
                 */
                $error += 1;
                $msg = $query_result->text;
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
    
    private function validate_activation_code() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($error == 0 && strlen($this->request->post['email']) <= 0) {
            $err_msg = "Invalid email!";
            $error += 1;
        }
                
        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->post['email']);
        if ($error == 0 && !$user_info) {
            $msg = "Email not exists!";
            $error += 1;
        }
        
        if ($error==0) {            
            $body_msg = "<html><body>
                Please click the link below to activate your account.
                <br>
                <a href=\"http://ubib.my/merchant/activation?email=".$user_info['email']."&code=".$user_info['activate_code']."\">http://ubib.my/merchant/activation?email=".$user_info['email']."&code=".$user_info['activate_code']."</a></body></html>";
            $status = $this->merchant->send_mail($user_info['email'],"Activation Code",$body_msg);
            if ($status) {                
                $msg = "Activation code email already sent to your inbox. Please check your inbox and follow the instruction to activate your account.";
            }else{                
                $error += 1;
                $msg = "error!";
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