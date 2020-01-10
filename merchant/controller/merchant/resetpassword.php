<?php

class ControllerMerchantResetpassword extends Controller {
    
    public function index(){
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_resetcheck();
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
            $this->redirect($this->url->link('merchant/login'));
        }
        
        $error = $this->validate_resetnow();
        if($error->status!='pass' && isset($this->request->post['isajax'])){
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];            
            if($error->status=="success"){                    
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
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->data['pdata'] = $this->request->post;
        $this->template = 'merchant/resetpassword/resetpassword.tpl';
        
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        
        $this->response->setOutput($this->render());
    }

    public function sendmail() {
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_resetsend();
        
        if($error->status!='pass' && isset($this->request->post['isajax'])){                
            $json = new stdClass();
            $json->status = $error->status;
            $json->text = $error->text;
            $json->form_action = $this->request->post['form_action'];
            /*
            if($error->status=="success"){
                $json->text = "";
                $json->redirect = $this->url->link('/merchant/page/resetpassword.html');
            }
             * 
             */
            return $this->response->setOutput(json_encode($json));
        }
        
        $this->data['pdata'] = $this->request->post;

        $this->template = 'merchant/login/login.tpl';
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_resetsend() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "resetpassword") {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        
        if ($error == 0 && strlen($this->request->post['email']) <= 0) {
            $msg = "Invalid email!";
            $error += 1;
        }
                
        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->post['email']);
        if ($error == 0 && !$user_info) {
            $msg = "Email not exists!";
            $error += 1;
        }
        
        if ($error==0) {            
            $body_msg = "<html><body>
                Please click the link below to reset your account login password.
                <br>
                <a href=\"http://ubib.my/merchant/resetpassword?email=".$user_info['email']."&code=".$user_info['activate_code']."\">http://ubib.my/merchant/resetpassword?email=".$user_info['email']."&code=".$user_info['activate_code']."</a></body></html>";
            $status = $this->merchant->send_mail($user_info['email'],"Reset Password",$body_msg);
            if ($status) {                
                $msg = "Reset password email already sent to your inbox. Please check your inbox and follow the instruction to reset your password.";
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
    
    private function validate_resetcheck() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'GET') {
            $result->status = "pass";
            return $result;
        }
        
        if ($error == 0 && strlen($this->request->get['email']) <= 0) {
            $msg = "Missing email address!";
            $error += 1;
        }
        if ($error == 0 && strlen($this->request->get['code']) <= 0) {
            $msg = "Missing code!";
            $error += 1;
        }
        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->get['email']);
        if($error==0 && !$user_info){
            $msg = "Invalid email";
            $error += 1;
        }
        if($error==0 && $user_info['activate_code']!=$this->request->get['code']){
            $msg = "Invalid code";
            $error += 1;
        }
        
        if ($error==0) {
            $this->request->post = array_merge($this->request->post,$this->request->get);            
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
    
    private function validate_resetnow() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "resetpassword") {
            $msg = "Invalid form submission!";
            $error += 1;
        }
        
        if ($error == 0 && strlen($this->request->post['email']) <= 0) {
            $msg = "Missing email address!";
            $error += 1;
        }
        if ($error == 0 && strlen($this->request->post['code']) <= 0) {
            $msg = "Missing code!";
            $error += 1;
        }
        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->post['email']);
        if($error==0 && !$user_info){
            $msg = "Invalid email";
            $error += 1;
        }
        if($error==0 && $user_info['activate_code']!=$this->request->post['code']){
            $msg = "Invalid code";
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
            $data['merchant_id'] = $user_info['merchant_id'];
            $query_result = $this->model_merchant_merchant->changePassword($data);
            if ($query_result) {
                $msg = "Merchant password reset successfully.";                
            }else{
                $error += 1;
                $msg = "Merchant password reset error!";
            }
        }
        
        if ($error==0) {
            $this->merchant->force_login($user_info['merchant_id']);
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