<?php
/**
 * @author RME
 *
 * Fonction qui permet de créer les notifications events
 * Prend en parametre l'id de la notification
 * et les ids des éléments de la notification
 *
 * @param string $notif_config_code
 * @param array $id_composants
 * @return boolean
 */
function create_notification_event($notif_config_code, array $data) {

    /*
     * @todo vérifier si le module notification est activé : fct drupal
     */

    db_set_active(@DB_EXTRANET);

    // Selection des notifications
    $query = db_select('notification_config', 'nc')
    ->fields('nc')
    ->condition('nc.code_action', $notif_config_code, '=');

    $results = $query->execute()->fetchAssoc();


    if ($results == false) {
        db_set_active();
        // pour dev
        // drupal_set_message('Erreur lors de la création de la notification', 'warning');
        return false;
    }


    $fields = array (
            'data' => json_encode($data),
            'statut' => 0,
            'date_creation' => shared_send_to_mssql_date(null, 'datetime'),
            'notification_config_id' => $results['id']
    );

    $query = db_insert('notification_event')->fields($fields)->execute();

    db_set_active();

    return true;
}

/**
 * Retourne le nombre de notifications pour les catégories
 * @author Gael GALBAS-FRONTINOIS
 * @param categories : liste des entreprises
 * @return count : nombre de notifiactions (si catégories non vide => count sur les catégories recues en paramètres sinon toutes les notifiactions
 */
function shared_db_get_count_notifications_categories($categories = array(), $user_extranet) {
  db_set_active(@DB_EXTRANET);
  $query = db_select('notification', 'nof');
  $query->join('notification_event', 'eve', 'eve.id = nof.notification_event_id');
  $query->join('notification_config', 'conf', 'conf.id = eve.notification_config_id');
  $query->join('notification_categorie', 'cat', 'cat.id = conf.notification_categorie_id');

  // condition sur les catégories
  $db_or = db_or();
  foreach ($categories as $categorie) {
    $db_or ->condition('cat.id', $categorie, '=');
  }
  if(isset($db_or->conditions()['0'])) {
    $query->condition($db_or);
  }



  $query ->condition('nof.lu_notif', '0', '=');
  $query ->condition('nof.id_user', $user_extranet, '=');
  $query->addExpression('count(*)');
  $result  = $query->execute()->fetchField();
  db_set_active();

  return $result;
}


/**
 * Retourne le nombre de notifications pour une notifications configurations
 * @author Gael GALBAS-FRONTINOIS
 * @param categories : liste des entreprises
 * @return count : nombre de notifiactions
 */
function shared_db_get_count_notifications_config($notif_config = null, $user_extranet) {
  db_set_active(@DB_EXTRANET);
  $query = db_select('notification', 'nof');
  $query->join('notification_event', 'eve', 'eve.id = nof.notification_event_id');
  $query->join('notification_config', 'conf', 'conf.id = eve.notification_config_id');

  if(isset($notif_config)) {
    $query ->condition('conf.id', $notif_config, '=');
  }
  $query ->condition('nof.lu_notif', '0', '=');
  $query ->condition('nof.id_user', $user_extranet, '=');
  $query->addExpression('count(*)');
  $result  = $query->execute()->fetchField();
  db_set_active();

  return $result;
}

/**
 * Retourne la liste des configurations de notifications pour une catégorie
 * @author Gael GALBAS-FRONTINOIS
 * @param categorie : la catégorie
 * @return $result : liste des configurations de notifications
 */
function shared_db_get_notifications_config_categories($categorie = null) {
  db_set_active(@DB_EXTRANET);
  $query = db_select('notification_categorie', 'cat');
  $query->join('notification_config', 'conf', 'cat.id = conf.notification_categorie_id');
  if($categorie) {
    $query ->condition('cat.id', $categorie, '=');
  }
  $query->fields('conf');
  $result  = $query->execute()->fetchAll();
  db_set_active();

  return $result;
}

/**
 * Retourne le message à afficher pour une catégorie.
 * @author Gael GALBAS-FRONTINOIS
 * @param catégorie : id de la catégorie
 * @param nb : nombre à afficher
 * @return infos : La liste des informations du bloc
 */
