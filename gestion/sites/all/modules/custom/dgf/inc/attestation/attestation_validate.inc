<?php

function dgf_attestation_form_validate($form, &$form_state) {
  if (!$form_state['values']['certifie']) {
    form_set_error('certifie', t(@ATT_ERR_CERTIFIE));
  }
  if (!$form_state['values']['id_adefim']) {
    form_set_error('id_adefim', t(@ATT_ERR_ADEFIM));
  }
}