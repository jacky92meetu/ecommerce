<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
                
                $this->load->model('catalog/product');                
                $this->load->model('tool/image');
                $this->data['products'] = array();
                $results = $this->model_catalog_product->getProducts(array("limit"=>20));
                foreach ($results as $result) {
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
                        
                        if ($this->config->get('config_tax')) {
                                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                        } else {
                                $tax = false;
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
                                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                                'tax'         => $tax,
                                'rating'     => $rating,
                                'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                                'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                                'merchant_name' => $result['merchant_name'],
                                'merchant_url' => "mp/store?store_id=".$result['store_id']
                        );
                }
                
                $this->load->model('merchant/link');
                $link = $this->model_merchant_link->getLink();
                $this->data['link_7'] = array();
                $floor_link_group = array();
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
                        if($value['position_name']=="Floor Menu"){
                            if(!isset($floor_link_group[$value['link_value']['display_option']['floor_id']])){
                                $floor_link_group[$value['link_value']['display_option']['floor_id']] = array();
                            }
                            $floor_link_group[$value['link_value']['display_option']['floor_id']][$value['link_id']] = $value;
                        }                        
                    }
                }
                
                $this->load->model('merchant/floor');
                $floors = $this->model_merchant_floor->getFloor();
                $this->data['floor_list'] = array();
                foreach($floors as $key => $value){
                    if($value['floor_status']!=1){continue;}
                    $value['template_path'] = BASEPATH."merchant".DS."view".DS."template".DS."floor_template".DS.$value['floor_value']['floor_template'].".tpl";
                    foreach($value['floor_value']['template_image'] as $image_id => $image){                        
                        if(file_exists(DIR_IMAGE."floor_template".DS.$value['floor_id'].DS.$image_id.".jpg")){
                            $value['floor_value']['template_image'][$image_id]['image_url'] = "/image/floor_template/".$value['floor_id']."/".$image_id.".jpg";
                        }else{
                            $value['floor_value']['template_image'][$image_id]['image_url'] = "";
                        }
                        if(isset($image['image_price']) && strlen($image['image_price'])>0){
                            $value['floor_value']['template_image'][$image_id]['image_price'] = '<span class="price">RM'.$image['image_price'].'</span>';
                        }
                        if(isset($image['image_link']) && strlen($image['image_link'])>0){
                            $value['floor_value']['template_image'][$image_id]['image_link'] = $this->url->link($image['image_link']);
                        }                        
                    }
                    $value['floor_value']['menu_link'] = array();
                    if(isset($floor_link_group[$value['floor_id']])){
                        $value['floor_value']['menu_link'] = $floor_link_group[$value['floor_id']];
                    }                    
                    $this->data['floor_list'][$key] = $value;
                }
		
                $this->children = array(
                        'common/column_left',
                        'common/column_right',
                        'common/content_top',
                        'common/content_bottom',
                        'common/footer',
                        'common/header'
                );

                $this->response->setOutput($this->render());
	}
}
?>