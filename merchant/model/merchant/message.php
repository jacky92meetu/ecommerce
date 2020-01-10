<?php
class ModelMerchantMessage extends Model {
    public function getActiveMessageCount($data){
        $result = $this->db->query("SELECT count(*) as counting FROM `".DB_PREFIX."merchant_inbox` WHERE (`type`=0 OR `type` is null) AND (`status`=0 OR `status` is null) AND `merchant_id`=".(int)$data['merchant_id']);
        if($result){
            return $result->row['counting'];
        }
        return false;
    }
    
    public function getAllMessage($data, $order="date_added DESC", $limit){
        $query_str = "SELECT * FROM `".DB_PREFIX."merchant_inbox` WHERE (`type` in ('','0','1') OR `type` is null) AND `merchant_id`=".(int)$data['merchant_id'];
        if(isset($order) && is_string($order) && strlen($order)>0){
            $query_str .= " ORDER BY ".$order;
        }
        if(isset($limit) && is_string($limit) && strlen($limit)>0){
            $query_str .= " LIMIT ".$limit;
        }
        $result = $this->db->query($query_str);
        return $result->rows;
    }
    
    public function set_read_message($data){
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_inbox` SET `status`=1 WHERE `merchant_id`=".(int)$data['merchant_id']." AND `id`=".(int)$data['id']." LIMIT 1");        
        return $query;
    }
    
    public function getMessage($message_id = 0, $merchant_id){
        $message = false;                
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_inbox` WHERE `id`=".(int)$message_id." AND `merchant_id`=".(int)$merchant_id." LIMIT 1");
        if($result->row){
            $temp = json_decode($result->row['message'],true);
            if($temp && is_array($temp)){
                if(isset($temp['code']) && isset($temp['data'])){
                    $temp_msg = $this->getTemplateMessage($temp['code'],$temp['data']);
                    if( $temp_msg !== FALSE ){
                        $result->row['message'] = $temp_msg['message'];
                    }
                }
            }
            $message = $result->row;
        }
        return $message;
    }
    
    public function getTemplateMessage($code,$data){
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_inbox_template` WHERE `code`='".$this->db->escape($code)."' LIMIT 1");
        if($result->row){
            $temp = "";
            if(!is_array($data) && is_string($data)){
                $data = func_get_args();
                array_shift($data);                
            }
            $search_array = array();
            for($i=0; $i<sizeof($data); $i++){
                $search_array[$i] = "{".$i."}";
            }
            $temp = str_replace($search_array, $data, $result->row['message']);
            $temp = preg_replace("/\{[\d]+\}/","",$temp);
            $result->row['message'] = $temp;
            return $result->row;
        }        
        return false;
    }
    
    public function sendMessage($data = array()){
        if(!is_array($data)){
            return false;
        }        
        $data = array_merge(array("merchant_id"=>"","title"=>"","message"=>"","code"=>"","status"=>0,"type"=>"1"),$data);        
        if(isset($data['code']) && strlen($data['code'])>0){
            $result = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_inbox_template` WHERE `code`='".$this->db->escape($data['code'])."' LIMIT 1");
            if($result->row){
                if(strlen($data['title'])==0){
                    $data['title'] = $result->row['title'];
                }
                $json_data = json_encode(array("code"=>$data['code'],"data"=>$data['message']));
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_inbox` (`merchant_id`,`type`,`title`,`message`,`status`,`date_added`) VALUES (".(int)$data['merchant_id'].",'".$this->db->escape($data['type'])."','".$this->db->escape($data['title'])."','".$this->db->escape($json_data)."',".(int)$data['status'].",now())");
            }
        }else{
            $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_inbox` (`merchant_id`,`type`,`title`,`message`,`status`,`date_added`) VALUES (".(int)$data['merchant_id'].",'".$this->db->escape($data['type'])."','".$this->db->escape($data['title'])."','".$this->db->escape($data['message'])."',".(int)$data['status'].",now())");
        }
        if($query){
            return $this->db->getLastId();            
        }
        return false;
    }
    
    public function get_message_count($merchant_id){
        $count = 0;
        $result = $this->db->query("SELECT count(*) as counting FROM `".DB_PREFIX."merchant_inbox` WHERE (`type` in ('','1','2') OR `type` is null) AND (`status`=0 OR `status` is null) AND `merchant_id`=".(int)$merchant_id);
        if($result){
            $count = $result->row['counting'];
        }
        return $count;
    }
}
?>