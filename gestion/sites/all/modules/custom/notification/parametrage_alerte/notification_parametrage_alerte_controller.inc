<?php
function _notification_parametrage_alerte_require_once() {
  require_once 'inc/_notification_parametrage_alerte_db.inc';
  require_once 'inc/_notification_parametrage_alerte_form.inc';
  require_once 'inc/_notification_parametrage_alerte_submit.inc';
  require_once 'inc/_notification_parametrage_alerte_validate.inc';
  require_once drupal_get_path('module', 'notification' ) . 
    '/common/inc/_notification_common_db.inc';
}

function _notification_parametrage_alerte_require_js_css() {
  drupal_add_js(drupal_get_path('module', 'notification' ) . '/parametrage_alerte/js/notification_parametrage_alerte.js' );
  drupal_add_css(drupal_get_path('module', 'notification' ) . '/parametrage_alerte/css/notification_parametrage_alerte.css' );
}

function notification_parametrage_alerte_page() {
  
  _notification_parametrage_alerte_require_once();
  _notification_parametrage_alerte_require_js_css();
  
  $parametrage_form = drupal_get_form('notification_parametrage_alerte_form');

  $notifications = notification_parametrage_alerte_db_get_notications();
  
  $variables =  array(
      'parametrage_form' => $parametrage_form,
      'notifications' => $notifications
  );

  $output = theme('notification_parametrage_alerte_page_theme', $variables);

  return $output;
}