function shared_get_messages_notifaction_configuration ($notif, $nb) {
// TODO : EN ATTENTE DE CATEGORIE DEFINIE ET MESSAGES À AFFICHER
  switch ($notif) {
    case 10:
      $msg = 'Vous avez ' . $nb . ' dossier(s) à traiter (contrat pro).';
      break;
    case 12:
      $msg = 'Vous avez ' . $nb . ' dossier(s) à traiter (action de formation).';
      break;
    case 14:
      $msg = 'Vous avez ' . $nb . ' dossier(s) à compléter (toutes actions).';
      break;
    case 20:
      $msg = 'Vous avez ' . $nb . ' dossier(s) à compléter(contrat pro).';
      break;
    case 21:
      $msg = 'Vous avez ' . $nb . ' dossier(s) accordés, refusé ou annulé';
      break;
    case 23:
      $msg = 'Vous avez ' . $nb . ' dossier(s) à compléter avec subrogation.';
      break;
    case 25 || 32:
      $msg = 'Vous avez ' . $nb . ' pièce(s) déposée(s) pour une demande (action de formation).';
      break;
    case 28 || 33:
      $msg = 'Vous avez ' . $nb . ' pièce(s) déposée(s) pour une demande (contrat pro).';
      break;
    case 30:
      $msg = 'Vous avez ' . $nb . ' pièce(s) déposée(s) sur l\'espace dédié.';
      break;
    case 34:
      $msg = 'Vous avez ' . $nb . ' paiements reçu(s) (toutes demandes confondues).';
      break;
    case 35:
      $msg = 'Vous avez ' . $nb . ' paiements reçu(s) sur demande subrogée.';
      break;
    case 36:
      $msg = 'Vous avez ' . $nb . ' demandes en cours de saisie qui approcheent la date limite de finalisation';
      break;
  }
  return $msg;
}

/**
 * Retourne la liste des messages de notifications pour une catégorie
 * @author Gael GALBAS-FRONTINOIS
 * @param categorie : la catégorie
 * @return $result : liste des messages de notifications
 */
function shared_get_message_categorie($categories = array(), $user_extranet) {
  $msg_notifications = array();
  $notif_configs = array();

  if(count($categories) == 0) {
      // extraction de toutes les catégories
      $notif_configs = shared_db_get_notifications_config_categories();
  }
  else {
    foreach ($categories as $categorie) {
      // extraction des configurations pour la catégorie traitée
      $notif_configs = array_merge($notif_configs, shared_db_get_notifications_config_categories($categorie));
    }
  }
    // extraction des messages à afficher
  foreach ($notif_configs as $notif_config) {
    $nb = shared_db_get_count_notifications_config($notif_config->id, $user_extranet);
    if($nb > 0) {
      $msg_notifications[] = shared_get_messages_notifaction_configuration($notif_config->id, $nb);
    }
  }

  return $msg_notifications;
}



/**
 * Toper comme lu les notifications pour une liste de notifications configurations pour un utilisateur
 * @author Gael GALBAS-FRONTINOIS
 * @param $notif_configs : liste des notifications configurations
 */
function shared_db_set_lu_notif_notifications_config($notif_config = null, $user_extranet) {
  db_set_active(@DB_EXTRANET);
  $query = db_select('notification_config', 'conf');
  $query->join('notification_event', 'eve', 'conf.id = eve.notification_config_id');
  $query->join('notification', 'nof', 'eve.id = nof.notification_event_id');
  $query ->condition('conf.id', $notif_config, '=');

  $query->fields('nof', array('id'));
  $query->condition('nof.lu_notif', '0', '=');
  $query ->condition('nof.id_user', $user_extranet, '=');
  $result  = $query->execute()->fetchAll();

  foreach ($result as $row) {
    if(isset($row->id)) {
      // Toppé les notifiaction comme lu
      $query = db_update('notification')
      ->fields(array(
          'lu_notif' => '1',
      ));
      $query->condition('id', $row->id, '=');
      $query->execute();
    }
  }
  db_set_active();

}



/**
 * Toper comme lu les notifications pour une liste de catégorie pour un utilisateur
 * @author Gael GALBAS-FRONTINOIS
 * @param $notif_configs : liste des notifications configurations
 * @param $user_extranet : utilisateur ayant les notifications
 */
function shared_db_set_lu_notif_categories_config($categories = array(), $user_extranet) {
  $msg_notifications = array();
  $notif_configs = array();

  if(count($categories) == 0) {
      // extraction de toutes les catégories
      $notif_configs = shared_db_get_notifications_config_categories();
  }
  else {
    foreach ($categories as $categorie) {
      // extraction des configurations pour la catégorie traitée
      $notif_configs = array_merge($notif_configs, shared_db_get_notifications_config_categories($categorie));
    }
  }
  
  // Tope les notiifcations
  foreach ($notif_configs as $notif_config) {
    shared_db_set_lu_notif_notifications_config($notif_config->id, $user_extranet);
  }

}

/**
 * Ajax : Toper comme lu les notifications pour une liste de catégorie pour l'utilisateur en cours
 * @author Gael GALBAS-FRONTINOIS
 * @param $notif_configs : liste des notifications configurations
 */
function shared_db_set_lu_notif_categories_ajax() {
  global $user;
  shared_db_set_lu_notif_categories_config(array(), shared_get_drupal_user_id($user->uid));
  return true;
}

