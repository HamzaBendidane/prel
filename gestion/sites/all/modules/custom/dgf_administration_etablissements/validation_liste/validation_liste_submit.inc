<?php
/**
 *  Suppréssion d' un établissement
 * 
 */
function validation_liste_delete_submit($form, &$form_state){
  //supprimer_etablissement($id_user_entreprise, $id_entreprise, $id_contact);
}

function dgf_administration_etablissements_listes_form_submit($form, &$form_state){
    $_SESSION['dgf_administration_etablissements'] = $form_state['values'];
}

function dgf_administration_etablissements_listes_reinit_form_submit($form, &$form_state){
    $_SESSION['dgf_administration_etablissements'] = array();
}