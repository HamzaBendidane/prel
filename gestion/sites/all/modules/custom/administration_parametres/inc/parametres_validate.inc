<?php

function parametres_form_validate($form, &$form_state) {
  if ($form_state['triggering_element']['#id'] == 'edit-save-add') {
    if ($form_state['values']['select_referentiel'] != 'ref_nature_demande'
        && $form_state['values']['select_referentiel'] != 'ref_nature_formation') {
      if (!$form_state['values']['code_add']) {
        form_set_error('code_add', 'Le champ code est obligatoire');
      }
      if (strlen($form_state['values']['code_add']) > 10) {
        form_set_error('code_add', 'Le champ code ne peut dépasser 10 caractères');
      }
    }
    if (!$form_state['values']['label_add']) {
      form_set_error('label_add', 'Le champ label est obligatoire');
    }
  } else if ($form_state['triggering_element']['#id'] == 'edit-save-edit') {
    if ($form_state['values']['select_referentiel'] != 'ref_nature_demande'
        && $form_state['values']['select_referentiel'] != 'ref_nature_formation') {
      if (!$form_state['values']['code_edit']) {
        form_set_error('code_edit', 'Le champ code est obligatoire');
      }
      if (strlen($form_state['values']['code_edit']) > 10) {
        form_set_error('code_edit', 'Le champ code ne peut dépasser 10 caractères');
      }
    }
    if (!$form_state['values']['label_edit']) {
      form_set_error('label_edit', 'Le champ label est obligatoire');
    }
  }
}