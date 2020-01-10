<?php

class ModelMerchantLink extends Model {

    public function createLink($data) {
        $id = 0;
        $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_management_link` (link_value, link_status, sort_order, link_position, link_name, created_date, 
	modified_date, link_type)"
                . " VALUES('" . $this->db->escape($data['link_value']) . "', " . (int) $data['link_status'] . ", " . (int) $data['sort_order'] . ", '" . $this->db->escape($data['link_position']) . "', '" . $this->db->escape($data['link_name'])
                . "',NOW(),NOW(),'" . $this->db->escape($data['link_type']) . "')");
        if ($query) {
            $id = $this->db->getLastId();
        }
        return $id;
    }

    public function updateLink($data) {
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "merchant_management_link` SET `link_value`='" . $this->db->escape($data['link_value']) . "', `link_status`=" . (int) $data['link_status'] . ", `sort_order`=" . (int) $data['sort_order'] . ", `link_position`='" . $this->db->escape($data['link_position']) . "', `link_name`='" . $this->db->escape($data['link_name'])
                . "', `modified_date`=NOW(), `link_type`='" . $this->db->escape($data['link_type']) . "' WHERE `link_id`=" . (int) $data['link_id'] . " LIMIT 1");
        return $query;
    }

    public function deleteLink($link_id) {
        $query = $this->db->query("DELETE FROM `" . DB_PREFIX . "merchant_management_link` WHERE `link_id`=" . (int) $link_id . " LIMIT 1");
        return $query;
    }
    
    public function duplicateLink($link_id) {
        $id = false;
        $query = $this->db->query("INSERT INTO `".DB_PREFIX."merchant_management_link` 
	(link_value, link_status, sort_order, link_position, link_name, created_date, 
	modified_date, link_type)
	SELECT
	link_value, link_status, sort_order, link_position, link_name, created_date, 
	modified_date, link_type FROM `".DB_PREFIX."merchant_management_link` WHERE `link_id`=".(int)$link_id);
        if ($query) {
            $id = $this->db->getLastId();
        }
        return $id;
    }

    public function getLinkById($link_id) {
        $where = "";
        if (isset($link_id) && strlen($link_id) > 0) {
            $where = " WHERE `link_id`=" . (int) $link_id;
        }
        $temp = $this->db->query("SELECT a.*,b.position_name FROM `" . DB_PREFIX . "merchant_management_link` a LEFT JOIN `" . DB_PREFIX . "merchant_management_position` b ON a.link_position=b.position_id " . $where . " ORDER BY a.sort_order");
        return $temp->row;
    }

    public function getLinkPosition() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant_management_position` WHERE `status`=1 ORDER BY `sort_order`");
        return $query->rows;
    }

}

?>