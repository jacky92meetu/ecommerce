<?php

class ModelMerchantFloor extends Model {

    public function createFloor($data) {
        $id = 0;
        $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_management_floor` (floor_value, floor_status, sort_order, floor_name, created_date, 
	modified_date)"
                . " VALUES('', 0, 0, '" . $this->db->escape($data['floor_name'])
                . "',NOW(),NOW())");
        if ($query) {
            $id = $this->db->getLastId();
        }
        return $id;
    }

    public function updateFloor($data) {
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_management_floor` SET `floor_value`='" . $this->db->escape($data['floor_value']) . "', `floor_status`=" . (int) $data['floor_status'] . ", `sort_order`=" . (int) $data['sort_order'] . ", `floor_name`='" . $this->db->escape($data['floor_name'])
                . "', `modified_date`=NOW() WHERE `floor_id`=" . (int) $data['floor_id'] . " LIMIT 1");
        return $query;
    }

    public function deleteFloor($floor_id) {
        $query = $this->db->query("DELETE FROM `" . DB_PREFIX . "merchant_management_floor` WHERE `floor_id`=" . (int) $floor_id . " LIMIT 1");
        return $query;
    }
    
    public function duplicateFloor($floor_id) {
        $id = false;
        $query = $this->db->query("INSERT INTO `".DB_PREFIX."merchant_management_floor` 
	(floor_value, floor_status, sort_order, floor_name, created_date, 
	modified_date, floor_type)
	SELECT
	floor_value, floor_status, sort_order, floor_name, created_date, 
	modified_date, floor_type FROM `".DB_PREFIX."merchant_management_floor` WHERE `floor_id`=".(int)$floor_id);
        if ($query) {
            $id = $this->db->getLastId();
        }
        return $id;
    }

    public function getLinkById($floor_id) {        
        $temp = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_management_floor` WHERE `floor_id`=" . (int) $floor_id . " LIMIT 1");
        return $temp->row;
    }
    
}

?>