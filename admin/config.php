<?php
// HTTP
define('HTTP_CATALOG', 'http://'.$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].'/');
define('HTTP_SERVER', HTTP_CATALOG.'admin/');

// HTTPS
define('HTTPS_CATALOG', 'https://'.$_SERVER['SERVER_NAME'].':'.$_SERVER['SERVER_PORT'].'/');
define('HTTPS_SERVER', HTTPS_CATALOG.'admin/');

define('APP','admin');
require_once('../sys_config.php');

/*
// HTTP
define('HTTP_SERVER', 'http://192.168.1.140:81/admin/');
define('HTTP_CATALOG', 'http://192.168.1.140:81/');

// HTTPS
define('HTTPS_SERVER', 'https://192.168.1.140:81/admin/');
define('HTTPS_CATALOG', 'https://192.168.1.140:81/');

// DIR
define('DIR_APPLICATION', 'E:\xampp-1.7.7\htdocs\lexus_mobile/admin/');
define('DIR_SYSTEM', 'E:\xampp-1.7.7\htdocs\lexus_mobile/system/');
define('DIR_DATABASE', 'E:\xampp-1.7.7\htdocs\lexus_mobile/system/database/');
define('DIR_LANGUAGE', 'E:\xampp-1.7.7\htdocs\lexus_mobile/admin/language/');
define('DIR_TEMPLATE', 'E:\xampp-1.7.7\htdocs\lexus_mobile/admin/view/template/');
define('DIR_CONFIG', 'E:\xampp-1.7.7\htdocs\lexus_mobile/system/config/');
define('DIR_IMAGE', 'E:\xampp-1.7.7\htdocs\lexus_mobile/image/');
define('DIR_CACHE', 'E:\xampp-1.7.7\htdocs\lexus_mobile/system/cache/');
define('DIR_DOWNLOAD', 'E:\xampp-1.7.7\htdocs\lexus_mobile/download/');
define('DIR_LOGS', 'E:\xampp-1.7.7\htdocs\lexus_mobile/system/logs/');
define('DIR_CATALOG', 'E:\xampp-1.7.7\htdocs\lexus_mobile/catalog/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', '192.168.1.140');
define('DB_USERNAME', 'test');
define('DB_PASSWORD', 'test');
define('DB_DATABASE', 'lexus_mobile');
define('DB_PREFIX', 'oc_');
*/
?>