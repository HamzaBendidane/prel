<?php
function notification_parametrage_alerte_form($form, &$form_state) {

    $form['reception_rapports_alertes'] = array(
        '#type' => 'select',
        '#title' => t('Recevoir des rapports sur les alertes'),
        '#options' => array('0' => 'Non','1' => 'Oui'),
        '#default_value' => '0'
    );
    
    
    $notifications = notification_parametrage_alerte_db_get_notications();
    
    $options = array('0' => 'Non','1' => 'Oui');
    
    foreach ($notifications as $notification) {
        
        $key = 'notification-' . $notification->id; 
        $form['parametrage_alerte'][$key] = array(
            '#type' => 'select',
            '#title' => t(''),
            '#options' => $options,
            '#default_value' => notification_common_db_get_alerte_mail($notification->id)
        );
    }
    
    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Enregistrer'),
        '#attributes' => array(
          'class' => array('btn btn-success'),
        ),
    );

  return $form;
}