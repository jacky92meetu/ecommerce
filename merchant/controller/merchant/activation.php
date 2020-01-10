<?php

class ControllerMerchantActivation extends Controller {

    public function index() {
        if ($this->merchant->isLogged()) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
        
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_activation();
        
        if($error->status=="error"){
            $this->merchant->set_notice($error->text,"error");
        }
        if($error->status=="success"){
            $this->merchant->set_notice($error->text, "success");
            $this->redirect($this->url->link('merchant/dashboard'));
        }

        $this->template = 'merchant/login/login.tpl';
        $this->children = array(
            'common/loginfooter',
            'common/loginheader'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_activation() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;        
        
        if ($error == 0 && strlen($this->request->get['email']) <= 0) {
            $err_msg = "Missing email address!";
            $error += 1;
        }
        if ($error == 0 && strlen($this->request->get['code']) <= 0) {
            $err_msg = "Missing code!";
            $error += 1;
        }
        $user_info = $this->model_merchant_merchant->getMerchantByUsername($this->request->get['email']);
        if($error==0 && !$user_info){
            $err_msg = "Invalid email";
            $error += 1;
        }
        if($error==0 && $user_info['activate_code']!=$this->request->get['code']){
            $err_msg = "Invalid code";
            $error += 1;
        }        
        
        if ($error==0) {
            $data = array("merchant_id"=>$user_info['merchant_id']);
            $query_result = $this->model_merchant_merchant->activation($data);
            if ($query_result) {
                $this->merchant->force_login($user_info['merchant_id']);
                $msg = "Account activated!";                
            }else{
                $error += 1;
                $msg = "Activation error!";
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