<?php
/**
 * hardis submit
 * @param $form
 * @param $form_state
 */
function creation_form_submit_stage_add($form, &$form_state){

  global $user;

  $dataStage['id_stage'] = $form_state['values']['id'];
  $dataStage['civilite'] = $form_state['values']['civilite'];
  $dataStage['nom_jeune_fille'] = $form_state['values']['nom_jeune_fille'];
  $dataStage['nom'] = $form_state['values']['nom'];
  $dataStage['prenom'] = $form_state['values']['prenom'];
  $dataStage['ne_le'] = covert_to_date($form_state['values']['ne_le']);
  $dataStage['ne_a'] = $form_state['values']['ne_a'];
  $dataStage['adresse'] = $form_state['values']['adresse'];
  $dataStage['cp'] = $form_state['values']['cp'];
  $dataStage['ville'] = $form_state['values']['ville'];
  $dataStage['telephone'] = $form_state['values']['telephone'];
  $dataStage['telephone2'] = $form_state['values']['telephone2'];
  $dataStage['email'] = $form_state['values']['email'];
  $dataStage['fax'] = $form_state['values']['fax'];
  $dataStage['numero_permis'] = $form_state['values']['numero_permis'];
  $dataStage['date_delivrance'] = covert_to_date($form_state['values']['date_delivrance']);
  $dataStage['lieu_delivrance'] = $form_state['values']['lieu_delivrance'];
  $dataStage['date_obtention'] = covert_to_date($form_state['values']['date_obtention']);
  $dataStage['points'] = $form_state['values']['points'];
  $dataStage['souce_points'] = $form_state['values']['souce_points'];
  $dataStage['statut'] = $form_state['values']['statut'];
  $dataStage['montant_paye'] = $form_state['values']['montant_paye'];
  $dataStage['moyen_paye'] = $form_state['values']['moyen_paye'];
  $dataStage['date_paiement'] = covert_to_date($form_state['values']['date_paiement']);
  $dataStage['date_inscription'] = covert_to_date(date('d/m/Y'));
  $dataStage['inscrit_par'] = $user->uid;

  $stagiaire = new db_stagiaires();

  $stagiaire->insert($dataStage);

  drupal_goto('/stage_list' );
}