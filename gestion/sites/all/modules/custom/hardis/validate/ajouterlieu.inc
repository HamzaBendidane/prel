<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function ajouterlieu_validate($form, &$form_state){
   // print("validate");
}

function creation_form_cancel_submit_lieux($form, &$form_state){
  drupal_goto('/gestion/lieux_list' );

}


function creation_form_validate_lieux($form, &$form_state){
  $lieu = new db_lieu();

  $lieuData['libelle'] = $form_state['values']['libelle'];
  $lieuData['nom'] = $form_state['values']['nom'];
  $lieuData['prenom'] = $form_state['values']['prenom'];
  $lieuData['telephone'] = $form_state['values']['telephone'];
  $lieuData['telephone2'] = $form_state['values']['telephone2'];
  $lieuData['email'] = $form_state['values']['email'];
  $lieuData['adresse'] = $form_state['values']['adresse'];
  $lieuData['code_postal'] = $form_state['values']['code_postal'];
  $lieuData['ville'] = $form_state['values']['ville'];
  $lieuData['complement'] = $form_state['values']['adress_complement'];
  $lieuData['informations_complement'] = $form_state['values']['moyen_transport'];
  $lieuData['numero_agrement'] = $form_state['values']['numero_agrement'];
  $lieuData['nom_agrement'] = $form_state['values']['nom_agrement'];

  if($form_state['values']['id']){
    $lieu->update($form_state['values']['id'],$lieuData);
  }else $lieu->insert($lieuData);


  drupal_goto('/lieux_list' );
}

/**
 * Element hardis validate
 * @param $element
 * @param $form_state
 */
function element_hardis_validate($element, &$form_state){
    $value = $element ['#value'];
    if (!$value) {
        form_error($element, t('@name est obligatoire', array('@name' => $element ['#title'])));
    }
}