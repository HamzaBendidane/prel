<?php

/**
 * Submit for the contract step
 *
 * @param type $form
 * @param type $form_state
 */
function dgf_formation_form_submit($form, &$form_state) {
  if ($form_state['values']['id_dgf_formation'] === '') {
    $id_form_formation = formation_db_insert_temp_dgf_form_formation($form_state);
    // save répartition
    formation_db_delete_insert_temp_dgf_form_formation_repartition($form_state, $id_form_formation, true);
  } else {
    formation_db_update_temp_dgf_form_formation($form_state);
    // save répartition
    $id_form_formation = $form_state['values']['id_dgf_formation'];

    formation_db_delete_insert_temp_dgf_form_formation_repartition($form_state, $id_form_formation, false);
  }
  // On redirige l'utilisateur vers le bon écran
  if ($form_state['triggering_element']['#id'] == 'edit-modal-save'){
    drupal_goto('/dashboard');
  } else if ($form_state['triggering_element']['#id'] == 'edit-next') {
    // si formation interne, on remplit les infos dans la table OF et on redirigé à l'étape tuteur
    if (isset($form_state['values']['internal_training']) && $form_state['values']['internal_training'] === 1) {
      drupal_goto('/dgf/demande/contrat-pro/tuteur/'.$form_state['values']['id_dgf']);
    } else {
      drupal_goto('/dgf/demande/organisme-formation/'.$form_state['values']['id_dgf']);
    }
  }
}