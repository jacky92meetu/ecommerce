<?php

class ControllerMerchantPm extends Controller {

    public function index() {
        $this->load->model('merchant/merchant');
        $this->load->model('merchant/pm');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());        
        $this->data['pm_list'] = $this->model_merchant_pm->getAllMessageCount($store['store_id']);
        $this->data['pm_count'] = $this->model_merchant_pm->get_message_count($store['store_id']);
        $this->template = 'merchant/pm/messagelist.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>