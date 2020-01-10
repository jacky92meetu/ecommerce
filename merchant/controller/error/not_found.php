<?php    
class ControllerErrorNotFound extends Controller {    
	public function index() {
            $this->document->setTitle("404 Error Page - ".$this->language->get("text_heading_title"));
            $this->template = 'error/not_found.tpl';
            $this->children = array(
                    'common/header',
                    'common/footer'
            );				
            $this->response->setOutput($this->render());	
  	}
}
?>