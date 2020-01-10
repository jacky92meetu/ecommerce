<?php  
/******************************************************
 * @package Pav Category Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

class ControllerModulePavcategorytabs extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('catalog/product'); 
		$this->load->model('tool/image');
		$this->language->load('module/pavcategorytabs');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavcategorytabs.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavcategorytabs.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavcategorytabs.css');
		}
		//echo "<pre>"; print_r($setting); die;
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		$this->data['cols']   = (int)$setting['cols'];
		$this->data['itemsperpage']   = (int)$setting['itemsperpage'];
		$this->data['limit_tabs']   = (int)$setting['limit_tabs'];
		$this->data['status_nav']   = (int)$setting['status_nav'];
		$this->data['prefix_class'] = isset($setting['prefix_class'])?$setting['prefix_class']:'';
		$this->data['icon'] = isset($setting['image'])?$setting['image']:'';

		//get sub categories by id
		$this->load->model('catalog/category');
		$category_id = (int)$setting['category_id'];
		$category = $this->model_catalog_category->getCategory($category_id);
		$sub_categories = $this->model_catalog_category->getCategories($category_id);
		$this->data['category_name'] = $category['name'];
		
		$flag = 0;
		if(empty($sub_categories)) {
			$tabs = $this->_getCategory($category, $setting);
			$flag = 1;
		} else {
			$tabs = $this->_getCategoryTabs($sub_categories, $setting);
			$flag = 0;
		}
		
		$this->data['flag'] = $flag;
		$this->data['tabs'] = $tabs;
		
		
		$this->data['module_description'] = isset($setting['description'][$this->config->get('config_language_id')])?$setting['description'][$this->config->get('config_language_id')]:"";
		$this->data['module_description'] = (html_entity_decode($this->data['module_description'], ENT_QUOTES, 'UTF-8'));
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavcategorytabs.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavcategorytabs.tpl';
		} else {
			$this->template = 'default/template/module/pavcategorytabs.tpl';
		}
		$this->render();
	}
	
	public function _getCategory($category, $setting){
		$results = array();
		$results[trim($category['name'])] = $this->_getProducts($category['category_id'], $setting);
		return $results;
	}
	
	private function _getCategoryTabs( $sub_categories, $setting ){
		$result = array();
		foreach ($sub_categories as $category){
			$result[$category['name']] = $this->_getProducts($category['category_id'], $setting);
		}
		return $result;
	}
	
	private function _getProducts($category_id, $setting){
		$products = array();
		$data = array(
			'filter_category_id' => $category_id,
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit'],
		);
		$results = $this->model_catalog_product->getProducts($data);
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
			} else {
				$image = false;
			}
			
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
			$products[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $result['rating'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}
		return $products;
	}
}
?>