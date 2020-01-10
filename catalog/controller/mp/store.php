<?php 
class ControllerMpStore extends Controller {
    
    public function __construct($registry) {
        parent::__construct($registry);
        // Merchant
        require_once(DIR_SYSTEM . 'library/merchant.php');
        $this->registry->set('merchant', new Merchant($this->registry));
    }
    
    public function index(){
        return $this->store();
    }
    
    public function store_list(){
        $this->load->model('merchant/merchant');
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home'),
        'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
                'text'      => $store['store_name'],
                'href'      => $this->url->link('mp/store', 'store_id='.$store['store_id']),
                'separator' => $this->language->get('text_separator')
        );
        
        $option = array(
            "limit" => 20,            
            "order" => array("a.store_date_added" => "desc"),
            "route" => "mp/store/store_list"
        );        
        $this->data['data_list'] = $this->model_merchant_merchant->getQueryWithPagination("SELECT DISTINCT * FROM `".DB_PREFIX."merchant_store` a WHERE a.`store_status`=1 {where}", $option, FALSE);
        
        $this->load->model('tool/image');
        foreach($this->data['data_list']['data'] as $key => $value){            
            $value['thumb'] = $this->model_tool_image->resize($value['store_img_url'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
            $value['address'] = html_entity_decode($value['comp_address'], ENT_QUOTES, 'UTF-8');            
            $value['merchant_url'] = "mp/store?store_id=".$value['store_id'];
            //$value['product_list'] = $this->model_merchant_merchant->getAllProductByStoreId(array("store_id"=>$value['store_id'],"limit"=>6));
            foreach($value['product_list'] as $key2 => $value2){
                $value2['thumb'] = $this->model_tool_image->resize($value2['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
                $value2['href'] = $this->url->link('product/product', 'product_id=' . $value2['product_id']);
                $value['product_list'][$key2] = $value2;
            }
            $this->data['data_list']['data'][$key] = $value;
        }        
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mp/store_list.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/mp/store_list.tpl';
        } else {
                $this->template = 'default/template/mp/store_list.tpl';
        }

        $this->children = array(
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
        );

        $this->response->setOutput($this->render());
    }
    
    public function store() {                 
        $this->load->model('merchant/merchant');
        $store = $this->model_merchant_merchant->getStoreByStoreId($this->request->get['store_id']);
        if(!$store){
            $this->redirect($this->url->link('error/not_found'));
        }
        $this->model_merchant_merchant->setCustomerOnline($this->customer->getId(),$store['store_id'],0);
        if(strlen($store['store_img_cover'])){
            $store['store_image_cover'] = $this->merchant->image_link($store['store_img_cover']);
            $store['store_cover_desc'] = html_entity_decode($store['comp_desc']);
        }
        if(strlen($store['store_img_url'])){
            $store['store_image'] = $this->merchant->image_link($store['store_img_url']);
            $store['store_image_desc'] = html_entity_decode($store['comp_desc']);
        }
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home'),
        'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
                'text'      => $store['store_name'],
                'href'      => $this->url->link('mp/store', 'store_id='.$store['store_id']),
                'separator' => $this->language->get('text_separator')
        );
                
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        
        $option = array(
            "where" => array("store_id" => $store['store_id']),
            "order" => array("viewed"=>"desc"),
            "route" => "mp/store?store_id=".$store['store_id'],
            "limit" => 20
        );        
        $query = "SELECT p.product_id, (SELECT price FROM ".DB_PREFIX."product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '1' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special FROM ".DB_PREFIX."category_path cp LEFT JOIN ".DB_PREFIX."product_to_category p2c ON (cp.category_id = p2c.category_id) LEFT JOIN ".DB_PREFIX."product p ON (p2c.product_id = p.product_id) LEFT JOIN ".DB_PREFIX."product_description pd ON (p.product_id = pd.product_id) JOIN ".DB_PREFIX."merchant_product mp on mp.product_id=p.product_id WHERE pd.language_id = '1' {where} AND p.status = '1' AND p.date_available <= NOW() GROUP BY p.product_id";
        $this->data['data_list'] = $this->model_merchant_merchant->getQueryWithPagination($query,$option,false);
        
        $data_header = array();
        $data_header_selected = array("display_name"=>"Sort Option");
        $data_header['viewed_desc'] = array("display_name" => "Most Popular","sort_name"=>"viewed","sort_order"=>"desc");
        $data_header['date_added_desc'] = array("display_name" => "Newest","sort_name"=>"date_added","sort_order"=>"desc");
        $data_header['special_asc'] = array("display_name" => "Price - Low to High","sort_name"=>"special","sort_order"=>"asc");
        $data_header['special_desc'] = array("display_name" => "Price - High to low","sort_name"=>"special","sort_order"=>"desc");        
        foreach($data_header as $key => $value){
            if(isset($this->data['data_list']['filter']['order']) && array_key_exists($value['sort_name'], $this->data['data_list']['filter']['order'])!==FALSE && $this->data['data_list']['filter']['order'][$value['sort_name']]==$value['sort_order']){
                $data_header_selected = $value;
                unset($data_header[$key]);
            }
        }
        $this->data['data_header'] = $data_header;
        $this->data['data_header_selected'] = $data_header_selected;
        
        $this->data['products'] = array();
        foreach ($this->data['data_list']['data'] as $result) {
            $result = $this->model_catalog_product->getProduct($result['product_id']);
            $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                    $price = false;
            }

            if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                    $special = false;
            }

            if ($this->config->get('config_review_status')) {
                    $rating = (int)$result['rating'];
            } else {
                    $rating = false;
            }
            
            $len = 35;
            $product_name = html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8');                        
            if(utf8_strlen($product_name)>$len){                            
                $pos = utf8_strrpos(utf8_substr($product_name,0,$len), " ");
                $product_name = utf8_substr($product_name,0,$pos)."<strong> ...</strong>";
            }

            $this->data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb'   	 => $image,
                    'name'    	 => $product_name,
                    'full_name'   => $result['name'],
                    'price'   	 => $price,
                    'special' 	 => $special,
                    'rating'     => $rating,
                    'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                    'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'merchant_name'     => $result['merchant_name'],
                    'merchant_url' => "mp/store?store_id=".$result['store_id']
            );
         }         
        
        $this->data['pdata'] = $store;
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mp/store_product_list.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/mp/store_product_list.tpl';
        } else {
                $this->template = 'default/template/mp/store_product_list.tpl';
        }

        $this->children = array(
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
        );

        $this->response->setOutput($this->render());        
    }
    
}
?>