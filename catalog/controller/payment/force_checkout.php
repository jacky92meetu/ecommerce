<?php
class ControllerPaymentForceCheckout extends Controller {
	protected function index() {
            return $this->confirm();
	}

	public function confirm() {
            $this->load->model('merchant/order');
            if(isset($this->request->get['pwd']) && $this->request->get['pwd']=="123456" && isset($this->request->get['order_id']) && isset($this->request->get['status_id'])){
                $result = $this->model_merchant_order->confirm($this->request->get['order_id'], $this->request->get['status_id']);
                if($result){
                    echo "success";
                }else{
                    echo "fail";
                }
            }else{
                $this->redirect($this->url->link('error/not_found'));
            }		
	}
}
?>