<?php

ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(E_ALL);

define('DS',DIRECTORY_SEPARATOR);

$system_path = rtrim(dirname(__FILE__), DS).DS;
define('BASEPATH', str_replace("\\", DS, $system_path));

// DIR
if(defined('APP') && APP=='admin'){
    define('DIR_APPLICATION', BASEPATH.'admin'.DS);    
    define('DIR_TEMPLATE', DIR_APPLICATION.'view'.DS.'template'.DS);
    define('DIR_CATALOG', BASEPATH.'catalog'.DS);
}else if(defined('APP') && APP=='merchant'){
    define('DIR_APPLICATION', BASEPATH.'merchant'.DS);    
    define('DIR_TEMPLATE', DIR_APPLICATION.'view'.DS.'template'.DS);
    define('DIR_CATALOG', BASEPATH.'catalog'.DS);
}else{
    define('DIR_APPLICATION', BASEPATH.'catalog'.DS);    
    define('DIR_TEMPLATE', DIR_APPLICATION.'view'.DS.'theme'.DS);
}
define('DIR_SYSTEM', BASEPATH.'system'.DS);
define('DIR_DATABASE', DIR_SYSTEM.'database'.DS);
define('DIR_LANGUAGE', DIR_APPLICATION.'language'.DS);
define('DIR_CONFIG', DIR_SYSTEM.'config'.DS);
define('DIR_IMAGE', BASEPATH.'image'.DS);
define('DIR_CACHE', DIR_SYSTEM.'cache'.DS);
define('DIR_DOWNLOAD', BASEPATH.'download'.DS);
define('DIR_LOGS', DIR_SYSTEM.'logs'.DS);

// DB
define('DB_DRIVER', 'mysqli');
//define('DB_HOSTNAME', $_SERVER['SERVER_NAME']);
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'ubuyibuy');
define('DB_PREFIX', 'oc_');

// SALT
define('PASS_SALT','123456789');
?>