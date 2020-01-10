<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
            
                // Menu
                $this->load->model('catalog/category');		
                $this->data['categories'] = array();					
                $categories = $this->model_catalog_category->getCategories(0);		
                foreach ($categories as $category) {
                                $this->data['categories'][] = array(
                                        'name'     => $category['name'],                                        
                                        'column'   => $category['column'] ? $category['column'] : 1,
                                        'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
                                        'sort_order' => $category['sort_order']
                                );
                }
            
                $this->load->model('merchant/link');
                $link = $this->model_merchant_link->getLink();
                $this->data['link_4'] = array();
                $this->data['link_5'] = array();
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
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}
		
		$this->render();
	}
}
?>