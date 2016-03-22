<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function creation_form_submit_stage($form, &$form_state){


  var_dump($form_state['values']);


  $stage = new db_stage();

  $date = DateTime::createFromFormat('d/m/Y', $form_state['values']['premier_jour']);

  $dataStage['premier_jour_stage'] = $date->format('Y-m-d');
  $dataStage['tarif_reference'] = $form_state['values']['tarif_reference'];
  $dataStage['capacite_salle'] = $form_state['values']['capacite'];
  $dataStage['heure_debut_matin'] = $form_state['values']['heure_debut_matin'];
  $dataStage['heure_fin_matin'] = $form_state['values']['heure_fin_matin'];
  $dataStage['heure_debut_aprem'] = $form_state['values']['heure_debut_aprem'];
  $dataStage['heure_fin_aprem'] = $form_state['values']['heure_fin_aprem'];
  $dataStage['min_inscrit'] = $form_state['values']['min_stagiaires'];
  $dataStage['id_lieu'] = $form_state['values']['lieu'];
    $dataStage['id_contenu'] = $form_state['values']['contenu'];
  $dataStage['id_psy'] = $form_state['values']['psy'];
  $dataStage['id_bafm'] = $form_state['values']['bafm'];

  if ($form_state['values']['id']){
    $stage->update($form_state['values']['id'],$dataStage);
  }else $stage->insert($dataStage);
  drupal_goto('/stage_list' );
}
