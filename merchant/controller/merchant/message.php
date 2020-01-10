<?php

class ControllerMerchantMessage extends Controller {

    public function index() {
        $this->load->model('merchant/message');
        $data = array("merchant_id"=>$this->merchant->getId());
        $this->data['message_list'] = $this->model_merchant_message->getAllMessage($data);
        $this->data['message_count'] = $this->model_merchant_message->get_message_count($this->merchant->getId());
        $this->template = 'merchant/message/messagelist.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function view(){
        $this->load->model('merchant/message');
        if(!isset($this->request->get['id'])){
            $this->merchant->set_notice("Invaid message id","error");
            $this->redirect($this->url->link('merchant/message'));
        }
        $data = array(
            "merchant_id"=>$this->merchant->getId(),
            "id"=>$this->request->get['id']
        );
        $message = $this->model_merchant_message->getMessage($data['id'],$this->merchant->getId());
        if(!$message){
            $this->merchant->set_notice("Invaid message id","error");
            $this->redirect($this->url->link('merchant/message'));
        }
        
        $message['message'] = str_ireplace("\n", "<br>", html_entity_decode($message['message']));
        
        $this->load->model('merchant/message');
        $this->model_merchant_message->set_read_message($data);
        $this->data['message'] = $message;
        
        $this->template = 'merchant/message/viewmessage.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>