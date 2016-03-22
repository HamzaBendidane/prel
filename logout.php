<?php

define('DRUPAL_ROOT', realpath(dirname(__FILE__).'/gestion/'));
    require_once DRUPAL_ROOT . '/includes/bootstrap.inc';

    drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

module_load_include('pages.inc', 'user');
unset($_SESSION);
user_logout();
