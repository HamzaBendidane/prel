<?php
function dgf_attestation_view() {

  require_once 'attestation_form.inc';
  require_once 'attestation_validate.inc';

  $variables =  array(
      'attestation'=> drupal_get_form('dgf_attestation_form')
  );

  $output = theme('dgf_attestation_theme', $variables);

  return $output;
}