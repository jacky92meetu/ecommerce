<?php
class ModelMerchantProduct extends Model {
    public function getProduct($data){
        $result = false;
        $where = array();
        $where[] = "1=1";
        if(isset($data['merchant_id'])){
            $where[] = "merchant_id=".(int)$data['merchant_id'];
        }
        $query_result = $this->db->query("SELECT a.`product_id`,a.`quantity`,a.`stock_status_id`,a.`price`,a.`image`,a.`status`,a.`date_added`,b.`name`,b.`description`,c.`price` as discount_price,c.`date_start` as start_date,c.`date_end` as end_date "
                ." FROM `" . DB_PREFIX . "product` a "
                ." left join `" . DB_PREFIX . "product_description` b on a.product_id=b.product_id "
                ." left join `" . DB_PREFIX . "product_special` c on a.product_id=c.product_id "                
                ." WHERE b.language_id=".(int)$this->config->get('config_language_id')." AND a.product_id in (select b.product_id from `" . DB_PREFIX . "merchant_store` a left join `" . DB_PREFIX . "merchant_product` b on a.store_id=b.store_id where ".implode(" AND ",$where)." and b.product_id=".(int)$data['product_id']." and b.status=1) LIMIT 1");
        if($query_result->row){            
            $result = $query_result->row;            
            $result['category_group'] = $this->getProductCategory($result['product_id']);
        }
        return $result;
    }
    
    public function getProductImages($product_id, $included_default = false) {
            $result = array();
            $query = $this->db->query("SELECT image FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");
            $result = $query->rows;
            if($included_default){
                $query = $this->db->query("SELECT image FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "' LIMIT 1");            
                array_unshift($result, $query->row);
            }
            
            $image_list = array();
            for($i=0; $i<sizeof($result); $i++){            
                $pos = strrpos($result[$i]['image'], "/");
                if($pos==0){
                    $pos = strrpos($result[$i]['image'], "\\");
                }
                if($pos>0){
                    $pos += 1;
                }
                $result[$i]['name'] = substr($result[$i]['image'], $pos);
                $image_list[] = $result[$i]['image'];                
            }
            $category = "product";
            $targetPath = DIR_IMAGE.$category.DS;
            if(!is_dir($targetPath)){
                mkdir($targetPath);
            }
            $targetPath = DIR_IMAGE.$category.DS.$product_id.DS;
            if(!is_dir($targetPath)){
                mkdir($targetPath);
            }
            if ($dh = opendir($targetPath)) {
                $product = $this->getProduct($product_id);
                while (($file = readdir($dh)) !== false) {
                    if($file!='.' && $file!='..'){
                        $filename = "product/".$product_id."/".$file;                            
                        if($product['image']!=$filename && array_search($filename, $image_list)===FALSE){
                            $result[] = array("image"=>$filename,"name"=>$file);
                        }
                    }
                }
                closedir($dh);
            }

            return $result;
    }
    
    public function getAllProduct($merchant_id, $order = "date_added DESC", $limit){
        $data = array();
        $query_str = "SELECT * FROM `" . DB_PREFIX . "product` a left join `" . DB_PREFIX . "product_description` b on a.product_id=b.product_id WHERE language_id=".(int)$this->config->get('config_language_id')." AND a.product_id in (select b.product_id from `" . DB_PREFIX . "merchant_store` a left join `" . DB_PREFIX . "merchant_product` b on a.store_id=b.store_id where merchant_id=".(int)$merchant_id." and b.status=1)";
        if(isset($order) && is_string($order) && strlen($order)>0){
            $query_str .= " ORDER BY ".$order;
        }
        if(isset($limit) && is_string($limit) && strlen($limit)>0){
            $query_str .= " LIMIT ".$limit;
        }
        $result = $this->db->query($query_str);
        if($result->rows){            
            for($i=0; $i<sizeof($result->rows); $i++){
                $temp = $result->rows[$i];                
                $temp['category_group'] = $this->getProductCategory($temp['product_id']);
                $data[] = $temp;
            }
        }
        return $data;
    }
    
    public function getCategoryGroup(){
        $data = false;
        $result = $this->db->query("select a.category_id,a.level,b.parent_id from `".DB_PREFIX."category_path` a left join `".DB_PREFIX."category` b on a.category_id=b.category_id where a.category_id=a.path_id and b.`status`=1 order by level,path_id");
        if($result->rows){
            $data = array();
            foreach($result->rows as $row){
                if(!isset($data[$row['level']])){
                    $data[$row['level']] = array();
                }
                if(!isset($data[$row['level']][$row['parent_id']])){
                    $data[$row['level']][$row['parent_id']] = array();
                }
                $data[$row['level']][$row['parent_id']][] = $this->getCategory(array("category_id"=>$row['category_id']));
            }
        }
        return $data;
    }
    
    public function getCategoryPath($category_id){
        $data = false;
        $where = "";
        if(isset($category_id) && strlen($category_id)>0){
            $where = "where category_id=".(int)$category_id;
        }
        $result = $this->db->query("select category_id,path_id from ".DB_PREFIX."category_path ".$where." order by level");
        if($result->rows){
            $data = array();
            foreach($result->rows as $row){
                if(!isset($data[$row['category_id']])){
                    $data[$row['category_id']] = array();
                }                
                $data[$row['category_id']][] = $row['path_id'];
            }
        }
        return $data;
    }
    
    public function getCategory($data){
        $where = array("1=1");
        if(!isset($data['show_all'])){
            $where['status'] = "a.`status`=1";
            if(isset($data['status'])){
                $where['status'] = "a.`status`=".(int)$data['status'];
            }
        }
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."category` a LEFT JOIN `".DB_PREFIX."category_description` b on a.category_id=b.category_id WHERE "
                . implode(" AND ", $where)
                ." AND b.language_id=".(int)$this->config->get('config_language_id')." AND a.category_id=".(int)$data['category_id']);
        return $result->row;
    }
    
