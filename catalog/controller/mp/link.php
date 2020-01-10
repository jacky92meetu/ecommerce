<?php

class ControllerMpLink extends Controller {
    public function index(){
        return $this->link();
    }
    
    public function link() {
        $this->load->model('merchant/link');
        $link = $this->model_merchant_link->getLink($this->request->get['link_id']);        
        if (!$link || $link['link_status']!="1" 
                || (isset($link['link_value']['start_date']) && strtotime("now")<strtotime($link['link_value']['start_date'])) 
                || (isset($link['link_value']['end_date']) && strtotime("now")>strtotime($link['link_value']['end_date'])) 
            ) {
            $this->redirect($this->url->link('error/not_found'));
        }
        if(isset($link['link_value']['link_url']) && $link['link_value']['link_url']=="#"){
            $link['link_value']['link_url'] = $this->url->link('common/home');
        }
        $link_type = $link['link_type'];
        if (!method_exists($this, "validate_link_type_" . $link_type)) {
            $this->redirect($this->url->link('error/not_found'));
        }
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home'),
        'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
                'text'      => $link['link_name'],
                'href'      => $this->url->link('mp/link', 'link_id=' . $link['link_id']."&category_id=".$this->request->get['category_id']."&merchant_id=".$this->request->get['merchant_id']),
                'separator' => $this->language->get('text_separator')
        );

        return call_user_func(array($this,"validate_link_type_" . $link_type), $link);        
    }
    
    public function spage(){
        $file = $this->config->get('config_template') . '/template/mp/static_page/'.$this->request->get['page'].'.tpl';
        if (!file_exists(DIR_TEMPLATE . $file)) {
            $this->redirect($this->url->link('error/not_found'));
        }
        
        $this->template = $file;

        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }
    
    private function validate_link_type_redirect($link){
        $this->redirect($link['link_value']['link_url']);
    }
    
    private function validate_link_type_page($link){
        $this->data['pdata'] = $link;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mp/link_page.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/mp/link_page.tpl';
        } else {
            $this->template = 'default/template/mp/link_page.tpl';
        }

        $this->children = array(
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );

        $this->response->setOutput($this->render());
    }
    
    private function validate_link_type_product($link){
        $this->load->model('merchant/link');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        
        $data_header['name'] = array("display_name" => "Product Name");
        $data_header['discount_price'] = array("display_name" => "Product Price");
        $this->data['data_header'] = $data_header;
        
        $this->data['data_list'] = $this->model_merchant_link->getProductByLink($link['link_id']);
                        
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
        
        $this->data['pdata'] = $link;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mp/link_product.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/mp/link_product.tpl';
        } else {
            $this->template = 'default/template/mp/link_product.tpl';
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