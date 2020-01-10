<?php
class ModelMerchantMerchant extends Model {
    public function setCustomerOnline($customer_id=0, $store_id=0, $product_id=0){
        $id = false;        
        $referer_domain = "";
        if(isset($_SERVER['HTTP_REFERER']) && strlen($_SERVER['HTTP_REFERER'])>0){
            preg_match_all("#^(http://|https://)?([^\?/]+)#iu", $_SERVER['HTTP_REFERER'],$temp);
            $temp = array_reverse($temp);
            if(isset($temp[0][0])){
                $referer_domain = $temp[0][0];
            }
        }        
        $query = $this->db->query("insert into `".DB_PREFIX."merchant_customer_online` 
	(customer_id, referer_domain, date_added, agent, store_id, product_id, ip)
	values (".(int)$customer_id.", '".$this->db->escape($referer_domain)."', NOW(), '".$this->db->escape($_SERVER['HTTP_USER_AGENT'])."', ".(int)$store_id.", ".(int)$product_id.", '".$this->db->escape($_SERVER['REMOTE_ADDR'])."')");
        $id = $this->db->getLastId();
        if($id){
            $query = $this->db->query("insert into `".DB_PREFIX."merchant_customer_online_info` (id, server_info) values (".$id.", '".$this->db->escape(json_encode($_SERVER))."')");
        }
        return $id;
    }
    
    public function create_newsletter_subscribe($email=""){
        $query = $this->db->query("insert into `".DB_PREFIX."merchant_newsletter_subscribe` 
	(subscribe_email, subscribe_ip, subscribe_agent, date_added)
	values ('".$this->db->escape($email)."', '".$this->db->escape($_SERVER['REMOTE_ADDR'])."', '".$this->db->escape($_SERVER['HTTP_USER_AGENT'])."', NOW())");
        return true;
    }
    
    public function create_promotion_subscribe($promotion_title="",$email=""){
        $query = $this->db->query("insert into `".DB_PREFIX."merchant_promotion_subscribe` 
	(promotion_title, email, server_info, date_added)
	values ('".$this->db->escape($promotion_title)."','".$this->db->escape($email)."', '".$this->db->escape(json_encode($_SERVER))."', NOW())");
        return true;
    }
    
    public function create_merchant_chat($product_id, $email="", $message=""){
        $store = $this->getStoreByProductId($product_id);
        if($store){
            $query = $this->db->query("insert into `".DB_PREFIX."merchant_pm` 
	(`store_id`, `product_id`, `email`, `type`, `message`, `status`, `date_added`)
	values (".(int)$store['store_id'].",".(int)$product_id.",'".$this->db->escape($email)."','0','".$this->db->escape($message)."',0,NOW())");
            if($query){
                $id = $this->db->getLastId();
                $query = $this->db->query("insert into `".DB_PREFIX."merchant_pm_status`
	(`store_id`, `email`, `pm_id`, `type`, `status`, `date_added`)
	values (".(int)$store['store_id'].",'".$this->db->escape($email)."',".(int)$id.",'0',0,NOW()) ON DUPLICATE KEY UPDATE `pm_id`=".(int)$id.", `type`='0',`status`=0,`date_added`=NOW()");
            }
            return true;
        }
        return false;
    }
    
    public function create_ubib_points($customer_id,$order_id,$total){
        //Earn UBIB Reward Points (RM10 => 100 points)
        $points = floor($total/10)*100;
        if($points>0){
            $this->language->load('total/reward');                                        
            $query = $this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$customer_id . "', description = '" . $this->db->escape(sprintf($this->language->get('text_order_id'), (int)$order_id)) . "', points = '" . (int)$points . "', date_added = NOW()");
        }
            
        //Convert to credits (1000 points => 1 credit)
        $query = $this->db->query("SELECT SUM(points) AS total FROM `" . DB_PREFIX . "customer_reward` WHERE customer_id = '" . (int)$customer_id . "' GROUP BY customer_id");
        if ($query->row) {
            $credit = 0;
            $credit = floor($query->row['total']/1000);            
            if($credit>0){
                $redeem_points  = $credit * 1000;
                $this->db->query("INSERT INTO " . DB_PREFIX . "customer_transaction SET customer_id = '" . (int)$customer_id . "', order_id = '" . (int)$order_id . "', description = 'Converted ".$redeem_points." Points To ".$credit." Credits', amount = '" . (float)$credit . "', date_added = NOW()");
                $query = $this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET customer_id = '" . (int)$customer_id . "', description = 'Converted ".$redeem_points." Points To ".$credit." Credits', points = '" . (float)-$redeem_points . "', date_added = NOW()");
            }
        }
        return true;
    }
    
    public function getStoreByStoreId($store_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM `".DB_PREFIX."merchant_store` a left join `".DB_PREFIX."merchant` b ON a.merchant_id=b.merchant_id  WHERE a.`store_status`=1 AND a.store_id=".(int)$store_id);
        return $query->row;
    }
    
    public function getStoreByProductId($product_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM `".DB_PREFIX."merchant_product` a left join `".DB_PREFIX."merchant_store` b ON a.store_id=b.store_id  WHERE b.`store_status`=1 AND a.product_id=".(int)$product_id);
        return $query->row;
    }
    
    public function getAllProductByStoreId($options){
        $store_id = $options['store_id'];
        $order = $options['order'];
        $limit = $options['limit'];        
        $query_str = "select p.*,pd.name,pd.description from `".DB_PREFIX."merchant_product` a 
                    join `".DB_PREFIX."merchant_store` b on a.store_id = b.store_id
                    join `".DB_PREFIX."product` p on a.product_id=p.product_id
                    join `".DB_PREFIX."product_description` pd on p.product_id=pd.product_id
                    where b.store_status=1 and pd.language_id=1 and a.store_id=".(int)$store_id;
        if(isset($order) && is_string($order) && strlen($order)>0){
            $query_str .= " ORDER BY ".$order;
        }
        if(isset($limit) && is_string($limit) && strlen($limit)>0){
            $query_str .= " LIMIT ".$limit;
        }
        $result = $this->db->query($query_str);
        return $result->rows;
    }
    
    public function getMerchantPackageById($merchant_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_package` a WHERE a.`package_id` = (SELECT package_id from `" . DB_PREFIX . "merchant_store` where merchant_id='".(int)$merchant_id."') LIMIT 1");
        return $query->row;
    }
    
    public function generate_order_voucher_code($product_id){
        static $code_list = array();
        $result = false;
        $store = $this->getStoreByProductId($product_id);        
        if($store){
            $store_code = substr(str_replace(" ", "", strtolower($store['store_name'])),0,3).sprintf("%02d",$store['store_id']);
            if(!isset($code_list[$store['store_id']])){
                $code_list[$store['store_id']] = array();
                $query = $this->db->query('select order_voucher_code from `oc_order_product` where left(order_voucher_code,'.  strlen($store_code).') = "'.$store_code.'"');
                if($query->rows){
                    $code_list[$store['store_id']] = $query->rows;
                }
            }            
            $code = $store_code.substr(md5(microtime()),((15-strlen($store_code))*-1));
            if(in_array($code, $code_list[$store['store_id']])){
                return $this->generate_order_voucher_code($product_id);
            }
            $result = strtoupper($code);
        }
        return $result;
    }
    
    public function getQueryWithPagination($query,$option = array(),$getpost = FALSE){
        if(!isset($this->session->data['pagination_data'])){
            $this->session->data['pagination_data'] = array();
        }
        $result = array("row"=>0,"cur_page"=>0,"total_page"=>0,"from_rec"=>0,"to_rec"=>0,"data"=>array(),"filter"=>array());
        $data = array("where"=>array(),"groupby"=>array(),"order"=>array(),"limit"=>10,"default_limit"=>10,"page"=>1,"max_records"=>0,"route"=>"","pagination_range"=>3);
        if(!is_array($option)){
            $option = array();
        }
        if($getpost && isset($this->request->get['filter'])){
            $temp = unserialize(urldecode($this->request->get['filter']));
            $option = array_merge($option,$temp);
        }else if($getpost && isset($this->session->data['pagination_data'][$this->request->get['route']])){
            $temp = unserialize(urldecode($this->session->data['pagination_data'][$this->request->get['route']]));
            $option = array_merge($option,$temp);
        }
        if(is_array($option)){
            foreach($data as $key => $value){
                if(isset($option[$key])){
                    $data[$key] = $option[$key];
                }
            }
        }            
        if(isset($this->request->get['filter_page'])){
            $data['page'] = $this->request->get['filter_page'];
        }
        if(isset($this->request->get['filter_sort_name']) && isset($this->request->get['filter_sort_order'])){
            if($this->request->get['filter_sort_name']==""){
                $data['order'] = array();
            }else{
                $data['order'] = array($this->request->get['filter_sort_name']=>$this->request->get['filter_sort_order']);
            }                
        }            
        if($getpost && isset($this->request->get['filter_limit'])){
            $data['limit'] = $this->request->get['filter_limit'];
        }            
        if(!isset($data['limit']) || (int)$data['limit']<=0){
            if(isset($this->session->data['data_list_limit'])){
                $data['limit'] = $this->session->data['data_list_limit'];
            }else{
                $data['limit'] = $data['default_limit'];
            }                
        }
        if($getpost && isset($this->request->get['filter_search'])){
            if(is_string($this->request->get['filter_search'])){
                foreach($data['where'] as $key => $value){
                    $data['where'][$key] = $this->request->get['filter_search'];
                }
            }else if(is_array($this->request->get['filter_search'])){
                $data['where'] = $this->request->get['filter_search'];
            }                
        }

        $this->session->data['data_list_limit'] = $data['limit'];
        $result['filter'] = $data;
        $this->session->data['pagination_data'][$this->request->get['route']] = urlencode(serialize($data));

        $where = array();
        foreach($data['where'] as $key => $value){
                $temp = explode(".", $key);
                if(sizeof($temp)>1){
                    $key = " ".$temp[0].".`".$temp[1]."` ";
                }else{
                    $key = " `".$key."` ";
                }
                if(is_array($value)){
                    foreach($value as $key2 => $value2){
                        if(is_string($value2)){
                            $where[] = $key.$key2." '".$this->db->escape($value2)."'";
                        }else{
                            $where[] = $key.$key2." ".$value2;
                        }                            
                    }
                }else if(strlen($value)>0){
                    if(is_string($value)){
                            $where[] = $key." LIKE '%".$this->db->escape($value)."%'";
                    }else{
                            $where[] = $key." = ".(float)$value;
                    }
                }
        }
        $where = implode(" AND ",$where);		
        if(strlen($where)>0){
                $apos = strripos($query, " WHERE ");
                $bpos = strripos(substr($query,0,$apos), ")");                    
                if($apos===FALSE || ($bpos!==FALSE && $bpos>$apos)){
                    $where = " WHERE ".$where;
                }else{
                    $where = " AND ".$where;
                }
        }
        if(stripos($query, "{where}")){
            $query = str_ireplace("{where}", $where, $query);
        }else{
            $query .= $where;
        }

        $max_records = "";
        $limit = $data['limit'];		
        if(isset($data['max_records']) && $data['max_records']>0){			
                $max_records = " LIMIT ".$data['max_records'];
                $temp = $data['page'] * $data['limit'];			
                if($temp>$data['max_records']){
                        $limit = ($data['max_records']-(($data['page'] - 1) * $data['limit']));
                }

        }
        $limit_num = $limit;
        $limit = " LIMIT ".(($data['page'] - 1) * $data['limit']).",".$limit;		

        $temp = $this->db->query("SELECT COUNT(*) as counting FROM (".$query.$max_records.") a");		
        if($temp->row && $temp->row['counting']>(($data['page'] - 1) * $data['limit'])){
                $result['row'] = $temp->row['counting'];
                $result['total_page'] = (int)ceil($result['row'] / $data['limit']);
                $result['cur_page'] = $data['page'];
                $result['from_rec'] = (($data['page'] - 1) * $data['limit']) + 1;
                $result['to_rec'] = (($data['page'] - 1) * $data['limit']) + $limit_num;
                if($result['to_rec']>$result['row']){
                        $result['to_rec'] = (int)$result['row'];
                }
        }else{
                return $result;
        }

        $order = array();
        foreach($data['order'] as $key => $value){
            $temp = explode(".", $key);
            if(sizeof($temp)>1){
                $key = " ".$temp[0].".`".$temp[1]."` ";
            }else{
                $key = " `".$key."` ";
            }
            $order[] = $key.$value;
        }
        $order = implode(",",$order);
        if(strlen($order)>0){
                $order = " ORDER BY ".$order;
        }

        $temp = $this->db->query($query.$order.$limit);
        if($temp->rows){
                $result['data'] = $temp->rows;
        }

        /*Pagination Part*/
        $result['pagination'] = array();
        $result['pagination']['ppp'] = ($result['cur_page']>=($data['pagination_range']+3))?1:"";
        $result['pagination']['pp'] = ($result['cur_page']>=($data['pagination_range']+2))?($result['cur_page']-($data['pagination_range']+1)):"";
        $result['pagination']['nn'] = (($result['cur_page']+($data['pagination_range']+1))<=$result['total_page'])?($result['cur_page']+($data['pagination_range']+1)):"";
        $result['pagination']['nnn'] = (($result['cur_page']+($data['pagination_range']+2))<=$result['total_page'])?$result['total_page']:"";
        $result['pagination']['c'] = $result['cur_page'];
        $result['pagination']['p'] = array();
        $result['pagination']['n'] = array();            
        for($i=$data['pagination_range']; $i>0; $i--){
            $temp = $i;
            $result['pagination']['p'][$temp] = (($result['cur_page']-$temp)>0)?($result['cur_page']-$temp):"";

            $temp = ($data['pagination_range'] - $i + 1);
            $result['pagination']['n'][$temp] = (($result['cur_page']+$temp)<=$result['total_page'])?($result['cur_page']+$temp):"";
        }
        /*
        $result['pagination'] = array();
        $result['pagination']['p4'] = ($result['cur_page']>=5)?1:"";
        $result['pagination']['p3'] = ($result['cur_page']>=4)?($result['cur_page']-3):"";
        $result['pagination']['p2'] = (($result['cur_page']-2)>0)?($result['cur_page']-2):"";
        $result['pagination']['p1'] = (($result['cur_page']-1)>0)?($result['cur_page']-1):"";
        $result['pagination']['c'] = $result['cur_page'];
        $result['pagination']['n1'] = (($result['cur_page']+1)<=$result['total_page'])?($result['cur_page']+1):"";
        $result['pagination']['n2'] = (($result['cur_page']+2)<=$result['total_page'])?($result['cur_page']+2):"";
        $result['pagination']['n3'] = (($result['cur_page']+3)<=$result['total_page'])?($result['cur_page']+3):"";
        $result['pagination']['n4'] = (($result['cur_page']+4)<=$result['total_page'])?$result['total_page']:"";
    */
        return $result;
    }
}
?>