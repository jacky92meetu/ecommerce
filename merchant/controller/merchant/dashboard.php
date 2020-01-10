<?php

class ControllerMerchantDashboard extends Controller {

    public function index() {
        $this->load->model('merchant/merchant');
        $this->load->model('merchant/dashboard');        
        
        $store = $this->model_merchant_merchant->getMerchantByIdWithFirstStore($this->merchant->getId());
        
        $this->data['today_order'] = $this->model_merchant_dashboard->getTodayOrderByStoreId($store['store_id']);
        $this->data['page_view'] = $this->model_merchant_dashboard->getPageView($store['store_id']);
        $this->data['today_review'] = $this->model_merchant_dashboard->getTodayReviewByStoreId($store['store_id']);
        $this->data['today_sales'] = $this->model_merchant_dashboard->getTodaySalesByStoreId($store['store_id']);
        $this->data['customer_gender'] = $this->model_merchant_dashboard->getCustomerGenderByStoreId($store['store_id']);
        $this->data['traffic_source'] = $this->model_merchant_dashboard->getTrafficByStoreId($store['store_id']);
        $this->data['monthly_sales'] = $this->model_merchant_dashboard->getMonthlySalesByStoreId($store['store_id']);        
        $this->data['popular_products'] = $this->model_merchant_dashboard->getPopularProductsByStoreId($store['store_id']);
        foreach($this->data['popular_products'] as $key => $value){
            $this->data['popular_products'][$key]['href'] = "/product/product?product_id=".$value['product_id'];
        }
        
        $this->template = 'merchant/dashboard/dashboard.tpl';
        $this->children = array(
            'common/footer',
            'common/header'
        );
        $this->response->setOutput($this->render());
    }

}

?>