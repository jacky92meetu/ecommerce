<?php   
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
        
        if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {
            $this->data['error'] = $this->session->data['error'];
            
            unset($this->session->data['error']);
        } else {
            $this->data['error'] = '';
        }
                         $this->data['metas'] = array_merge(array(
                             "og:title"=>$this->document->getTitle(),
                             "og:description" => $this->document->getDescription(),
                             "og:image" => "http://www.ubib.my/image/no_image.jpg",
                             "fb:app_id" => "315087005337571"
                            ),$this->document->getMetas());

		$this->data['base'] = $server;
		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();	 
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();                          
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['name'] = $this->config->get('config_name');
		
		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}
		
		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}		
		
		$this->language->load('common/header');
		
		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
    	$this->data['text_search'] = $this->language->get('text_search');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
    	$this->data['text_checkout'] = $this->language->get('text_checkout');
				
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		
		// Daniel's robot detector
		$status = true;
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}
				
		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}
		
		// Menu
		$this->load->model('catalog/category');		
		$this->data['categories'] = array();					
		$categories = $this->model_catalog_category->getCategories(0);		
		foreach ($categories as $category) {
                                $this->data['categories'][] = array(
                                        'name'     => $category['name'],                                        
                                        'column'   => $category['column'] ? $category['column'] : 1,
                                        'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
                                        'sort_order' => $category['sort_order'],
                                        'thumb' => '/image/'.$category['image']
                                );
		}
                
                         $this->load->model('merchant/link');
                         $link = $this->model_merchant_link->getLink();                         
                         $this->data['link_1'] = array();
                         $this->data['link_2'] = array();                         
                         foreach($link as $key => $value){
                             if($value['link_status']==1 
                                     && (!isset($value['link_value']['start_date']) || (strtotime("now")>=strtotime($value['link_value']['start_date']))) 
                                     && (!isset($value['link_value']['end_date']) || (strtotime("now")<=strtotime($value['link_value']['end_date']))) 
                                     && (!isset($this->request->get['path']) || !isset($value['display_option']['visible_in']) || ($this->request->get['path']==$value['link_value']['display_option']['visible_in'])) 
                                ){
                                 $value['href'] = "mp/link?link_id=".$value['link_id']."&category_id=".$this->request->get['path']."&merchant_id=".$this->request->get['merchant_id'];
                                 if(isset($this->data['link_'.$value['link_position']])){
                                     $this->data['link_'.$value['link_position']][] = $value;
                                 }                                 
                             }
                         }
		
		$this->children = array(			
			'module/cart'
		);
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
		
                $this->render();
	} 	
}
?>
