<?php

class ControllerMerchantSales extends Controller {

	public function index(){
	
	}

    public function admin_order_list() {
		if ($this->merchant->getInfo("user_type") != 1) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
		$option = array(            
            "order" => array("firstname"=>"asc"),
            "route" => "merchant/sales/admin_order_list"
        );
        $data_header = array();
        $data_header['order_id'] = array("display_name"=>"Order Id");
		$data_header['customer_name'] = array("display_name"=>"Customer Name");
        $data_header['email'] = array("display_name"=>"Email");
		$available_status = array('1'=>'Pending','2'=>'Processing','3'=>'Shipped','5'=>'Complete','7'=>'Canceled','8'=>'Denied','9'=>'Canceled Reversal','10'=>'Failed','11'=>'Refunded','12'=>'Reversed','13'=>'Chargeback','14'=>'Expired','15'=>'Processed','16'=>'Voided');
		$data_header['order_status_id'] = array("display_name"=>"Order Status","status_value"=>$available_status);
		$data_header['total'] = array("display_name"=>"Total");
        $data_header['date_added'] = array("display_name"=>"Date Added");
        $this->data['report_title'] = "Sales Orders List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        /*$button_group['create_redirect'] = array("display_name"=>"Add Redirect Link","url"=>"/merchant/system/link_manage?link_type=redirect","icon_class"=>"fa-plus","class"=>"btn-success");*/        
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        /*$tool_group['view'] = array("display_name"=>"View","url"=>"/merchant/system/link_manage?link_type={link_type}&link_id={link_id}","icon_class"=>"fa-file-o");*/		
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT * FROM (SELECT concat(firstname,' ',lastname) as customer_name,a.* FROM ".DB_PREFIX."order a) a",$option,TRUE);
	
        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>