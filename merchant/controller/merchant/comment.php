<?php

class ControllerMerchantComment extends Controller {

    public function index() {
        $this->template = 'merchant/comment/comment.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>