    public function getProductCategory($product_id){
        $result = $this->db->query("SELECT DISTINCT * FROM `".DB_PREFIX."product_to_category` a LEFT JOIN `".DB_PREFIX."category_description` b on a.category_id=b.category_id WHERE language_id=".(int)$this->config->get('config_language_id')." AND product_id=".(int)$product_id);        
        return $result->rows;
    }
    
    public function getProductOption($product_id){
        $data = false;
        $result = $this->db->query("select a.*,c.name as value_name,d.name as option_name from `".DB_PREFIX."product_option_value` a 
            left join `".DB_PREFIX."product_option` b on a.product_option_id=b.product_option_id
            left join `".DB_PREFIX."option_value_description` c on a.option_value_id=c.option_value_id and c.language_id=1
            left join `".DB_PREFIX."option_description` d on a.option_id=d.option_id and d.language_id=1
            where a.product_id=".(int)$product_id."
            and ifnull(b.product_option_id,'')<>''
            and ifnull(c.option_value_id,'')<>''
            and ifnull(d.option_id,'')<>''");
        if($result->rows){
            $data = array();
            foreach($result->rows as $row){                
                $price = (($row['price_prefix']=="-")?"-":"").$row['price'];
                if(!isset($data[$row['option_id']])){                    
                    $data[$row['option_id']] = $row;
                    $data[$row['option_id']]['data'] = array();
                    if($row['option_id']<=100){
                        $data[$row['option_id']]['main_option'] = 1;
                    }
                }                
                $row['actual_price'] = sprintf("%.2f",(float)$price);
                $data[$row['option_id']]['data'][$row['option_value_id']] = $row;
            }
        }
        return $data;
    }
    
    public function getProductAllOption($main = false){
        $data = false;
        $where = "";
        if($main){
            $where = " AND a.option_id<=100 ";
        }
        $result = $this->db->query("select a.option_value_id,a.option_id,b.name as option_value,c.name as option_name, a.sort_order as option_value_sort_order, d.sort_order as option_sort_order from `".DB_PREFIX."option_value` a 
left join `".DB_PREFIX."option_value_description` b on a.option_value_id=b.option_value_id 
left join `".DB_PREFIX."option_description` c on a.option_id=c.option_id
left join `".DB_PREFIX."option` d on a.option_id=d.option_id
where d.`type`='select' ".$where."
order by a.option_id,a.sort_order,a.option_value_id");
        if($result->rows){
            $data = array();
            foreach($result->rows as $row){
                if(!isset($data[$row['option_id']])){
                    $data[$row['option_id']] = array("name"=>$row['option_name'],"option"=>array());
                }                
                $data[$row['option_id']]['option'][] = $row;
            }
        }
        return $data;
    }
    
    public function getProductStockStatus($stock_status_id){
        $data = false;
        $where = "";
        if(isset($stock_status_id)){
            $where = " AND `stock_status_id`=".(int)$stock_status_id." ";
        }
        $result = $this->db->query("select * from `".DB_PREFIX."stock_status` where language_id=".(int)$this->config->get('config_language_id').$where." ORDER BY stock_status_id");
        if($result->rows){
            $data = array();
            foreach($result->rows as $row){
                $data[$row['stock_status_id']] = $row['name'];
            }
        }
        return $data;
    }
    
    public function getCategoryByParentId($data, $order = "a.sort_order", $limit){
        $query_str = "select a.category_id,a.parent_id,b.name from `".DB_PREFIX."category` a left join `".DB_PREFIX."category_description` b on a.category_id=b.category_id where language_id=".(int)$this->config->get('config_language_id')." AND parent_id=".(int)$data['parent_id'];
        if(isset($order) && is_string($order) && strlen($order)>0){
            $query_str .= " ORDER BY ".$order;
        }
        if(isset($limit) && is_string($limit) && strlen($limit)>0){
            $query_str .= " LIMIT ".$limit;
        }
        $result = $this->db->query($query_str);
        return $result->rows;
    }
    
    public function insertProductImage($data){
        $product = $this->getProduct($data);
        if($product){
            $result = $this->db->query("SELECT ifnull(max(sort_order),0) as sort_order FROM `" . DB_PREFIX . "product_image` WHERE `product_id`=".(int)$data['product_id']);
            $sort_order = ($result->row['sort_order'])?$result->row['sort_order']+1:1;
            $result = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_image` (`product_id`,`image`,`sort_order`) "
                    ." VALUES (".(int)$data['product_id'].",'".$this->db->escape($data['image'])."',".(int)$sort_order.")");
            return $result;
        }
        return false;
    }
    
    public function deleteProductImage($data){        
        $product = $this->getProduct($data);
        if($product){
            if($product['image']==$data['image']){
                $result = $this->updateProductDefaultImage(array("product_id"=>$data['product_id']));
            }else{
                $result = $this->db->query("DELETE FROM `" . DB_PREFIX . "product_image` WHERE product_id='".(int)$data['product_id']."' and image='".$this->db->escape($data['image'])."' LIMIT 1");
            }        
            return $result;
        }
        return false;
    }
	
	public function getLatestTax(){
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."tax_class` ORDER BY date_modified DESC LIMIT 1");
        if($result->row){
            return $result->row['tax_class_id'];
        }
        return 0;
    }
    
    public function createProduct($data){
        $id = 0;
        $tax_id = $this->getLatestTax();        
        $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product` (`model`, `quantity`, `stock_status_id`, `price`, `tax_class_id`, `date_available`, `status`, `date_added`)"
                        ." VALUES('Product',".(int)$data['quantity'].", ".(int)$data['stock_status_id'].", ".(float)$data['price'].",".(int)$tax_id.",'".$this->db->escape($data['v_start_date'])."', 1, NOW())");
        if($query){
            $id = $this->db->getLastId();
            if($id){
                $ubib_points = floor($data['discount_price']/10)*100;
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_description` (`product_id`,`language_id`,`name`,`description`) VALUES(".$id.",'".(int)$this->config->get('config_language_id')."','".$this->db->escape($data['name'])."','".$this->db->escape($data['description'])."')");
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_to_store` SET product_id = '" . $id . "', store_id = '0'");
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_reward` SET product_id = '" . $id . "', customer_group_id = 1, points = ".(int)$ubib_points);
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_special` (`product_id`,`customer_group_id`,`price`,`date_start`,`date_end`) VALUES(".$id.",1,".(float)$data['discount_price'].",'".$this->db->escape($data['v_start_date'])."','".$this->db->escape($data['v_end_date'])."')");                
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "merchant_product` (`product_id`,`store_id`,`status`) VALUES(".$id.",'".(int)$data['store_id']."',1)");
                foreach($data['category_group'] as $category_id){
                    $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_to_category` (`product_id`,`category_id`) VALUES(".$id.",'".(int)$category_id."')");
                }
                
                $data['product_id'] = $id;
                if(isset($data['main_product_option_vchecked'])){
                    $main_option_list = $this->getProductAllOption(true);
                    foreach($main_option_list as $key => $value){
                        if(isset($data['main_product_option_vchecked'][$key])){
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`,`option_id`,`required`) VALUES(".(int)$data['product_id'].",".(int)$key.",1)");
                            $product_option_id = $this->db->getLastId();
                            foreach($value['option'] as $option){
                                if(isset($data['main_product_option_vchecked'][$option['option_id']][$option['option_value_id']]) && isset($data['main_product_option_vprice'][$option['option_id']][$option['option_value_id']])){                            
                                    $price = $data['main_product_option_vprice'][$option['option_id']][$option['option_value_id']];
                                    if(is_nan($price)){$price = 0;}
                                    $price_prefix = (substr($price,0,1)=="-")?"-":"+";
                                    $price = abs($price);                        
                                    $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value`(`product_option_id`,`product_id`,`option_id`,`option_value_id`,`subtract`,`price`,`price_prefix`) VALUES(".$product_option_id.",".(int)$data['product_id'].",".(int)$option['option_id'].",".(int)$option['option_value_id'].",0,".(float)$price.",'".$price_prefix."')");
                                }
                            }    
                        }        
                    }
                }            
                $option_sort = 0;
                foreach($data['product_option'] as $key => $value){
                    if(strlen($value)>0){
                        $this->db->query("INSERT INTO `" . DB_PREFIX . "option`(`type`,`sort_order`) VALUES('select',".$option_sort.")");
                        $option_id = $this->db->getLastId();
                        $this->db->query("INSERT INTO `" . DB_PREFIX . "option_description`(`option_id`,`language_id`,`name`) VALUES(".$option_id.",1,'".$this->db->escape($value)."')");
                        $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`,`option_id`,`required`) VALUES(".(int)$data['product_id'].",".$option_id.",1)");
                        $product_option_id = $this->db->getLastId();
                        if(isset($data['product_option_vname'][$key])){
                            $value_sort = 0;
                            foreach($data['product_option_vname'][$key] as $key2 => $value2){
                                if(strlen($value2)>0){
                                    $price = 0;
                                    if(isset($data['product_option_vprice'][$key][$key2])){
                                        $price = $data['product_option_vprice'][$key][$key2];
                                    }
                                    $price_prefix = (substr($price,0,1)=="-")?"-":"+";
                                    $price = abs($price);
                                    $this->db->query("INSERT INTO `" . DB_PREFIX . "option_value`(`option_id`,`sort_order`) VALUES(".$option_id.",".$value_sort.")");
                                    $option_value_id = $this->db->getLastId();
                                    $this->db->query("INSERT INTO `" . DB_PREFIX . "option_value_description`(`option_value_id`,`option_id`,`language_id`,`name`) VALUES(".$option_value_id.",".$option_id.",1,'".$this->db->escape($value2)."')");
                                    $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value`(`product_option_id`,`product_id`,`option_id`,`option_value_id`,`subtract`,`price`,`price_prefix`) VALUES(".$product_option_id.",".(int)$data['product_id'].",".$option_id.",".$option_value_id.",0,".(float)$price.",'".$price_prefix."')");
                                    $value_sort += 1;
                                }
                            }
                        }
                        $option_sort += 1;
                    }            
                }
                
            }
        }
        
        return $id;
    }
    
    public function updateProductDefaultImage($product_id,$image_list){
        if(!isset($image_list)){
            $image_list = array();
            $result = $this->getProductImages($product_id, true);
            foreach($result as $value){
                $image_list[$value['name']] = $value['name'];
            }
        }
        
        $category = "product";
        $targetPath = DIR_IMAGE.$category.DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        $targetPath = DIR_IMAGE.$category.DS.$product_id.DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }        
        $files = array();
        foreach($image_list as $key => $value){
            if(is_file($targetPath.$key)){
                $files[$key] = $value;
            }
        }
        if ($dh = opendir($targetPath)) {
            while (($file = readdir($dh)) !== false) {
                if($file!='.' && $file!='..' && !array_key_exists($file, $files)){
                    $files[$file] = $file;
                }                
            }
            closedir($dh);
        }
        $default = array_shift($files);
        if($default){
            $query = $this->db->query("UPDATE `" . DB_PREFIX . "product` SET `image`='".$this->db->escape("product/".$product_id."/".$default)."' WHERE `product_id`=".(int)$product_id." LIMIT 1");            
        }else{
            $query = $this->db->query("UPDATE `" . DB_PREFIX . "product` SET `image`=NULL WHERE `product_id`=".(int)$product_id." LIMIT 1");
        }        
        $query = $this->db->query("DELETE FROM `" . DB_PREFIX . "product_image` WHERE product_id='".(int)$product_id."' ");
        foreach($files as $key => $value){
            $this->insertProductImage(array("product_id"=>$product_id,"image"=>"product/".$product_id."/".$value));
        }
        
        return true;
    }
    
    public function updateProduct($data){
        $tax_id = $this->getLatestTax();
        $ubib_points = floor($data['discount_price']/10)*100;
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "product` SET `quantity`=".(int)$data['quantity'].",`stock_status_id`='".(int)$data['stock_status_id']."',`price`=".(float)$data['price'].",`tax_class_id`=".(int)$tax_id.",`date_available`='".$this->db->escape($data['v_start_date'])."',`date_modified`=NOW(),`image`='".$this->db->escape($data['image'])."' WHERE `product_id`=".(int)$data['product_id']." LIMIT 1");
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "product_description` SET `name`='".$this->db->escape($data['name'])."',`description`='".$this->db->escape($data['description'])."' WHERE `product_id`=".(int)$data['product_id']." AND language_id=".(int)$this->config->get('config_language_id')." LIMIT 1");
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "product_reward` SET `points`=".(int)$ubib_points." WHERE `product_id`=".(int)$data['product_id']." LIMIT 1");
        $query = $this->db->query("UPDATE `" . DB_PREFIX . "product_special` SET `price`=".(float)$data['discount_price'].",`date_start`='".$this->db->escape($data['v_start_date'])."',`date_end`='".$this->db->escape($data['v_end_date'])."' WHERE `product_id`=".(int)$data['product_id']." LIMIT 1");
        $query = $this->db->query("DELETE FROM `" . DB_PREFIX . "product_to_category` WHERE `product_id`=".(int)$data['product_id']);
        foreach($data['category_group'] as $category_id){
            $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "product_to_category` (`product_id`,`category_id`) VALUES(".(int)$data['product_id'].",'".(int)$category_id."')");
        }        
        
        $old_option = $this->getProductOption($data['product_id']);
        foreach($old_option as $key => $value){
            $this->db->query("DELETE FROM `" . DB_PREFIX . "product_option_value` WHERE `option_id`=".(int)$key);
            $this->db->query("DELETE FROM `" . DB_PREFIX . "product_option` WHERE `option_id`=".(int)$key);
            if((int)$key>100){
                $this->db->query("DELETE FROM `" . DB_PREFIX . "option_value_description` WHERE `option_id`=".(int)$key);
                $this->db->query("DELETE FROM `" . DB_PREFIX . "option_value` WHERE `option_id`=".(int)$key);
                $this->db->query("DELETE FROM `" . DB_PREFIX . "option_description` WHERE `option_id`=".(int)$key);
                $this->db->query("DELETE FROM `" . DB_PREFIX . "option` WHERE `option_id`=".(int)$key);
            }
        }
        if(isset($data['main_product_option_vchecked'])){
            $main_option_list = $this->getProductAllOption(true);
            foreach($main_option_list as $key => $value){
                if(isset($data['main_product_option_vchecked'][$key])){
                    $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`,`option_id`,`required`) VALUES(".(int)$data['product_id'].",".(int)$key.",1)");
                    $product_option_id = $this->db->getLastId();
                    foreach($value['option'] as $option){
                        if(isset($data['main_product_option_vchecked'][$option['option_id']][$option['option_value_id']]) && isset($data['main_product_option_vprice'][$option['option_id']][$option['option_value_id']])){                            
                            $price = $data['main_product_option_vprice'][$option['option_id']][$option['option_value_id']];
                            if(is_nan($price)){$price = 0;}
                            $price_prefix = (substr($price,0,1)=="-")?"-":"+";
                            $price = abs($price);                        
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value`(`product_option_id`,`product_id`,`option_id`,`option_value_id`,`subtract`,`price`,`price_prefix`) VALUES(".$product_option_id.",".(int)$data['product_id'].",".(int)$option['option_id'].",".(int)$option['option_value_id'].",0,".(float)$price.",'".$price_prefix."')");
                        }
                    }    
                }        
            }
        }            
        $option_sort = 0;
        foreach($data['product_option'] as $key => $value){
            if(strlen($value)>0){
                $this->db->query("INSERT INTO `" . DB_PREFIX . "option`(`type`,`sort_order`) VALUES('select',".$option_sort.")");
                $option_id = $this->db->getLastId();
                $this->db->query("INSERT INTO `" . DB_PREFIX . "option_description`(`option_id`,`language_id`,`name`) VALUES(".$option_id.",1,'".$this->db->escape($value)."')");
                $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`,`option_id`,`required`) VALUES(".(int)$data['product_id'].",".$option_id.",1)");
                $product_option_id = $this->db->getLastId();
                if(isset($data['product_option_vname'][$key])){
                    $value_sort = 0;
                    foreach($data['product_option_vname'][$key] as $key2 => $value2){
                        if(strlen($value2)>0){
                            $price = 0;
                            if(isset($data['product_option_vprice'][$key][$key2])){
                                $price = $data['product_option_vprice'][$key][$key2];
                            }
                            $price_prefix = (substr($price,0,1)=="-")?"-":"+";
                            $price = abs($price);
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "option_value`(`option_id`,`sort_order`) VALUES(".$option_id.",".$value_sort.")");
                            $option_value_id = $this->db->getLastId();
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "option_value_description`(`option_value_id`,`option_id`,`language_id`,`name`) VALUES(".$option_value_id.",".$option_id.",1,'".$this->db->escape($value2)."')");
                            $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option_value`(`product_option_id`,`product_id`,`option_id`,`option_value_id`,`subtract`,`price`,`price_prefix`) VALUES(".$product_option_id.",".(int)$data['product_id'].",".$option_id.",".$option_value_id.",0,".(float)$price.",'".$price_prefix."')");
                            $value_sort += 1;
                        }
                    }
                }
                $option_sort += 1;
            }            
        }
        
        return true;
    }
    
    public function deleteProduct($data){
        $this->db->query("INSERT INTO `" . DB_PREFIX . "product_deleted` SELECT * FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int) $data['product_id'] . "' LIMIT 1");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int) $data['product_id'] . "'");
        $this->db->query("UPDATE `" . DB_PREFIX . "merchant_product` SET status=9 WHERE product_id = '" . (int)$data['product_id'] . "'");        
        return true;
    }
    
    public function updateProductStatus($data){
        $this->db->query("UPDATE `" . DB_PREFIX . "product` SET status=".(int)$data['status']." WHERE product_id = '" . (int)$data['product_id'] . "'");
        return true;
    }
    
    public function getProductVisit($product_id){
        $result = 0;
        $query = $this->db->query("select count(id) as counting from ".DB_PREFIX."merchant_customer_online a where a.product_id=".(int)$product_id);
        if($query->row){
            $result = $query->row['counting'];
        }
        return $result;
    }
}
?>