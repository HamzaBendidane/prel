<?php
/**
 * @author RME
 * notification_parametrage_alerte
 * fonction qui renvoie la liste des notifications
 * 
 * @return unknown
 */ 
function notification_parametrage_alerte_db_get_notications() {
    
    db_set_active(@DB_EXTRANET);
    
    // Selection des notifications
    $query = db_select('notification_config', 'nc')
    ->fields('nc', array('id', 'action_declenchante', 'action_attendue'));
    
    $results = $query->execute()->fetchAll();
    
    db_set_active();
    
    return $results;
}


/**
 * @author RME
 * notification_parametrage_alerte
 * fonction pour sauvegarder le parametrage des alertes par mail
 * 
 * @param array tableau des données du formulaire
 * 
 */
function notification_parametrage_alerte_db_update_alerte_mail(array $data) {
    
    global $user;
    
    db_set_active(@DB_EXTRANET);
    
    foreach ($data as $key => $value) {

        if(preg_match('@^(notification-)?([0-9]+)@i', $key, $matches)) {

            $notification_config_id = intval($matches[2]); 

            // recherche de configuration de l'arete pail
            $query = db_select('notification_alerte_mail', 'nam')
            ->fields('nam', array('alerte_mail'))
            ->condition('nam.id_user' , $user->uid, '=')
            ->condition('nam.notification_config_id' , $notification_config_id, '=');
            
            $results = $query->execute()->fetchAssoc();
            
            if (!$results) {
                // S'il n'y a pas de parametrage on insere
                $query = db_insert('notification_alerte_mail')
                ->fields(array(
                        'id_user' => $user->uid,
                        'notification_config_id' => $notification_config_id,
                        'alerte_mail' => $value
                ));
                $query->execute();
            } else {
                // si le parmetrage existe on met à jour
                $query = db_update('notification_alerte_mail')
                ->fields(array(
                        'alerte_mail' => $value
                ))
                ->condition('id_user' , $user->uid, '=')
                ->condition('notification_config_id' , $notification_config_id, '=');
                $query->execute();
            }
        }
    }
    
    db_set_active();
    
}