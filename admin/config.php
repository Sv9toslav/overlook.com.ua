<?php

$host = $_SERVER['HTTP_HOST'];

// HTTP
define('HTTP_SERVER', 'http://'.$host.'/admin/');
define('HTTP_CATALOG', 'http://'.$host.'/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$host.'/admin/');
define('HTTPS_CATALOG', 'http://'.$host.'/');

$dir = dirname(dirname(__FILE__));

// DIR
define('DIR_APPLICATION', 'C:/OS/OpenServer/domains/overlook/admin/');
define('DIR_SYSTEM', 'C:/OS/OpenServer/domains/overlook/system/');
define('DIR_IMAGE', 'C:/OS/OpenServer/domains/overlook/image/');
define('DIR_LANGUAGE', 'C:/OS/OpenServer/domains/overlook/admin/language/');
define('DIR_TEMPLATE', 'C:/OS/OpenServer/domains/overlook/admin/view/template/');
define('DIR_CONFIG', 'C:/OS/OpenServer/domains/overlook/system/config/');
define('DIR_CACHE', 'C:/OS/OpenServer/domains/overlook/system/storage/cache/');
define('DIR_DOWNLOAD', 'C:/OS/OpenServer/domains/overlook/system/storage/download/');
define('DIR_LOGS', 'C:/OS/OpenServer/domains/overlook/system/storage/logs/');
define('DIR_MODIFICATION', 'C:/OS/OpenServer/domains/overlook/system/storage/modification/');
define('DIR_UPLOAD', 'C:/OS/OpenServer/domains/overlook/system/storage/upload/');
define('DIR_CATALOG', 'C:/OS/OpenServer/domains/overlook/catalog/');

// DB

define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'overlook_admin');
define('DB_PASSWORD', 'overlook1508!');
define('DB_DATABASE', 'overlook_db');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');