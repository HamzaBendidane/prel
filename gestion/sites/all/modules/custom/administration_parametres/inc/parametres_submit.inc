<?php

function parametres_form_submit($form, &$form_state) {
  $tables_name = array(
      '' => 'Veuillez sélectionner',
      'ref_beneficiaire_minimas_sociaux' => 'Bénéficiaires des minimas sociaux',
      'ref_derniere_situation' => 'Dernière situation avant signature du contrat',
      'ref_diplome' => 'Diplôme',
      'ref_finalite_formation' => 'Finalité de formation',
      'ref_groupe' => 'Groupe',
      'ref_justificatif' => 'Justificatifs',
      'ref_nature_demande' => 'Nature de demande',
      'ref_nature_formation' => 'Nature de formation',
//       'ref_nomenclature_fichier_reporting' => 'Nomenclature nom de fichier reporting',
  );

  // l'utilisateur ajout un élément au référentiel
  if ($form_state['triggering_element']['#id'] == 'edit-save-add') {
    $select_referentiel = $form_state['values']['select_referentiel'];
    $nature_demande_add = $form_state['values']['nature_demande_add'];
    $code_add = $form_state['values']['code_add'];
    $label_add = $form_state['values']['label_add'];
    $is_mandatory_add = $form_state['values']['is_mandatory_add'];

    // insert
    if ($select_referentiel == 'ref_justificatif') {
      parametres_db_insert_ref_justificatif($nature_demande_add, $code_add, $label_add, $is_mandatory_add);
    } else {
      parametres_db_insert_ref($select_referentiel, $code_add, $label_add);
    }

    $nom_referentiel = $tables_name[$select_referentiel];
    drupal_set_message('L\'élément "' . $label_add . '" du référentiel "' . $nom_referentiel . '" a bien été ajouté', 'status');
  } else if ($form_state['triggering_element']['#id'] == 'edit-save-edit') {
    // l'utilisateur modifie un élément au référentiel
    $select_referentiel = $form_state['values']['select_referentiel'];
    $nature_demande_edit = $form_state['values']['nature_demande_edit'];
    $id_rerentiel = $form_state['values']['id_rerentiel_edit'];
    $code_edit = $form_state['values']['code_edit'];
    $label_edit = $form_state['values']['label_edit'];
    $is_mandatory_edit = $form_state['values']['is_mandatory_edit'];

    // update
    if ($select_referentiel == 'ref_justificatif') {
      parametres_db_update_ref_justificatif($id_rerentiel, $nature_demande_edit, $code_edit, $label_edit,
        $is_mandatory_edit);
    } else {
      parametres_db_update_ref($id_rerentiel, $code_edit, $label_edit, $select_referentiel);
    }

    $nom_referentiel = $tables_name[$select_referentiel];
    drupal_set_message('L\'élément "' . $label_edit . '" du référentiel "' . $nom_referentiel . '" a bien été modifié', 'status');

  } else if ($form_state['triggering_element']['#id'] == 'edit-save-delete') {
    // l'utilisateur supprime un élément au référentiel
    $select_referentiel = $form_state['values']['select_referentiel'];
    $id_rerentiel = $form_state['values']['id_rerentiel'];

    // delete
    $nom_element = parametres_db_delete_ref($select_referentiel, $id_rerentiel);

    $nom_referentiel = $tables_name[$select_referentiel];
    drupal_set_message('L\'élément "' . $nom_element . '" du référentiel "' . $nom_referentiel . '" a bien été supprimé', 'status');
  }
  drupal_goto('/opcaim-admin/parametres', array('query' => array('select_referentiel' => $select_referentiel)));
}