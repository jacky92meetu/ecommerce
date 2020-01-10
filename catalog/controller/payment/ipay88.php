<?php
class ControllerPaymentIpay88 extends Controller {
	protected function index() {
		$this->language->load('payment/ipay88');
		
		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_back'] = $this->language->get('button_back');

    	$this->data['action'] = 'https://www.mobile88.com/epayment/entry.asp';
		
		$vendor = $this->config->get('ipay88_vendor');
		$password = $this->config->get('ipay88_password');		
		$support_currency = $this->config->get('entry_currency');
		
		$this->load->model('checkout/order');
		
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);


		// Lets start define iPay88 parameters here
		
			$this->data['products'] = array();
			$this->data['product_id_list'] = array();
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => $option['option_value']
					);
				}
				
				$this->data['products'][] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'price'    => $this->currency->format($product['price'], $order_info['currency_code'], $order_info['currency_value'], false),
					'quantity' => $product['quantity'],
					'option'   => $option_data,
					'weight'   => $product['weight']
				);
                                                    $this->data['product_id_list'][] = $product['product_id'];
			}	

	
		// Let's Generate Digital Signature  
		
		$ipaySignature ='';
		
        $merId = $this->config->get('ipay88_vendor');
        $ikey = $this->config->get('ipay88_password');		
		$tmpAmount = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], FALSE);
		$ordAmount = number_format($tmpAmount, 2, ".", "");
        
		$ipaySignature ='';
	    $HashAmount = str_replace(".","",str_replace(",","",$ordAmount));	
		$str = sha1($ikey  . $merId . $this->session->data['order_id'] . $HashAmount . $order_info['currency_code']);
		for ($i=0;$i<strlen($str);$i=$i+2)
		{
        $ipaySignature .= chr(hexdec(substr($str,$i,2)));
		}
     
		$ipaySignature = base64_encode($ipaySignature);
		
		// Signature generating done !
		
		// Assign values for form post

		$this->data['MerchantCode'] = $this->config->get('ipay88_vendor');
		$this->data['PaymentId'] = '';
		$this->data['RefNo'] = $this->session->data['order_id'];
		$this->data['Amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], FALSE);
		$this->data['Currency'] = $order_info['currency_code'];		
		//$this->data['ProdDesc'] = $this->config->get('config_name') . ' - #' . $order_info['order_id'];
                          $this->data['ProdDesc'] = "Products: ".implode(",", $this->data['product_id_list']);
		$this->data['UserName'] = $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname'];
		$this->data['UserEmail'] = $order_info['email'];
		$this->data['UserContact'] = $order_info['telephone'];
		$this->data['Remark'] = sprintf($this->language->get('text_description'), date($this->language->get('date_format_short')), $this->session->data['order_id']);
		$this->data['Lang'] = "UTF-8";
		$this->data['Signature'] = $ipaySignature;
		$this->data['ResponseURL'] = $this->url->link('payment/ipay88/callback', '', 'SSL');
		$this->data['BackendURL'] = $this->url->link('payment/ipay88/backendcallback', '', 'SSL');
				
		$this->data['back'] = $this->url->link('checkout/payment', '', 'SSL');
		
		$this->id       = 'payment';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ipay88.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/ipay88.tpl';
		} else {
			$this->template = 'default/template/payment/ipay88.tpl';
		}	
		
		$this->render();
	}
	
	public function callback() 
	{
		$this->language->load('payment/ipay88');
	
		$this->data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

		if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
			$this->data['base'] = HTTP_SERVER;
		} else {
			$this->data['base'] = HTTPS_SERVER;
		}
	
		$this->data['charset'] = $this->language->get('charset');
		$this->data['language'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
	
		$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
		
		$this->data['text_response'] = $this->language->get('text_response');
		$this->data['text_success'] = $this->language->get('text_success');
		$this->data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success', '', 'SSL'));
		$this->data['text_failure'] = $this->language->get('text_failure');
		$this->data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart'));


		$expected_sign = $_POST['Signature'];
	    $merId = $this->config->get('ipay88_vendor');
        $ikey = $this->config->get('ipay88_password');	

		$check_sign = "";
		$ipaySignature = "";
		$str = "";
		$HashAmount = "";
		
		$HashAmount = str_replace(array(',','.'), "", $_POST['Amount']);
		$str = $ikey . $merId . $_POST['PaymentId'].trim(stripslashes($_POST['RefNo'])). $HashAmount . $_POST['Currency'] . $_POST['Status'];
	
	
		$str = sha1($str);
	   
	    for ($i=0;$i<strlen($str);$i=$i+2)
		{
        $ipaySignature .= chr(hexdec(substr($str,$i,2)));
		}
       
		$check_sign = base64_encode($ipaySignature);


	if ($_POST['Status']=="1" && $check_sign==$expected_sign) 
		{
	
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($_POST['RefNo'], $this->config->get('ipay88_order_status_id'), "Transaction ID : " . $_POST['TransId'], TRUE);	  

				$this->data['continue'] = $this->url->link('checkout/success', '', 'SSL');
					
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ipay88_success.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/ipay88_success.tpl';
				} else {
					$this->template = 'default/template/payment/ipay88_success.tpl';
				}	
		
	  			$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));

		}	
		else
		{				
				$this->data['continue'] = $this->url->link('checkout/cart');
		
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ipay88_failure.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/ipay88_failure.tpl';
				} else {
					$this->template = 'default/template/payment/ipay88_failure.tpl';
				}
				
	  			$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));	

		}
		
	}
	
	
		public function backendcallback() 
	{
		$this->language->load('payment/ipay88');
	
		$this->data['title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

		if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
			$this->data['base'] = HTTP_SERVER;
		} else {
			$this->data['base'] = HTTPS_SERVER;
		}
	
		// $this->data['charset'] = $this->language->get('charset');
		// $this->data['language'] = $this->language->get('code');
		// $this->data['direction'] = $this->language->get('direction');
	
		// $this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
		
		// $this->data['text_response'] = $this->language->get('text_response');
		// $this->data['text_success'] = $this->language->get('text_success');
		// $this->data['text_success_wait'] = sprintf($this->language->get('text_success_wait'), $this->url->link('checkout/success', '', 'SSL'));
		// $this->data['text_failure'] = $this->language->get('text_failure');
		// $this->data['text_failure_wait'] = sprintf($this->language->get('text_failure_wait'), $this->url->link('checkout/cart'));


		$expected_sign = $_POST['Signature'];
	    $merId = $this->config->get('ipay88_vendor');
        $ikey = $this->config->get('ipay88_password');	

		$check_sign = "";
		$ipaySignature = "";
		$str = "";
		$HashAmount = "";
		
		$HashAmount = str_replace(array(',','.'), "", $_POST['Amount']);
		$str = $ikey . $merId . $_POST['PaymentId'].trim(stripslashes($_POST['RefNo'])). $HashAmount . $_POST['Currency'] . $_POST['Status'];
	
	
		$str = sha1($str);
	   
	    for ($i=0;$i<strlen($str);$i=$i+2)
		{
        $ipaySignature .= chr(hexdec(substr($str,$i,2)));
		}
       
		$check_sign = base64_encode($ipaySignature);


	if ($_POST['Status']=="1" && $check_sign==$expected_sign) 
		{
	
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($_POST['RefNo'], $this->config->get('ipay88_order_status_id'), "Transaction ID : " . $_POST['TransId'], TRUE);	  

				$this->data['continue'] = $this->url->link('checkout/success', '', 'SSL');
					
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ipay88_success_backend.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/ipay88_success_backend.tpl';
				} else {
					$this->template = 'default/template/payment/ipay88_success_backend.tpl';
				}	
		
	  			$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));

		}	
		else
		{				
				$this->data['continue'] = $this->url->link('checkout/cart');
		
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ipay88_failure.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/payment/ipay88_failure.tpl';
				} else {
					$this->template = 'default/template/payment/ipay88_failure.tpl';
				}
				
	  			$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));	

		}
		
	}
	
	
}
?>