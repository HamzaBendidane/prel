<?php
/**
 * @author RME
 * 
 * notification_common
 * 
 * fonction appelée par la tâche cron 
 * Permet de créer les notifications à partir des notification_event
 * 
 */
function notification_common_db_creation_notification() {
    
    db_set_active(@DB_EXTRANET);
    
    // recherche des nouveaux notification_event (statut = 0)
    $query = db_select('notification_event', 'ne');
    $query->join('notification_config', 'nc', 'ne.notification_config_id = nc.id');
    $query->join('notification_config_has_destinaire', 'nhd', 'nhd.notification_config_id = nc.id');
    $query->join('notification_destinaire', 'nd', 'nd.id = nhd.notification_destinaire_id');
    $query->fields('ne', array('id', 'data'));
    $query->fields('nd', array('callback'));
    $query->addField('nc', 'id', 'notification_config_id');
    $query->condition('ne.statut' , 0, '=');
    
    $results = $query->execute()->fetchAll();
    
    foreach ($results as $notification_event) {
        
        $param = json_decode($notification_event->data);
        
        $param = $param->callback_param;
        
        $calbackClass = $notification_event->callback;
        
        if (class_exists($calbackClass)) {
            
            $destinataire = new $calbackClass($param);
            $users = $destinataire->getListeUser();
            
            /*
             * @todo généraliser avec les notifications
             */
            $destinataires = $destinataire->getListeDestinataireMail();
            
        } else {
            
            $message = 'Erreur d\'initialisation de la classe callback : '
                      . $calbackClass . 'pour notification_event : ' 
                      . $notification_event->id;
            watchdog('notification_creation_notification_error', $message);
            
            $users = array();
            
            /*
             * @todo généraliser avec les notifications
             */
            $destinataires = array();
            
        }
        
        foreach ($users as $user) {
            
            $avec_mail = notification_common_db_get_alerte_mail(
                    $notification_event->notification_config_id, $user);
            
            db_set_active(@DB_EXTRANET);
            
            $query = db_insert('notification')
            ->fields(array(
                    'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
                    'avec_mail' => $avec_mail,
                    'notification_event_id' => $notification_event->id,
                    'id_user' => $user
            ));
            
            try {
                $query->execute();
                
            } catch (Exception $e) {
                $message = 'Erreur de l\'insertion des notifactions pour notification_event : ' 
                          . $notification_event->id . '. ' . $e->getMessage();
                watchdog('notification_creation_notification_error', $message);
            }
                        
        }
        
        /*
         * @todo généraliser avec les notifications
         */
        foreach ($destinataires as $destinataire_mail) {
            db_set_active(@DB_EXTRANET);
            
            $query = db_insert('notification_mail')
            ->fields(array(
                    'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
                    'notification_event_id' => $notification_event->id,
                    'destinataire' => $destinataire_mail['name'],
                    'destinataire_email' => $destinataire_mail['email']
            ));
            
            try {
                $query->execute();
            
            } catch (Exception $e) {
                $message = 'Erreur de l\'insertion des notifactions pour notification_event : '
                        . $notification_event->id . '. ' . $e->getMessage();
                watchdog('notification_creation_notification_error', $message);
            }
        }
        
        /*
         * Modification du statut du notification_event (statut 1)
         * => notifications créées
         */ 
        db_set_active(@DB_EXTRANET);
        
        $query = db_update('notification_event')
                    ->fields(array(
                        'statut' => 1
                    ))
                    ->condition('id' , $notification_event->id, '=');
        $query->execute();
        
    }

    db_set_active();
}

/**
 * @author RME
 * notification_common
 * fonction qui renvoie le parametrage d'alerte pour un utilisateur
 *
 * @param int $notification_config_id
 * @return '0' or '1'
 */
function notification_common_db_get_alerte_mail($notification_config_id, $user_id = null) {

    if (is_null($user_id)) {
        global $user;
        $user_id = $user->uid;
    }


    db_set_active(@DB_EXTRANET);

    $alert_mail = '0';

    // recherche de configuration de l'arete pail
    $query = db_select('notification_alerte_mail', 'nam')
    ->fields('nam', array('alerte_mail'))
    ->condition('nam.id_user' , $user_id, '=')
    ->condition('nam.notification_config_id' , $notification_config_id, '=');

    $results = $query->execute()->fetchAssoc();

    if ($results !== false) {
        $alert_mail = $results["alerte_mail"];
    }

    db_set_active();

    return $alert_mail;
}