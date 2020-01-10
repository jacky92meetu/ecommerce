<?php

class ControllerCommonRoute extends Controller {

    public function index() {
        //$this->url->addRewrite($this);

        $route = '';
        if (!isset($this->request->get['route']) && isset($this->request->get['_route_'])) {
            $this->request->get['route'] = rtrim($this->request->get['_route_'], '/');
        }
        if (!isset($this->request->get['route']) || $this->request->get['route'] == 'merchant') {
            $this->request->get['route'] = 'merchant/dashboard';
        }
        if (isset($this->request->get['route'])) {
            $part = explode('/', $this->request->get['route']);

            if (isset($part[0])) {
                $route .= $part[0];
            }

            if (isset($part[1])) {
                $route .= '/' . $part[1];
            }
        }
        $ignore = array(
            'merchant/login',
            'merchant/login/resend_activation_code',
            'merchant/resetpassword',
            'merchant/resetpassword/sendmail',
            'merchant/register',
            'merchant/activation',
            'merchant/logout'
        );

        if (!$this->merchant->isLogged() && !in_array($route, $ignore)) {
            $this->request->get['route'] = 'merchant/login';
            return $this->forward('merchant/login');
        }

        if (isset($this->request->get['route'])) {
            return $this->forward($this->request->get['route']);
        }
    }

    public function rewrite($link) {
        return $link;
    }

}

?>