<?php

class ControllerMerchantContact extends Controller {

    public function index() {
        $this->load->model('merchant/merchant');
        
        $error = $this->validate_submitcontact();
        
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
        
        $this->data['pdata'] = $this->request->post;        
        
        $this->template = 'merchant/contact/contactus.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    private function validate_submitcontact() {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        $msg = "";
        $error = 0;
        
        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $result->status = "pass";
            return $result;
        }
        
        if ($this->request->post['form_action'] != "contact") {
            $msg = "Invalid form submission!";
            $error += 1;
        }               
        if ($error == 0 && (utf8_strlen($this->request->post['comments']) < 1)) {
            $msg = "Invalid comments!";
            $error += 1;
        }
        
        if ($error==0) {
            $user_info = $this->merchant->getInfo();
            $this->load->model('merchant/message');
            $message = $this->model_merchant_message->getTemplateMessage("sup01",$user_info['store_name'],$user_info['name'],$user_info['comp_tel'],$user_info['email'],$this->request->post['comments']);
            $status = false;
            if($message){
                $status = $this->merchant->send_mail("support@ubib.my",$this->request->post['title'],$message['message'],$user_info['email'],$user_info['name']);
            }
            if ($status) {
                $msg = "Message sent.";
            }else{
                $error += 1;
                $msg = "Message send fail!";
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