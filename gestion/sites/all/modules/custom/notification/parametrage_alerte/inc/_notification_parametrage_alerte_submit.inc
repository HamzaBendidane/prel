<?php
/**
 * @author RME
 * 
 * traitement du submit du formulaire 
 * 
 * @param unknown $form
 * @param unknown $form_state
 */
function notification_parametrage_alerte_form_submit($form, &$form_state) {
    
    notification_parametrage_alerte_db_update_alerte_mail($form_state['values']);
    drupal_set_message(t('Les modifications ont bien été prises en compte'), 'status');
  
}