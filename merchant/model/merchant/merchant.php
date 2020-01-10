<?php
class ModelMerchantMerchant extends Model {
    public function addMerchant($data) {
        $id = 0;
        $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant` (`username`, `password`, `name`, `email`, `ip`, `activate_code`, `status`, `date_added`)"
                        ." VALUES('".$this->db->escape($data['email'])."', '".$this->db->escape($data['password'])."', '".$this->db->escape($data['name'])."', '".$this->db->escape($data['email'])
                        ."', '".$this->db->escape($data['ip'])."', '".$this->db->escape($data['activation_code'])."', '1', NOW())");
        if($query){
            $id = $this->db->getLastId();
            if($id){
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_store` (`merchant_id`,`store_name`,`store_img_url`,`store_date_added`) VALUES('".$id."','".$this->db->escape($data['store_name'])."','profile-pic.jpg', NOW())");
            }
        }
        return $id;
    }
    
    public function editMerchant($data){
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET "
                ." `name` = '".$this->db->escape($data['name'])."'"
                .", `birthday` = '".$this->db->escape($data['v_birthday'])."'"
                .", `gender` = '".$this->db->escape($data['gender'])."'"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_store` SET "
                ." `store_short_url` = '".$this->db->escape($data['store_short_url'])."'"
                .", `comp_name` = '".$this->db->escape($data['comp_name'])."'"
                .", `comp_reg_no` = '".$this->db->escape($data['comp_reg_no'])."'"
                .", `comp_website` = '".$this->db->escape($data['comp_website'])."'"
                .", `store_name` = '".$this->db->escape($data['store_name'])."'"
                .", `comp_desc` = '".$this->db->escape($data['comp_desc'])."'"
                .", `comp_tel` = '".$this->db->escape($data['comp_tel'])."'"
                .", `comp_fax` = '".$this->db->escape($data['comp_fax'])."'"
                .", `comp_email` = '".$this->db->escape($data['comp_email'])."'"
                .", `comp_address` = '".$this->db->escape($data['comp_address'])."'"
                .", `comp_facebook_link` = '".$this->db->escape($data['comp_facebook_link'])."'"
                .", `comp_twitter_link` = '".$this->db->escape($data['comp_twitter_link'])."'"
                .", `comp_operation_hour` = '".$this->db->escape($data['comp_operation_hour'])."'"
                ." WHERE `store_id` = '".(int)$data['store_id']."' AND `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");
        
        $this->merchant->update_profile();
        
        return $result;
    }
    
    public function setActivateCode($data){                
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET "
                ." `activate_code` = '".$this->db->escape($data['activate_code'])."'"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");        
        return $result;
    }
    
    public function changePassword($data){
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET "
                ." `password` = '".$this->db->escape($data['new_password'])."'"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");        
        return $result;
    }
    
    public function activation($data){
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET "
                ." `status` = 1"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");        
        return $result;
    }
    
    public function getMerchantByUsername($username) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant` a WHERE a.`username` = '" . $this->db->escape($username) . "' LIMIT 1");
        return $query->row;
    }
    
    public function getMerchantById($merchant_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant` a WHERE a.`merchant_id` = '" . (int)$merchant_id . "' LIMIT 1");
        return $query->row;
    }
    
    public function getMerchantByIdWithFirstStore($merchant_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "merchant` a LEFT JOIN `" . DB_PREFIX . "merchant_store` b on a.merchant_id=b.merchant_id WHERE a.`merchant_id` = '" . (int)$merchant_id . "' LIMIT 1");
        return $query->row;
    }
    
    public function getMerchantPackageById($merchant_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_package` a WHERE a.`package_id` = (SELECT package_id from `" . DB_PREFIX . "merchant_store` where merchant_id='".(int)$merchant_id."') LIMIT 1");
        return $query->row;
    }
    
    public function getStoreById($store_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "merchant_store` a LEFT JOIN `" . DB_PREFIX . "merchant` b on a.merchant_id=b.merchant_id WHERE a.`store_id` = '" . (int)$store_id . "' LIMIT 1");        
        return $query->row;
    }
    
    public function updateProfileImage($data){
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_store` SET "
                ." `store_img_url` = '".$this->db->escape($data['image_url'])."'"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");
        
        $this->merchant->update_profile();
        
        return $result;
    }
    
    public function updateProfileCover($data){
        $result = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_store` SET "
                ." `store_img_cover` = '".$this->db->escape($data['image_url'])."'"
                ." WHERE `merchant_id` = '".(int)$data['merchant_id']."' LIMIT 1");
        
        $this->merchant->update_profile();
        
        return $result;
    }
    
}
?>