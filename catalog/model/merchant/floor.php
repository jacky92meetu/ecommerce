<?php
class ModelMerchantFloor extends Model {
    public function getFloorById($floor_id){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_management_floor` a WHERE a.`floor_status` = 1 AND a.`floor_id` = '" . (int)$floor_id . "' LIMIT 1");        
        return $query->row;
    }
        
    public function getFloor($floor_id){
        $data = false;
        $where = "";
        if(isset($floor_id) && strlen($floor_id)>0){
            $where = " AND a.`floor_id`=".(int)$floor_id;
        }
        $temp = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_management_floor` a WHERE a.`floor_status` = 1 ".$where." ORDER BY a.sort_order");
        if($temp->rows){
            $data = array();
            $count = 1;
            foreach($temp->rows as $value){
                $value['floor_num'] = $count;
                $value['floor_value'] = json_decode(html_entity_decode($value['floor_value']),true);                
                $data[$value['floor_id']] = $value;                
                $count += 1;
            }
        }
        if(isset($data[$floor_id])){
            return $data[$floor_id];
        }
        return $data;
    }
}
?>