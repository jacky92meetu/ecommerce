<?php

class ControllerMerchantError extends Controller {

    public function index() {
        return $this->not_found();
    }

    public function not_found() {
        $this->document->setTitle("404 Error Page - " . $this->language->get("text_heading_title"));
        $this->template = 'error/not_found.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }

}

?>