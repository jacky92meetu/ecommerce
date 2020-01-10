<?php

class ControllerMerchantLogout extends Controller {

    public function index() {
        $this->merchant->logout();
        $this->redirect($this->url->link('merchant/login'));
    }

}

?>