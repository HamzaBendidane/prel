<?php
function dgf_contrat_view() {

  require_once 'contrat_form.inc';

  $variables =  array(
      'contrat'=> drupal_get_form('dgf_contrat_form')
  );

  $output = theme('dgf_contrat_theme', $variables);

  return $output;
}