<?php

/**
 * Validation for the trainee step
 *
 * @param type $form
 * @param type $form_state
 */
function dgf_contrat_pro_cerfa_form_validate($form, &$form_state) {
  $id_dgf = $form_state['values']['id_dgf'];
  if ($form_state['triggering_element']['#id'] == 'edit-back') {
      drupal_goto('/dgf/demande/contrat-pro/stagiaire/'. $id_dgf );
  } else if ($form_state['triggering_element']['#id'] == 'edit-next') {
      drupal_goto('/dgf/demande/justificatifs/' . $id_dgf  );
  }
}

