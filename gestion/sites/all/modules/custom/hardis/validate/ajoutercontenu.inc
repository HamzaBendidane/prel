<?php
function creation_form_validate_contenu($form, &$form_state){
  $lieu = new db_contenu();

  $lieuData['type'] = $form_state['values']['type'];
  $lieuData['visible'] = $form_state['values']['visible'];
  $lieuData['titre'] = $form_state['values']['titre'];
  $lieuData['bloc_g'] = $form_state['values']['bloc_g'];
  $lieuData['bloc_c'] = $form_state['values']['bloc_c'];
  $lieuData['bloc_d'] = $form_state['values']['bloc_d'];
  $lieuData['bloc_m'] = $form_state['values']['bloc_m'];

  if($form_state['values']['id']){
    $lieu->update($form_state['values']['id'],$lieuData);
  }else {
      $lieu->insert($lieuData);
  }

  drupal_goto('/contenulist',array('query' => array('t' => $lieuData['type']) ));
}