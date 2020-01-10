<?php
class ModelMerchantPm extends Model {   
    public function getAllMessageCount($store_id){
        $query_str = "SELECT email,max(`status`) as `status`,max(`date_added`) as date_added FROM `".DB_PREFIX."merchant_pm_status` a WHERE (`type` in ('','0') OR `type` is null) AND `store_id`=".(int)$store_id." GROUP BY email ORDER BY a.`status`,a.`date_added`,a.`email`";        
        $result = $this->db->query($query_str);
        return $result->rows;
    }
    
    public function get_message_count($store_id){
        $count = 0;
        $result = $this->db->query("SELECT count(*) as counting FROM `".DB_PREFIX."merchant_pm_status` WHERE (`type` in ('','0') OR `type` is null) AND (`status`=0 OR `status` is null) AND `store_id`=".(int)$store_id);
        if($result){
            $count = $result->row['counting'];
        }
        return $count;
    }
    
    public function set_read_message($store_id,$email){
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_pm_status` SET `status`=1 WHERE `store_id`=".(int)$store_id." AND `email`='".$this->db->escape($email)."' AND `type`='0'");
        return $query;
    }
    
    public function getMessageByEmail($store_id,$email){
        $message = false;                
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_pm` WHERE `email`='".$this->db->escape($email)."' AND `store_id`=".(int)$store_id." ORDER BY date_added DESC");
        if($result->rows){
            $message = $result->rows;
        }
        return $message;
    }
    
    public function sendMessage($store_id=0,$product_id=0, $email="", $message=""){
        $query = $this->db->query("insert into `".DB_PREFIX."merchant_pm` 
        (`store_id`, `product_id`, `email`, `type`, `message`, `status`, `date_added`)
        values (".(int)$store_id.",".(int)$product_id.",'".$this->db->escape($email)."','1','".$this->db->escape($message)."',0,NOW())");        
        if($query){
            $id = $this->db->getLastId();
            $query = $this->db->query("insert into `".DB_PREFIX."merchant_pm_status`
	(`store_id`, `email`, `pm_id`, `type`, `status`, `date_added`)
	values (".(int)$store_id.",'".$this->db->escape($email)."',".(int)$id.",'1',0,NOW()) ON DUPLICATE KEY UPDATE `pm_id`=".(int)$id.", `type`='1',`status`=0,`date_added`=NOW()");
            return $this->db->getLastId();
        }
        return false;
    }
    
}
?>