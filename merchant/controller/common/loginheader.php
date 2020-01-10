<?php

class ControllerCommonLoginheader extends Controller {

    protected function index() {
        $this->data['description'] = $this->language->get('text_heading_description');
        $this->data['keywords'] = $this->language->get('text_heading_keywords');
        $this->data['title'] = $this->document->getTitle();
        if (strlen($this->data['title']) == 0) {
            $this->data['title'] = $this->language->get('text_heading_title');
        }
        $this->data['notification'] = $this->merchant->get_notice();
        $this->data['merchant_name'] = "";
        $this->template = 'common/loginheader.tpl';
        $this->render();
    }

}

?>