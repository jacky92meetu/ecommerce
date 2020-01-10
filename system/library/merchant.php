<?php
class Merchant {
    private $merchant_id;
    private $username;
    private $merchant_info;    

    public function __construct($registry) {
        $this->db = $registry->get('db');
        $this->request = $registry->get('request');
        $this->session = $registry->get('session');        

        $this->update_profile();
    }
    
    public function merchant_dir_check($product_id){
        $targetPath = DIR_IMAGE."floor_template".DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        $targetPath = DIR_IMAGE."merchant".DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        $targetPath = DIR_IMAGE."merchant".DS.$this->merchant_id.DS;                
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        $targetPath = DIR_IMAGE."product".DS."session".DS.$this->merchant_id.DS;
        if(!is_dir($targetPath)){
            mkdir($targetPath);
        }
        if(isset($product_id) && is_numeric($product_id) && !is_nan($product_id) && $product_id>0){
            $targetPath = DIR_IMAGE."product".DS.$product_id.DS;
            if(!is_dir($targetPath)){
                mkdir($targetPath);
            }            
        }        
    }
    
    public function update_profile(){
        if (isset($this->session->data['merchant_id'])) {
            $user_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "merchant` a left join `" . DB_PREFIX . "merchant_store` b on a.`merchant_id`=b.`merchant_id` "
                    . "WHERE a.`merchant_id` = '" . (int)$this->session->data['merchant_id'] . "' AND `status` = 1");

            if ($user_query->num_rows) {
                $this->merchant_id = $user_query->row['merchant_id'];
                $this->username = $user_query->row['username'];
                $this->name = $user_query->row['name'];
                $this->merchant_info = $user_query->row;
            }else{
                $this->logout();
            }
        }
    }
    
    public function getMessage($message_id = 0, $admin = false){
        $message = false;
        $where = "";
        if(!$admin){
            $where = " AND `merchant_id`=".(int)$this->merchant_id;
        }
        $result = $this->db->query("SELECT * FROM `".DB_PREFIX."merchant_inbox` WHERE `id`=".(int)$message_id." ".$where." LIMIT 1");
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
        $data = array_merge(array("merchant_id"=>$this->merchant_id,"title"=>"","message"=>"","code"=>"","status"=>0,"type"=>"1"),$data);        
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
    
    public function get_message_count(){
        $count = 0;
        $result = $this->db->query("SELECT count(*) as counting FROM `".DB_PREFIX."merchant_inbox` WHERE (`type` in ('','1','2') OR `type` is null) AND (`status`=0 OR `status` is null) AND `merchant_id`=".(int)$this->getId());
        if($result){
            $count = $result->row['counting'];
        }
        return $count;
    }

    public function login($username, $password) {
        $result = new stdClass();
        $result->status = "error";
        $result->text = "";
        
        $user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant a left join " . DB_PREFIX . "merchant_store b on a.merchant_id=b.merchant_id "
                    . "WHERE a.`username` = '" . $this->db->escape($username) . "' AND (a.`password` = '" . $this->db->escape($password) . "' OR a.`password` = '" . $this->db->escape(md5($password.PASS_SALT)) . "') LIMIT 1");
        
        if ($user_query->num_rows) {
            if($user_query->row['status']==1){
                $this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET "
                ." `ip` = '".$this->db->escape($_SERVER['REMOTE_ADDR'])."'"
                .", `last_login` = NOW()"
                ." WHERE `merchant_id` = '".$user_query->row['merchant_id']."' LIMIT 1");
                $result->status = "success";
                $this->session->data['merchant_id'] = $user_query->row['merchant_id'];
                $this->merchant_id = $user_query->row['merchant_id'];
                $this->username = $user_query->row['username'];
                $this->name = $user_query->row['name'];
                $this->merchant_info = $user_query->row;
            }else{                
                $result->text = "Please activate your account!";
            }            
        } else {
            $result->text = "Username or password not match!";
        }
        return $result;
    }
    
    public function force_login($merchant_id){
        $this->session->data['merchant_id'] = $merchant_id;
        $this->update_profile();
    }
    
    public function generate_code(){
        return md5(strtotime("now"). mt_rand(1, 1000));
    }

    public function logout() {
            unset($this->session->data['merchant_id']);

            $this->merchant_id = '';
            $this->username = '';


            session_destroy();
    }

    public function isLogged() {
        return $this->merchant_id;
    }

    public function getId() {
        if($this->merchant_info['user_type']==1){
            if(isset($this->request->get['merchant_id'])){
                return $this->request->get['merchant_id'];
            }else if(isset($this->request->post['merchant_id'])){
                return $this->request->post['merchant_id'];
            }
        }
        return $this->merchant_id;
    }

    public function getUserName() {
        return $this->username;
    }
    
    public function getInfo($name){
        if(isset($name)){
                if(isset($this->merchant_info[$name])){
                        return $this->merchant_info[$name];
                }else{
                        return null;
                }
        }
        return $this->merchant_info;
    }
    
    public function set_notice($text="", $type="success"){
        if(!isset($this->session->data['notice_msg'])){
            $this->session->data['notice_msg'] = array();
        }
        foreach($this->session->data['notice_msg'] as $key => $value){
            if($value['type']==$type && $value['text']==$text){
                return false;
            }
        }
        $result = array();
        $result['type'] = $type;
        $result['text'] = $text;
        $this->session->data['notice_msg'][] = $result;
    }
    
    public function get_notice(){
        $temp = $this->session->data['notice_msg'];
        unset($this->session->data['notice_msg']);
        return $temp;
    }
    
    public function link($route,$args = ""){
        $url = HTTP_SERVER;        
        
        if(is_array($args)){
            $temp = array();
            foreach($args as $key => $value){
                $temp[] = $key."=".urlencode($value);
            }
            $args = implode("&",$temp);
        }
        $array = explode("?", $route);        
        $route = array_shift($array);
        $args .= "&".implode("&",$array);
        $url .= 'index.php?route=' . $route;
        if ($args) {
                //$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&')); 
                 $url .= '&' . trim($args, '&');
        }
        $url = str_replace("\\", "/", $url);
        return $url;
    }
    
    public function image_link($url,$default){
        $result = "no_image.jpg";
        foreach(array($url,$default) as $key => $value){
            $pos = stripos($value, "image/");
            $targetPath = trim(str_ireplace(array("\\","/"),DS,(($pos===FALSE)?$value:substr($value,($pos+5)))),DS);
            if(is_file(DIR_IMAGE.$targetPath)){
                $result = $targetPath;
                break;
            }
        }
        $url = "/image/".$result;
        return str_replace("\\","/",$url);
    }
    
     public function image_path($url){
        $result = false;
        $url = trim(str_ireplace(array("\\","/"),DS,$url),DS);
        $pos = stripos($url, "image".DS);
        $pos = ($pos===FALSE)?0:$pos+5;        
        $targetPath = DIR_IMAGE.trim(substr($url,$pos),DS);
        if(is_file($targetPath)){
            $result = $targetPath;            
        }
        return $result;
    }
    
    public function send_mail($email,$subject,$message,$from = "no-reply@ubib.my",$fromname = "UBIB Admin"){
        $status = false;        
        ob_start();
        require_once(DIR_SYSTEM . 'library/phpmailer/class.phpmailer.php');
        $mailer = new PHPMailer(); // create a new object
        $mailer->IsSMTP(); // enable SMTP
        $mailer->SMTPDebug = 1; // debugging: 1 = errors and messages, 2 = messages only
        $mailer->SMTPAuth = true; // authentication enabled			
        $mailer->Host = "mail.ubib.my";
        $mailer->Port = 587;
        if(stripos($message,"<html")!==FALSE){
            $mailer->IsHTML(true);
        }        
        $mailer->Username = "no-reply@ubib.my";
        $mailer->Password = "No-r123#";
        $mailer->SetFrom($from,$fromname);
        $mailer->Subject = $subject;
        $mailer->Body = $message;
        $mailer->AddAddress($email);
        $status = $mailer->send();
        ob_end_clean();
        return $status;
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
    
    public function getLinkManagement($link_id){
        static $object = null;
        if(!isset($object)){
            $temp = $this->db->query("SELECT a.*,b.position_name FROM `".DB_PREFIX."merchant_management_link` a LEFT JOIN `".DB_PREFIX."merchant_management_position` b ON a.link_position=b.position_id ORDER BY a.sort_order");
            if($temp->rows){
                $object = array();
                foreach($temp->rows as $value){
                    $value['link_value'] = json_decode($value['link_value'],true);
                    $object[$value['link_id']] = $value;
                }
            }
        }
        if(isset($link_id)){
            if(isset($object[$link_id])){
                return $object[$link_id];
            }
            return false;
        }
        
        return $object;
    }
    
}
?>