<?php

class ControllerMerchantOrder extends Controller {
    public function index() {
        $this->load->model('merchant/merchant');        
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());        
        $option = array(            
            "order" => array("last_order_date" => "desc"),
            "route" => "merchant/order"
        );
        $data_header = array();
        $data_header['image'] = array("display_name" => "Product Image", "content" => '<img class="img img-thumbnail table_image" src="/image/{image}" alt="{name}" />', "no_filter" => 1, "width" => "100px", "no_search" => 1);
        $data_header['product_id'] = array("fieldname"=>"a.product_id", "display_name" => "Product ID", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        $data_header['name'] = array("display_name" => "Product Name", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        /*
        $this->load->model('merchant/product');
        $stock_status = $this->model_merchant_product->getProductStockStatus();
        $data_header['stock_status_id'] = array("fieldname"=>"a.stock_status_id", "display_name" => "Status", "status_value" => $stock_status);
         * 
         */
        $data_header['special'] = array("display_name"=>"Price");
        $data_header['quantity'] = array("display_name"=>"Available Qty");
        $data_header['sold'] = array("display_name"=>"Sold Qty");
        $data_header['sold_amt'] = array("display_name"=>"Total Sold");
        $data_header['last_order_date'] = array("display_name"=>"Last Order");
        $this->data['report_title'] = "Product Order List";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        //$button_group['delete'] = array("display_name"=>"Delete","url"=>"#","icon_class"=>"fa-trash-o");
        $this->data['button_group'] = $button_group;
        $tool_group = array();        
        $tool_group['voucher_list'] = array("display_name" => "View Voucher", "url"=>"/merchant/order/product_voucher?store_id=".$store['store_id']."&product_id={product_id}", "icon_class" => "fa-list");
        $this->data['tool_group'] = $tool_group;
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("select a.`product_id`,a.`quantity`,a.`stock_status_id`,a.`price`,a.`image`,a.`date_added`,(select name from ".DB_PREFIX."product_description where product_id=a.product_id) as name,c.price as special,c.`date_start` as start_date,c.`date_end` as end_date,d.`name` as stock_status,ifnull((
select count(quantity)
from ".DB_PREFIX."order_product
left join ".DB_PREFIX."order on ".DB_PREFIX."order_product.order_id=".DB_PREFIX."order.order_id
where order_status_id>0 and product_id=a.product_id group by product_id
),0) as sold,ifnull((
select sum(ifnull(".DB_PREFIX."order_product.total,0)+ifnull(".DB_PREFIX."order_product.tax,0))
from ".DB_PREFIX."order_product
left join ".DB_PREFIX."order on ".DB_PREFIX."order_product.order_id=".DB_PREFIX."order.order_id
where order_status_id>0 and product_id=a.product_id group by product_id
),'') as sold_amt,ifnull((
select max(date_added)
from ".DB_PREFIX."order_product
left join ".DB_PREFIX."order on ".DB_PREFIX."order_product.order_id=".DB_PREFIX."order.order_id
where order_status_id>0 and product_id=a.product_id group by product_id
),'') as last_order_date
from ".DB_PREFIX."product a
left join ".DB_PREFIX."product_special c on a.product_id=c.product_id
left join ".DB_PREFIX."stock_status d on a.stock_status_id=d.stock_status_id
where a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".$store['store_id']." and status=1) {where}", $option, TRUE);

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function voucher_list() {
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());        
        $option = array(            
            "order" => array("date_added" => "desc"),
            "route" => "merchant/order/voucher_list"
        );
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("select a.order_product_id,a.order_id,a.product_id,a.name,a.quantity,a.price,a.`order_voucher_code`,a.total,a.tax,b.firstname,b.lastname,b.telephone,b.date_added,b.shipping_firstname,b.shipping_lastname,b.shipping_company,b.shipping_address_1,b.shipping_address_2,b.shipping_city,b.shipping_postcode,b.shipping_country, (ifnull(a.total,0)+ifnull(a.tax,0)) as total_amt,(select image from ".DB_PREFIX."product where product_id=a.product_id) as image
from ".DB_PREFIX."order_product a 
left join ".DB_PREFIX."order b on a.order_id=b.order_id
where b.order_status_id>0 and a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".$store['store_id']." and status=1) {where}", $option, TRUE);
        $this->load->model('merchant/order');
        foreach($this->data['data_list']['data'] as $key => $value){
            $options = $this->model_merchant_order->getOrderOptions($value['order_id'], $value['order_product_id']);
            $temp = array();
            foreach ($options as $option) {
                $temp[] = "<strong>".$option['name'].":</strong> ".$option['value'];
            }
            $temp = implode("<br>", $temp);
            $this->data['data_list']['data'][$key]['product_option'] = $temp;
        }
        $data_header = array();
        $data_header['image'] = array("display_name" => "Product Image", "content" => '<img class="img img-thumbnail table_image" src="/image/{image}" alt="{name}" />', "no_filter" => 1, "width" => "100px", "no_search" => 1);
        $data_header['product_id'] = array("fieldname"=>"a.product_id", "display_name" => "Product ID", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        $data_header['name'] = array("display_name" => "Product Name", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        $data_header['order_voucher_code'] = array("display_name"=>"Voucher Code");
        $data_header['product_option'] = array("display_name"=>"Product Option","no_filter"=>1);
        $data_header['order_id'] = array("display_name"=>"Order Details","content"=>''
            . '<strong>order_id:</strong> {order_id}<br>'
            . '<strong>customer:</strong> {firstname} {lastname}<br>'
            . '<strong>contact:</strong> {telephone}<br>'
            . '<br><strong>shipping address:</strong> <br>{shipping_firstname} {shipping_lastname}<br>'
            . '{shipping_company}<br>'
            . '{shipping_address_1}, {shipping_address_2}, {shipping_city}, {shipping_postcode}, {shipping_country}'
        );
        $data_header['quantity'] = array("display_name"=>"Qty");
        $data_header['price'] = array("display_name"=>"Price");
        $data_header['tax'] = array("display_name"=>"Tax");
        $data_header['total_amt'] = array("display_name"=>"Total(Tax Inc)");
        $data_header['date_added'] = array("display_name"=>"Purchased Date");
        $this->data['report_title'] = "Product order voucher list";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        $button_group['export'] = array("display_name"=>"Export CSV","url"=>"/merchant/order/export_voucher_csv/?filter=".urlencode(serialize($this->data['data_list']['filter'])),"url_target"=>"_blank","icon_class"=>"fa-share-square-o");
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        //$tool_group['view'] = array("display_name" => "View Details", "url"=>"/merchant/order/ajax_order_detail?store_id=".$store['store_id']."&order_product_id={order_product_id}", "ajax_url"=>1, "icon_class" => "fa-file-o");
        $this->data['tool_group'] = $tool_group;        

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function product_voucher() {
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        $this->load->model('merchant/product');
        $product = $this->model_merchant_product->getProduct(array("merchant_id"=>$this->merchant->getId(),"product_id"=>$this->request->get['product_id']));
        if(!product){
            $this->merchant->set_notice("Invalid product order code!","error");
            $this->redirect($this->url->link('merchant/order'));
        }
        $option = array(            
            "order" => array("date_added" => "desc"),
            "route" => $this->merchant->link("merchant/order/product_voucher",array("product_id"=>$product['product_id']))
        );
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("select a.order_product_id,a.order_id,a.product_id,a.name,a.quantity,a.price,a.`order_voucher_code`,a.total,a.tax,b.firstname,b.lastname,b.telephone,b.date_added,b.shipping_firstname,b.shipping_lastname,b.shipping_company,b.shipping_address_1,b.shipping_address_2,b.shipping_city,b.shipping_postcode,b.shipping_country, (ifnull(a.total,0)+ifnull(a.tax,0)) as total_amt
from ".DB_PREFIX."order_product a 
left join ".DB_PREFIX."order b on a.order_id=b.order_id
where b.order_status_id>0 and a.product_id='".$product['product_id']."' and a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".$store['store_id']." and status=1) {where}", $option, TRUE);
        $this->load->model('merchant/order');
        foreach($this->data['data_list']['data'] as $key => $value){            
            $options = $this->model_merchant_order->getOrderOptions($value['order_id'], $value['order_product_id']);
            $temp = array();
            foreach ($options as $option) {
                $temp[] = "<strong>".$option['name'].":</strong> ".$option['value'];
            }
            $temp = implode("<br>", $temp);
            $this->data['data_list']['data'][$key]['product_option'] = $temp;
        }
        $data_header = array();        
        $data_header['order_voucher_code'] = array("display_name"=>"Voucher Code");
        $data_header['product_option'] = array("display_name"=>"Product Option","no_filter"=>1);
        $data_header['order_id'] = array("display_name"=>"Order Details","content"=>''
            . '<strong>order_id:</strong> {order_id}<br>'
            . '<strong>customer:</strong> {firstname} {lastname}<br>'
            . '<strong>contact:</strong> {telephone}<br>'
            . '<br><strong>shipping address:</strong> <br>{shipping_firstname} {shipping_lastname}<br>'
            . '{shipping_company}<br>'
            . '{shipping_address_1}, {shipping_address_2}, {shipping_city}, {shipping_postcode}, {shipping_country}'
        );
        $data_header['quantity'] = array("display_name"=>"Qty");
        $data_header['price'] = array("display_name"=>"Price");
        $data_header['tax'] = array("display_name"=>"Tax");
        $data_header['total_amt'] = array("display_name"=>"Total(Tax Inc)");
        $data_header['date_added'] = array("display_name"=>"Purchased Date");
        $this->data['report_title'] = "<strong>Product: </strong>"."(".$product['product_id'].") - ".$product['name'];
        $this->data['data_header'] = $data_header;
        $button_group = array();
        $button_group['export'] = array("display_name"=>"Export CSV","url"=>"/merchant/order/export_voucher_csv/?filter=".urlencode(serialize($this->data['data_list']['filter'])),"url_target"=>"_blank","icon_class"=>"fa-share-square-o");
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        //$tool_group['view'] = array("display_name" => "View Details", "url"=>"/merchant/order/ajax_order_detail?store_id=".$store['store_id']."&order_product_id={order_product_id}", "ajax_url"=>1, "icon_class" => "fa-file-o");
        $this->data['tool_group'] = $tool_group;        

        $this->template = 'merchant/report/default_list.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function today_order() {
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());        
        $option = array(            
            "order" => array("date_added" => "desc"),
            "route" => "merchant/order/today_order"
        );
        $data_header = array();
        $data_header['image'] = array("display_name" => "Product Image", "content" => '<img class="img img-thumbnail table_image" src="/image/{image}" alt="{name}" />', "no_filter" => 1, "width" => "100px", "no_search" => 1);
        $data_header['product_id'] = array("fieldname"=>"a.product_id", "display_name" => "Product ID", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        $data_header['name'] = array("display_name" => "Product Name", "url" => "/product/product/?product_id={product_id}","url_target"=>"_blank");
        $data_header['order_voucher_code'] = array("display_name"=>"Voucher Code");
        $data_header['product_option'] = array("display_name"=>"Product Option","no_filter"=>1);
        $data_header['order_id'] = array("display_name"=>"Order Details","content"=>''
            . '<strong>order_id:</strong> {order_id}<br>'
            . '<strong>customer:</strong> {firstname} {lastname}<br>'
            . '<strong>contact:</strong> {telephone}<br>'
            . '<br><strong>shipping address:</strong> <br>{shipping_firstname} {shipping_lastname}<br>'
            . '{shipping_company}<br>'
            . '{shipping_address_1}, {shipping_address_2}, {shipping_city}, {shipping_postcode}, {shipping_country}'
        );
        $data_header['quantity'] = array("display_name"=>"Qty");
        $data_header['price'] = array("display_name"=>"Price");
        $data_header['tax'] = array("display_name"=>"Tax");
        $data_header['total_amt'] = array("display_name"=>"Total(Tax Inc)");
        $data_header['date_added'] = array("display_name"=>"Purchased Date");
        $this->data['report_title'] = "Product order voucher list";
        $this->data['data_header'] = $data_header;
        $button_group = array();
        //$button_group['delete'] = array("display_name"=>"Delete","url"=>"#","icon_class"=>"fa-trash-o");
        $this->data['button_group'] = $button_group;
        $tool_group = array();
        //$tool_group['view'] = array("display_name" => "View Details", "url"=>"/merchant/order/ajax_order_detail?store_id=".$store['store_id']."&order_product_id={order_product_id}", "ajax_url"=>1, "icon_class" => "fa-file-o");
        $this->data['tool_group'] = $tool_group;
        $date_start = date("Y-m-d");
        $date_end = date("Y-m-d")." 23:59:59";
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("select a.order_product_id,a.order_id,a.product_id,a.name,a.quantity,a.price,a.`order_voucher_code`,a.total,a.tax,b.firstname,b.lastname,b.telephone,b.date_added,b.shipping_firstname,b.shipping_lastname,b.shipping_company,b.shipping_address_1,b.shipping_address_2,b.shipping_city,b.shipping_postcode,b.shipping_country, (ifnull(a.total,0)+ifnull(a.tax,0)) as total_amt,(select image from ".DB_PREFIX."product where product_id=a.product_id) as image
from ".DB_PREFIX."order_product a 
left join ".DB_PREFIX."order b on a.order_id=b.order_id
where b.order_status_id>0 and b.date_added>='".$date_start."' and b.date_added<='".$date_end."' and a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".$store['store_id']." and status=1) {where}", $option, FALSE);
        $this->load->model('merchant/order');
        foreach($this->data['data_list']['data'] as $key => $value){
            $options = $this->model_merchant_order->getOrderOptions($value['order_id'], $value['order_product_id']);
            $temp = array();
            foreach ($options as $option) {
                $temp[] = "<strong>".$option['name'].":</strong> ".$option['value'];
            }
            $temp = implode("<br>", $temp);
            $this->data['data_list']['data'][$key]['product_option'] = $temp;
        }

        $this->template = 'merchant/report/default_list_x_func.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }
    
    public function export_voucher_csv(){
        $this->load->model('merchant/merchant');        
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        $option = array();        
        if(isset($this->request->get['filter'])){
            $temp = unserialize(urldecode(html_entity_decode($this->request->get['filter'])));            
            if(is_array($temp)){
                $option = array_merge($option,$temp);
            }
        }
        $option = array_merge($option,array("limit"=>1000,"max_records"=>1000,"page"=>1));
        $query_where = "";
        if(isset($this->request->get['product_id']) && strlen($this->request->get['product_id'])>0){
            $query_where = " and a.product_id=".(int)$this->request->get['product_id']." ";
        }
        $this->data['data_list'] = $this->merchant->getQueryWithPagination("select a.order_product_id,a.order_id,a.product_id,a.name,a.quantity,a.price,a.`order_voucher_code`,a.total,a.tax,concat(b.firstname,' ',b.lastname) as customer_name,b.telephone,b.date_added,b.shipping_firstname,b.shipping_lastname,b.shipping_company,b.shipping_address_1,b.shipping_address_2,b.shipping_city,b.shipping_postcode,b.shipping_country, (ifnull(a.total,0)+ifnull(a.tax,0)) as total_amt,(select image from ".DB_PREFIX."product where product_id=a.product_id) as image
from ".DB_PREFIX."order_product a 
left join ".DB_PREFIX."order b on a.order_id=b.order_id
where b.order_status_id>0".$query_where." and a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".$store['store_id']." and status=1) {where}", $option, FALSE);
        $this->load->model('merchant/order');
        foreach($this->data['data_list']['data'] as $key => $value){
            $options = $this->model_merchant_order->getOrderOptions($value['order_id'], $value['order_product_id']);
            $temp = array();
            foreach ($options as $option) {
                $temp[] = $option['name'].": ".$option['value'];
            }
            $temp = implode(", ", $temp);
            $this->data['data_list']['data'][$key]['product_option'] = $temp;
            $this->data['data_list']['data'][$key]['shipping_details'] = $value['shipping_firstname']." ".$value['shipping_lastname'].", ". $value['shipping_company'].", ". $value['shipping_address_1'].", ".$value['shipping_address_2'].", ".$value['shipping_city'].", ".$value['shipping_postcode'].", ".$value['shipping_country'];        
        }
        $data_header = array();        
        $data_header['product_id'] = array("display_name" => "Product ID");
        $data_header['name'] = array("display_name" => "Product Name");
        $data_header['order_voucher_code'] = array("display_name"=>"Voucher Code");
        $data_header['product_option'] = array("display_name"=>"Product Option");
        $data_header['shipping_details'] = array("display_name"=>"Shipping Details");
        $data_header['customer_name'] = array("display_name"=>"Customer Name");
        $data_header['telephone'] = array("display_name"=>"Customer Contact");
        $data_header['quantity'] = array("display_name"=>"Quantity");
        $data_header['price'] = array("display_name"=>"Price");
        $data_header['tax'] = array("display_name"=>"Tax");
        $data_header['total_amt'] = array("display_name"=>"Total(Tax Inc)");
        $data_header['date_added'] = array("display_name"=>"Purchased Date");
        $this->data['data_header'] = $data_header;
        $this->template = 'merchant/report/export_csv.tpl';        
        $this->response->addHeader('Content-Description: File Transfer');
        $this->response->addHeader('Content-Type: text/csv; charset=utf-8');
        $this->response->addHeader('Content-Disposition: attachment; filename=order_voucher_'. microtime(true).'.csv');
        $this->response->addHeader('Expires: 0');
        $this->response->addHeader('Cache-Control: must-revalidate');
        $this->response->addHeader('Pragma: public');
        $this->response->setOutput($this->render());
    }

}

?>