<?php
ini_set("display_errors", 1);
error_reporting(E_ALL);

$cmd = 'index.php';
$_SERVER['HTTP_HOST']       = 'default';
$_SERVER['PHP_SELF']        = '/index.php';
$_SERVER['REMOTE_ADDR']     = '127.0.0.1';
$_SERVER['SERVER_SOFTWARE'] = NULL;
$_SERVER['REQUEST_METHOD']  = 'GET';
$_SERVER['QUERY_STRING']    = '';
$_SERVER['PHP_SELF']        = $_SERVER['REQUEST_URI'] = '/';
$_SERVER['HTTP_USER_AGENT'] = 'console';

define('DRUPAL_ROOT', realpath(dirname(__FILE__).'/../'));
require_once DRUPAL_ROOT . '/includes/bootstrap.inc';

drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);


require_once DRUPAL_ROOT . '/' . drupal_get_path('module', 'notification')
. '/common/inc/_envoi_mail.inc';

require_once DRUPAL_ROOT . '/' . drupal_get_path('module', 'administration_utilisateurs')
. '/administration_utilisateurs_mail_langs.inc';

require_once DRUPAL_ROOT . '/' . drupal_get_path('module', 'creation_compte')
. '/creation_compte_mail_langs.inc';


notification_creation_compte_send_email();

print("FIN\n");

