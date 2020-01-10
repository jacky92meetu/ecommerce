<?php 
if( !class_exists("ModuleSample") ) {
	class ModuleSample { 
		public static function getModules(){ 
			$modules = array(
				'account',
				'affiliate',
				'banner',
				'carousel',
				'category',
				'featured',
				'pavcarousel',
				'pavcategorytabs',
				'pavcustom',
				'pavmegamenu',
				'pavnewsletter',
				'pavproductcarousel',
				'pavsliderlayer',
				'special',
			);
	
			return $modules;
		}
		
		public static function getModulesQuery(){
			$query = array();
			if( is_file(dirname(__FILE__).'/query.php') ){
				require( dirname(__FILE__).'/query.php' );
			}

			return $query;
		}
		
		public static function getStoreConfigs(){
			return array(
					'config_image_category_width' =>873,
					'config_image_category_height' => 270,
					
					'config_image_thumb_width' =>550,
					'config_image_thumb_height' => 650,
					
					'config_image_popup_width' =>550,
					'config_image_popup_height' => 650,
					
					'config_image_product_width' =>200,
					'config_image_product_height' => 236,
					
					'config_image_additional_width' =>82,
					'config_image_additional_height' => 97,
					
					'config_image_related_width' =>550,
					'config_image_related_height' => 650,
					
					'config_image_compare_width' =>65,
					'config_image_compare_height' => 77,
					
					'config_image_wishlist_width' =>65,
					'config_image_wishlist_height' => 77,
					
					'config_image_cart_width' =>65,
					'config_image_cart_height' => 77,
			);
		}
	
	}
}
?>