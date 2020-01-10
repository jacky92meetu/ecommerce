<?php

class ModelMerchantOrder extends Model {
    public function getProductOrder($store_id=0, $order_product_id=0) {
        $temp = $this->db->query("select a.order_product_id,a.order_id,a.product_id,a.name,a.quantity,a.price,a.`order_voucher_code`,(select image from ".DB_PREFIX."product where product_id=a.product_id) as image,a.total,a.tax,b.date_added
from ".DB_PREFIX."order_product a 
left join ".DB_PREFIX."order b on a.order_id=b.order_id
where b.order_status_id>=0 and a.order_product_id=".(int)$order_product_id." and a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) LIMIT 1");
        return $temp->row;
    }
    
    public function getOrderOptions($order_id, $order_product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");
        return $query->rows;
    }
    
}

?>