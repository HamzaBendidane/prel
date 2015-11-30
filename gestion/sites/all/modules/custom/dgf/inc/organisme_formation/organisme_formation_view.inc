<?php
function dgf_organisme_formation_view() {

  require_once 'organisme_formation_form.inc';
  require_once 'organisme_formation_validate.inc';

  $variables =  array(
      'organisme_formation'=> drupal_get_form('dgf_organisme_formation_form')
  );
  $output = theme('dgf_organisme_formation_theme', $variables);

  return $output;
}