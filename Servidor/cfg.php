<?php
//Init config params

require_once 'libs/Config.php';
require_once 'libs/ConfigKeys.php';

$cfg = Config::getInstance();

//Database
$cfg->set(ConfigKeys::DB_SERVER, 'localhost');
$cfg->set(ConfigKeys::DB_DRIVER, 'mysql');
$cfg->set(ConfigKeys::DB_NAME, 'pro_cibi');
$cfg->set(ConfigKeys::DB_USER, 'root');
$cfg->set(ConfigKeys::DB_PASS, '');

// JSON token key
$cfg->set(ConfigKeys::JSON_TOKEN_KEY, 'clave_cifrado_token_servidor_super_secreta');
?>
