<?php

class ControllerMerchantCustomer extends Controller {

	public function __construct($registry) {        
        parent::__construct($registry);
        if ($this->merchant->getInfo("user_type") != 1) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
    }

    public function index() {
		$option = array(            
            "order" => array("customer_name"=>"asc"),
            "route" => "merchant/customer"
        );
        $data_header = array();
        $data_header['customer_name'] = array("display_name"=>"Customer Name");
        $data_header['email'] = array("display_name"=>"Email");        
        $data_header['status'] = array("display_name"=>"Status","status_value"=>array("0"=>'<span class="label label-sm label-danger">Disabled</span>',"1"=>'<span class="label label-sm label-success">Enabled</span>'));
		$data_header['approved'] = array("display_name"=>"Approved","status_value"=>array("0"=>'<span class="label label-sm label-danger">No</span>',"1"=>'<span class="label label-sm label-success">Yes</span>'));        
        $data_header['date_added'] = array("display_name"=>"Date Added");
        $this->data['report_title'] = "Customer List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        /*$button_group['create_redirect'] = array("display_name"=>"Add Redirect Link","url"=>"/merchant/system/link_manage?link_type=redirect","icon_class"=>"fa-plus","class"=>"btn-success");*/        
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        /*$tool_group['view'] = array("display_name"=>"View","url"=>"/merchant/system/link_manage?link_type={link_type}&link_id={link_id}","icon_class"=>"fa-file-o");*/		
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT * FROM (SELECT concat(firstname,' ',lastname) as customer_name,a.* FROM ".DB_PREFIX."customer a) a",$option,TRUE);
	
        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>