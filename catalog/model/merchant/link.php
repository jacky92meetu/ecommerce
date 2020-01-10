<?php
class ModelMerchantLink extends Model {
    public function getLinkById($link_id){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_management_link` a WHERE a.`link_id` = '" . (int)$link_id . "' LIMIT 1");        
        return $query->row;
    }
    
     public function getLinkPosition(){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_management_position` WHERE `status`=1 ORDER BY `sort_order`");
        return $query->rows;
    }
    
    public function getLink($link_id){
        $data = false;
        $where = "";
        if(isset($link_id) && strlen($link_id)>0){
            $where = " WHERE `link_id`=".(int)$link_id;
        }
        $temp = $this->db->query("SELECT a.*,b.position_name FROM `".DB_PREFIX."merchant_management_link` a LEFT JOIN `".DB_PREFIX."merchant_management_position` b ON a.link_position=b.position_id ".$where." ORDER BY a.sort_order");
        if($temp->rows){
            $data = array();
            foreach($temp->rows as $value){                
                $value['link_value'] = json_decode($value['link_value'],true);
                $data[$value['link_id']] = $value;
            }
        }
        if(isset($data[$link_id])){
            return $data[$link_id];
        }
        return $data;
    }
    
    public function getLinkGroup(){
        $data = false;
        $temp = $this->getLink();
        if($temp){
            $data = array();
            foreach($temp as $value){
                $value['href'] = "mp/link?link_id=".$value['link_id']."&category_id=".$this->request->get['path']."&merchant_id=".$this->request->get['merchant_id'];
                if(!isset($data['link_'.$value['link_position']])){
                    $data['link_'.$value['link_position']] = array();
                }
                $data['link_'.$value['link_position']][] = $value;
            }
        }
        return $data;
    }
    
    public function getProductByLink($link_id){        
        $link = $this->getLink($link_id);
        if(isset($link['link_value']['display_option']['show_with_cat']) && strlen($this->request->get['category_id'])>0){
            $category_id = $this->request->get['category_id'];
            $link['link_value']['filter_option']['filter_option_value']['category_id'] = $category_id;
            $link['link_value']['filter_option']['filter_option_op']['category_id'] = "=";
        }
        if(isset($link['link_value']['display_option']['show_with_merchant']) && strlen($this->request->get['merchant_id'])>0){
            $merchant_id = $this->request->get['merchant_id'];
            $link['link_value']['filter_option']['filter_option_value']['merchant_id'] = $merchant_id;
            $link['link_value']['filter_option']['filter_option_op']['merchant_id'] = "=";
        }
        
        $where = array();
        foreach($link['link_value']['filter_option']['filter_option_value'] as $key => $value){            
            if(strlen($value)>0){
                $temp = "=";
                if(isset($link['link_value']['filter_option']['filter_option_op'][$key]) && strlen($link['link_value']['filter_option']['filter_option_op'][$key])>0){
                    $temp = $link['link_value']['filter_option']['filter_option_op'][$key];
                }
                if($key=="date_added"){
                    $value = date("Y-m-d H:i:s",  strtotime($value));
                }
                if($key=="category_id"){
                    $key = "path_id";
                }
                $where[$key] = array($temp => $value);
            }            
        }
        
        $order = array();
        if(isset($link['link_value']['filter_sort']) && strlen($link['link_value']['filter_sort']['filter_sort_name'])>0){
            $temp = "asc";
            if(isset($link['link_value']['filter_sort']['filter_sort_order'])){
                $temp = $link['link_value']['filter_sort']['filter_sort_order'];
            }
            $order[$link['link_value']['filter_sort']['filter_sort_name']] = $temp;
        }
        
        $option = array(
            "where" => $where,
            "order" => $order,
            "max_records" => $link['link_value']['extra_filter']['max_records'],
            "route" => "mp/link?link_id=".$link['link_id']."&category_id=".$this->request->get['category_id']."&merchant_id=".$this->request->get['merchant_id']
        );
        
        $merchant_query = "";
        if(isset($link['link_value']['filter_option']['filter_option_value']['merchant_id']) && strlen($link['link_value']['filter_option']['filter_option_value']['merchant_id'])>0){
            $merchant_query = " JOIN ".DB_PREFIX."merchant_product mp on mp.product_id=p.product_id LEFT JOIN ".DB_PREFIX."merchant_store ms on ms.store_id=mp.store_id ";
        }
        $selected_product_query = "";
        if(isset($link['link_value']['selected_product']) && strlen($link['link_value']['selected_product'])>0){
            $selected_product_query = " AND p.product_id IN (".$link['link_value']['selected_product'].")";
        }
        $query = "SELECT p.product_id, (SELECT price FROM ".DB_PREFIX."product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '1' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special FROM ".DB_PREFIX."category_path cp LEFT JOIN ".DB_PREFIX."product_to_category p2c ON (cp.category_id = p2c.category_id) LEFT JOIN ".DB_PREFIX."product p ON (p2c.product_id = p.product_id) LEFT JOIN ".DB_PREFIX."product_description pd ON (p.product_id = pd.product_id) ".$merchant_query." WHERE pd.language_id = '1' {where} AND p.status = '1' AND p.date_available <= NOW() ".$selected_product_query." GROUP BY p.product_id";        
        $this->load->model('merchant/merchant');        
        return $this->model_merchant_merchant->getQueryWithPagination($query, $option, FALSE);
    }
}
?>