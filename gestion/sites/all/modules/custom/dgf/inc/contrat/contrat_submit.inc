<?php

// ----------------------------------------------------------------------------
// Fonctions de mise en mémoire (suivant) et de sauvegarde en BDD pour contrat
// ----------------------------------------------------------------------------

/**
 * Submit for the trainee step
 *
 * @param type $form
 * @param type $form_state
 */
function dgf_contrat_form_submit($form, &$form_state) {
  if ($form_state['values']['id_dgf_contrat'] === '') {
    contrat_db_insert_temp_dgf_form_contrat($form_state);
  } else {
    contrat_db_update_temp_dgf_form_contrat($form_state);
  }

  // On redirige l'utilisateur vers le bon écran
  if ($form_state['triggering_element']['#id'] == 'edit-modal-save'){
    drupal_goto('/dashboard');
  } else if ($form_state['triggering_element']['#value'] == 'Suivant') {
    drupal_goto('/dgf/demande/formation/'.$form_state['values']['id_dgf']);
  }
}
