<?php

class ControllerMerchantMerchant extends Controller {

    public function __construct($registry) {
        parent::__construct($registry);
        if ($this->merchant->getInfo("user_type") != 1) {
            $this->redirect($this->url->link('merchant/dashboard'));
        }
    }

    public function index() {
        $option = array(
            "where" => array("name" => ""),
            "order" => array("name" => "asc"),
            "route" => "merchant/merchant"
        );
        $data_header = array();
        $data_header['store_img_url'] = array("display_name" => "Merchant Image", "content" => '<img class="img img-thumbnail table_image" src="/image/{store_img_url}" alt="{name}" />', "no_filter" => 1, "width" => "100px", "url" => "/merchant/profile?merchant_id={merchant_id}", "no_search" => 1);
        $data_header['merchant_id'] = array("display_name" => "Merchant ID", "url" => "/merchant/profile?merchant_id={merchant_id}");
        $data_header['name'] = array("display_name" => "Merchant Name", "url" => "/merchant/profile?merchant_id={merchant_id}");
        $data_header['store_name'] = array("display_name" => "Store Name");
        $data_header['username'] = array("display_name" => "User Name");
        $data_header['password'] = array("display_name" => "User Password");
        $data_header['email'] = array("display_name" => "Email Address", "icon_class" => "fa-envelope-o");
        $data_header['last_login'] = array("display_name" => "Last Login");
        $data_header['status'] = array("display_name" => "Merchant Status", "status_value" => array("0" => '<span class="label label-sm label-danger">Disabled</span>', "1" => '<span class="label label-sm label-success">Enabled</span>'));
        $data_header['user_type'] = array("display_name" => "Merchant Type", "status_value" => array("0" => "Normal Merchant", "1" => "Administrator"));
        $this->data['report_title'] = "Merchant List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        //$button_group['delete'] = array("display_name"=>"Delete","url"=>"#","icon_class"=>"fa-trash-o");
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        $tool_group['view'] = array("display_name" => "View Details", "url" => "/merchant/profile?merchant_id={merchant_id}", "icon_class" => "fa-file-o");
        $tool_group['product'] = array("display_name" => "View Product", "url" => "/merchant/product?merchant_id={merchant_id}", "icon_class" => "fa-shopping-cart");
        $tool_group['change_pwd'] = array("display_name" => "Change Password", "url" => "/merchant/profile/changepassword?merchant_id={merchant_id}", "icon_class" => "fa-key");
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("SELECT * FROM (SELECT username, password, name, email, gender, ip, activate_code, status, date_added, last_login, birthday, user_type, b.* FROM `" . DB_PREFIX . "merchant` a LEFT JOIN `" . DB_PREFIX . "merchant_store` b on a.merchant_id=b.merchant_id) a", $option, TRUE);

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>