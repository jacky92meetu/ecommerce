<?php

class ControllerCommonLoginfooter extends Controller {

    protected function index() {
        $this->template = 'common/loginfooter.tpl';
        $this->render();
    }

}

?>