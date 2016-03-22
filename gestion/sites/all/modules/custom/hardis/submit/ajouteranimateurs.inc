<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function creation_form_submit_animateur($form, &$form_state){

  $animateur = new db_animateur();

  $dataStage['nom'] = $form_state['values']['nom'];
  $dataStage['prenom'] = $form_state['values']['prenom'];
  $dataStage['qualite'] = $form_state['values']['qualite'];
  $dataStage['adresse'] = $form_state['values']['adresse'];
  $dataStage['code_postal'] = $form_state['values']['code_postal'];
  $dataStage['ville'] = $form_state['values']['ville'];
  $dataStage['telephone'] = $form_state['values']['telephone'];
  $dataStage['telephone2'] = $form_state['values']['telephone2'];
  $dataStage['fax'] = $form_state['values']['fax'];
  $dataStage['email'] = $form_state['values']['email'];
  $dataStage['commentaire'] = $form_state['values']['commentaire'];

  if ($form_state['values']['id']){
    $animateur->update($form_state['values']['id'],$dataStage);
  }else $animateur->insert($dataStage);

  drupal_goto('/animateurslist' );
}
