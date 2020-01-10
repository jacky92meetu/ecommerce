<?php
class ModelMerchantDashboard extends Model {
    public function getTodayOrderByStoreId($store_id=0) {        
        $result = 0;
        $date_start = date("Y-m-d");
        $date_end = date("Y-m-d")." 23:59:59";
        $temp = $this->db->query("select count(b.order_product_id) as counting from ".DB_PREFIX."order a 
                    right join ".DB_PREFIX."order_product b on a.order_id=b.order_id
                    where b.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) and order_status_id>0 and date_added>='".$date_start."' and date_added<='".$date_end."'");
        if($temp->row){
            $result = $temp->row['counting'];
        }
        return $result;
    }
    
    public function getPageView($store_id){
        $result = array("by_today"=>0,"by_week"=>0,"by_month"=>0);
        
        $date_start = date("Y-m-d");
        $date_end = date("Y-m-d")." 23:59:59";
        $query = $this->db->query("select count(id) as counting from ".DB_PREFIX."merchant_customer_online a where a.store_id=".(int)$store_id." and date_added>='".$date_start."' and date_added<='".$date_end."'");
        if($query->row){
            $result['by_today'] = $query->row['counting'];
        }
        
        $temp = date("w");
        if($temp==0){
            $date_start = date("Y-m-d",strtotime(" -6 day"));
            $date_end = date("Y-m-d",strtotime($date_start))." 23:59:59";
        }else{
            $date_start = date("Y-m-d",strtotime(" -".($temp-1)." day"));
            $date_end = date("Y-m-d")." 23:59:59";
        }        
        $query = $this->db->query("select count(id) as counting from ".DB_PREFIX."merchant_customer_online a where a.store_id=".(int)$store_id." and date_added>='".$date_start."' and date_added<='".$date_end."'");
        if($query->row){
            $result['by_week'] = $query->row['counting'];
        }
        
        $date_start = date("Y-m-", strtotime("first day of this month") )."01";
        $date_end = date("Y-m-d", strtotime("last day of this month") );        
        $query = $this->db->query("select count(id) as counting from ".DB_PREFIX."merchant_customer_online a where a.store_id=".(int)$store_id." and date_added>='".$date_start."' and date_added<='".$date_end."'");
        if($query->row){
            $result['by_month'] = $query->row['counting'];
        }
        
        return $result;
    }
    
    public function getTodayReviewByStoreId($store_id=0) {
        $result = 0;
        $date_start = date("Y-m-d");
        $date_end = date("Y-m-d")." 23:59:59";
        $temp = $this->db->query("select count(a.review_id) as counting from ".DB_PREFIX."review a
                    where a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) and date_added>='".$date_start."' and date_added<='".$date_end."' GROUP BY a.review_id");
        if($temp->row){
            $result = $temp->row['counting'];
        }
        return $result;
    }
    
    public function getTodaySalesByStoreId($store_id=0) {
        $result = 0;
        $date_start = date("Y-m-d");
        $date_end = date("Y-m-d")." 23:59:59";
        $temp = $this->db->query("select ifnull(sum(ifnull(b.total,0)+ifnull(b.tax,0)),0) as total from ".DB_PREFIX."order a 
                    right join ".DB_PREFIX."order_product b on a.order_id=b.order_id
                    where b.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) and order_status_id>0 and date_added>='".$date_start."' and date_added<='".$date_end."'");
        if($temp->row){
            $result = $temp->row['total'];
        }
        return $result;
    }
    
    public function getCustomerGenderByStoreId($store_id=0){
        $temp = array("male"=>0,"female"=>0);
        $query = $this->db->query("select gender,count(b.customer_id) as counting from ".DB_PREFIX."merchant_customer_online a join ".DB_PREFIX."customer b on a.customer_id=b.customer_id where a.store_id=".(int)$store_id." and ifnull(a.customer_id,0)>0 group by b.gender");
        if($query->row){
            foreach($query->rows as $record){
                if(strtoupper($record['gender'])=="M"){
                    $temp['male'] = $record['counting'];
                }else if(strtoupper($record['gender'])=="F"){
                    $temp['female'] = $record['counting'];
                }
            }
            $total  = $temp['male'] + $temp['female'];
            $temp['male'] = round($temp['male']/$total*100,2);
            $temp['female'] = 100 - $temp['male'];
        }
        return $temp;
    }
    
    public function getTrafficByStoreId($store_id=0){
        $temp = array();
        $query = $this->db->query("select count(id) as counting from ".DB_PREFIX."merchant_customer_online a where referer_domain not like '%ubib.my%' and length(ifnull(referer_domain,''))>0");
        $total = 0;
        if($query->row){
            $total = $query->row['counting'];
        }
        $temp2 = 0;
        $query = $this->db->query("select referer_domain,count(id) as counting from ".DB_PREFIX."merchant_customer_online a where referer_domain not like '%ubib.my%' and store_id=".(int)$store_id." and length(ifnull(referer_domain,''))>0 group by referer_domain order by count(id) desc limit 4");
        if($query->row){            
            foreach($query->rows as $record){
                $temp[$record['referer_domain']] = round($record['counting']/$total*100,2);
                $temp2 += round($record['counting']/$total*100,2);
            }
        }
        $temp['other'] = 100 - $temp2;        
        return $temp;
    }
    
    public function getMonthlySalesByStoreId($store_id=0) {
        $temp = array();
        for($i=1; $i<=12; $i++){
            $temp[(string)$i] = 0;
        }
        $date_start = date("Y")."-01-01";
        $date_end = date("Y")."-12-31 23:59:59";
        $query = $this->db->query("select month(a.date_added) as month_text, sum(ifnull(b.total,0)+ifnull(b.tax,0)) as total from ".DB_PREFIX."order a 
                    right join ".DB_PREFIX."order_product b on a.order_id=b.order_id
                    where b.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) and order_status_id>0 and date_added>='".$date_start."' and date_added<='".$date_end."'
                    group by month(a.date_added) order by month(a.date_added)");
        if($query->row){
            foreach($query->rows as $record){
                $temp[$record['month_text']] = $record['total'];
            }
        }
        return $temp;
    }
    
    public function getPopularProductsByStoreId($store_id=0) {
        $temp = array();
        $query = $this->db->query("SELECT a.`product_id`,a.`quantity`,a.`stock_status_id`,a.`price`,a.`status`,a.`tax_class_id`,b.`name`,c.`price` as special,d.name as stock_status "
                ." FROM `" . DB_PREFIX . "product` a "
                ." left join `" . DB_PREFIX . "product_description` b on a.product_id=b.product_id "
                ." left join `" . DB_PREFIX . "product_special` c on a.product_id=c.product_id "
                ." left join `" . DB_PREFIX . "stock_status` d on a.stock_status_id=d.stock_status_id "
                ." where a.product_id in (select product_id from ".DB_PREFIX."merchant_product where store_id=".(int)$store_id." and status=1) ORDER BY a.viewed DESC LIMIT 5");
        if($query->row){
            foreach($query->rows as $product){
                $product['price'] = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
                $product['special'] = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
                $temp[] = $product;
            }
        }
        return $temp;
    }
    
}
?>