<?php

class ControllerMerchantCaptcha extends Controller {

    public function index() {
        $this->load->library('captcha');

        $captcha = new Captcha();

        $this->session->data['captcha'] = $captcha->getCode();

        $captcha->showImage();
    }

}

?>