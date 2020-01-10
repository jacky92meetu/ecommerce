<?php

class ControllerMerchantReport extends Controller {

    public function index() {
        $this->template = 'merchant/test/orderhistory2.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

    public function payment() {
        $this->template = 'merchant/report/paymenthistory.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>