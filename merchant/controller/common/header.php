<?php

class ControllerCommonHeader extends Controller {

    protected function index() {
        $this->data['description'] = $this->language->get('text_heading_description');
        $this->data['keywords'] = $this->language->get('text_heading_keywords');
        $this->data['title'] = $this->document->getTitle();
        if (strlen($this->data['title']) == 0) {
            $this->data['title'] = $this->language->get('text_heading_title');
        }
        $this->data['home_url'] = $this->url->link('merchant/dashboard');
        $route = $this->request->get['route'];
        $route_path = explode("/", rtrim($route, '/'));
        $rpath = implode("_", $route_path);
        $this->language->load('route');
        $title = $this->language->get("pg_" . $rpath);
        if ($title != "pg_" . $rpath) {
            $tpath = explode("|", $title);
            $this->data['page_title'] = $tpath[0];
            array_shift($tpath);
            $this->data['page_subtitle'] = $tpath;
        }
        $this->data['notification'] = $this->merchant->get_notice();
        $this->load->model('merchant/message');
        $this->data['message_count'] = $this->model_merchant_message->get_message_count($this->merchant->getId());        
        
        $this->load->model('merchant/pm');
        $this->data['pm_count'] = $this->model_merchant_pm->get_message_count($this->merchant->getId());        
        
        $merchant = $this->merchant->getInfo();		
        $this->data['merchant_name'] = $merchant['store_name'];
        $this->load->model('tool/image');        
        $this->data['store_image'] = $this->merchant->image_link( $this->model_tool_image->resize($merchant['store_img_url'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')));
        
		$this->template = 'common/header.tpl';		
		if($merchant['user_type']==1){
			$this->template = 'common/admin_header.tpl';
		}
        
        $this->render();
    }

}

?>