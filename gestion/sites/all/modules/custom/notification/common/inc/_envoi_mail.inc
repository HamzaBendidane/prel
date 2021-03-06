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
function notification_creation_compte_send_email() {
    
    db_set_active(@DB_EXTRANET);
    
    // recherche des notification mail
    $query = db_select('notification_mail', 'nm');
    $query->join('notification_event', 'ne', 'nm.notification_event_id = ne.id');
    $query->join('notification_config', 'nc', 'ne.notification_config_id = nc.id');
    $query->fields('nm');
    $query->fields('ne', array('data'));
    $query->fields('nc', array('code_action'));
    $query->condition('nm.envoi_mail' , 0, '=');
    /*
     * limiter l'envoi de mail pour la catégorie :
     * 
     * Envoie de mail de création d'un compte utilisateur
     * 
     * @todo à généraliser
     * 
     */
    $query->condition('nc.notification_categorie_id' , 11, '=');
    
    
    $mails = $query->execute()->fetchAll();
    
    db_set_active();
    
    foreach ($mails as $mail) {
        
        $paramEmail = array();
        
        $from = variable_get('site_mail', 'admin@opcaim.com');
        $to = trim($mail->destinataire_email);
        
        $data = json_decode($mail->data);
        
        /*
         * RME
         * switch selon l'email à envoyer 
         * @todo automatiser la sélection de l'émail à envoyer (template + configuration)
         */
        switch ($mail->code_action) {
            case 'MAIL_CRE_USR_USR' :
                // Mail 1 : mail au user
                $paramEmail = array(
                        'name' => $mail->destinataire,
                        'numero_demande' => $data->numero_demande,
                );
                // send mail
                $send_mail = drupal_mail('notification', 'creation_compte_entreprise_user', $to, language_default(),
                        $paramEmail, $from, TRUE);
                break;
                
            case 'MAIL_CRE_USR_RESP' :
                // Mail 2 : mail au responsable
                $paramEmail = array(
                        'name_responsable' => $mail->destinataire,
                        'name_collaborateur' => $data->name_utilisateur,
                        'fonctionnalites' => implode( "\r\n", $data->fonctionnalites),
                );
                // send mail
                $send_mail = drupal_mail('notification', 'creation_compte_entreprise_responsable', $to, language_default(),
                        $paramEmail, $from, TRUE);
                break;
            
            case 'MAIL_CRE_USR_VAL' :
                // Mail 3 : mail aux ADEFIM (attention, il peut y en avoir plusieurs et on regroupe les établissements par ADEFIM)
                $etablissements = array();
                $etablissementsId = $data->entreprises;
                foreach ($etablissementsId as $etablissementId) {
                    $etablissements[] = shared_get_raison_sociale_siret_entreprise($etablissementId);
                }
                
                
                $paramEmail = array(
                        'name' => $mail->destinataire,
                        'numero_demande' => $data->numero_demande,
                        'name_utilisateur' => $data->name_utilisateur,
                        'etablissements' => implode("\r\n", $etablissements),
                );
                // send mail
                $send_mail = drupal_mail('notification', 'creation_compte_entreprise_adefim', $to, language_default(),
                        $paramEmail, $from, TRUE);
                break;
                
            case 'MAIL_CRE_USR_SUP' :
                // Mail 4 : mail au user pour notifier la suppression du compte 
                $paramEmail = array(
                    'name' => $mail->destinataire,
                );
                
                // send mail
                $send_mail = drupal_mail('notification', 'refuse_account', $to, language_default(),
                        $paramEmail, $from, TRUE);
                break;
                
            default:
                return ;
        }

        if ($send_mail['result'] == true) {
            db_set_active(@DB_EXTRANET);
        
            $query = db_update('notification_mail')
            ->fields(array(
                    'date_envoi' => shared_send_to_mssql_date(null, 'datetime'),
                    'envoi_mail' => 1
            ))
            ->condition('id' , $mail->id, '=');
            $query->execute();
            db_set_active();
        }
        
    }
    
    db_set_active();

}

