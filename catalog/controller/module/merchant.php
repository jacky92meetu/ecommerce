<?php

class ControllerModuleMerchant extends Controller {
    public function index(){
        $this->redirect($this->url->link('common/home'));
    }
    
    public function newsletter_subscribe(){
        $json = new stdClass();
        $json->status = "error";
        $error = 0;
                
        if($error==0 && (!isset($this->request->post['subscribe_email']) || strlen($this->request->post['subscribe_email'])==0)){
           $json->text = "Missing required field!";
           $error += 1;
        }
        
        if ($error == 0 && ((utf8_strlen($this->request->post['subscribe_email']) > 255) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['subscribe_email']))) {            
            $json->text = "Invalid email address!";
           $error += 1;
        }
        
        if($error==0){
             $this->load->model('merchant/merchant');
            $query_result = $this->model_merchant_merchant->create_newsletter_subscribe($this->request->post['subscribe_email']);            
            if($query_result){
                $json->status = "success";
            }else{                
                $json->text = "We are sorry, please subscribe again later.";
                $error += 1;
            }
        }
        
        return $this->response->setOutput(json_encode($json));
    }
    
    public function promotion_subscribe(){
        $json = new stdClass();
        $json->status = "error";
        $error = 0;
        
        if($error==0 && (!isset($this->request->post['promotion_title']) || strlen($this->request->post['promotion_title'])==0)){
           $json->text = "Missing promotion title!";
           $error += 1;
        }
                
        if($error==0 && (!isset($this->request->post['email']) || strlen($this->request->post['email'])==0)){
           $json->text = "Missing required field!";
           $error += 1;
        }
        
        if ($error == 0 && ((utf8_strlen($this->request->post['email']) > 255) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {            
            $json->text = "Invalid email address!";
           $error += 1;
        }
        
        if($error==0){
             $this->load->model('merchant/merchant');
            $query_result = $this->model_merchant_merchant->create_promotion_subscribe($this->request->post['promotion_title'],$this->request->post['email']);
            if($query_result){
                $json->status = "success";
            }else{                
                $json->text = "We are sorry, please subscribe again later.";
                $error += 1;
            }
        }        
        
        return $this->response->setOutput(json_encode($json));
    }
    
    public function ask_question(){
        $json = new stdClass();
        $json->status = "error";
        $error = 0;
        
        if($error==0 && (!isset($this->request->post['selected_product_id']) || strlen($this->request->post['selected_product_id'])==0)){
           $json->text = "Missing required field!";
           $error += 1;
        }
        
        if($error==0 && (!isset($this->request->post['email']) || strlen($this->request->post['email'])==0)){
           $json->text = "Missing required field!";
           $error += 1;
        }
        
        if ($error == 0 && ((utf8_strlen($this->request->post['email']) > 255) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {            
            $json->text = "Invalid email address!";
           $error += 1;
        }
        
        if($error==0 && (!isset($this->request->post['question']) || strlen($this->request->post['question'])==0)){
            $json->text = "Missing required field!";
            $error += 1;
        }
        
        if($error==0){
             $this->load->model('merchant/merchant');
            $query_result = $this->model_merchant_merchant->create_merchant_chat($this->request->post['selected_product_id'],$this->request->post['email'],$this->request->post['question']);
            if($query_result){
                $json->status = "success";
            }else{                
                $json->text = "Invalid product!";
                $error += 1;
            }
        }
        
        return $this->response->setOutput(json_encode($json));
    }
    
    public function popup(){
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
                'text'      => "Home",
                        'href'      => $this->url->link('common/home'),        	
                'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
                'text'      => "Starbucks Contest",
                'href'      => $this->url->link('module/merchant/popup'),
                'separator' => $this->language->get('text_separator')
        );
        
        $this->document->addMeta("og:title","Ubib.my - Win iPhone 6 Plus or Starbucks Gift Card");
        $this->document->addMeta("og:description","Just one Click away to Win!");
        $this->document->addMeta("og:image","http://www.ubib.my/page/images/pop-up-contest_03.png");        
        
         if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mp/static_page/starbucks_contest.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/mp/static_page/starbucks_contest.tpl';
        } else {
            $this->redirect($this->url->link('error/not_found'));
        }

        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }

}

?>