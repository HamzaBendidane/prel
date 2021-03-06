<?php
/**
 *  Sauvegarde des habilitations utilisateurs
 *  @param: les habilitations utilisateurs, l'id utilisateur drupal
 *
 */
function shared_save_user_habilitations($user_habilitations, $id_drupal_user) {
 db_set_active(@DB_EXTRANET);
 //Supprime toutes les habilitations de l'utilisateur associé à l'id
 $sql_delete = db_delete('lien_drupal_user_habilitation')
               ->condition('id_drupal_user' , $id_drupal_user, '=')
               ->execute();

  // Sauvegarde les habilitations  // Vaudrait mieux faire un db_update : lien_drupal_user_habilitation
  foreach ($user_habilitations as $value) {
     if($value != 0) {
       $hab_sql = db_insert('lien_drupal_user_habilitation')
                ->fields(array(
                'id_drupal_user'     => $id_drupal_user,
                'id_habilitation'    => $value,
                ))
                ->execute();
    }
  }
  db_set_active();
}

/**
 *  Ramène les habilitations utilisateurs
 *  @param: les habilitations utilisateurs, l'id utilisateur drupal
 *
 */
function shared_get_habilitation() {
  db_set_active(@DB_EXTRANET);

  $sql =  db_select('habilitation', 'hab')
  ->fields('hab')
  ->orderBy('libelle')
  ->execute();

  $data = $sql->fetchAll();

  db_set_active();

  $habilitations = array();
  foreach ($data as $hab) {
    $habilitations[trim($hab->cle)] = $hab->libelle;
  }

  return $habilitations;
}
/**
 *  Ramène l'id de la table drupal_user via l'id du cms Drupal
 */
function shared_get_drupal_user_id($id) {
    // Renvoie l'id de  l'utilisateur entreprise
    db_set_active(@DB_EXTRANET);

    $sql = db_select('drupal_user', 'u')
        ->fields('u', array('id'))
        ->condition('id_user_drupal', $id, '=')
        ->execute();

    $data = $sql->fetchAssoc();

    $id_drupal_user = trim($data['id']);

    db_set_active();

    return $id_drupal_user;
}

/**
 *  Get user drupal id
 *  Renvoie l'id  drupal de l'utilisateur de la table Drupal_user
 */
function shared_get_user_drupal_id($id_drupal_user) {
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_EXTRANET);

  $sql = db_select('drupal_user', 'u')
         ->fields('u', array('id_user_drupal'))
         ->condition('id', $id_drupal_user, '=')
         ->execute();

  $data = $sql->fetchAssoc();

  $id_user_drupal = trim($data['id_user_drupal']);

  db_set_active();

  return $id_user_drupal;
}

/**
 * Infos de l'utilisateur via le Drupal USER
 *
 */
function shared_users_verify_get_infos($id) {

  db_set_active(@DB_EXTRANET);

  $sql = db_select('drupal_user' , 'u')
        ->fields('u', array('civilite', 'last_name', 'first_name',  'mail', 'fonction', 'telephone'))
        ->condition('id_user_drupal', $id , '=')
        ->execute();

  $user_infos  = $sql->fetchAll();

  db_set_active();

  return $user_infos;
}

/**
 * Infos de l'utilisateur via le Drupal USER
 *
 */
function shared_users_verify_get_infos_from_id($id) {
  db_set_active(@DB_EXTRANET);

  $sql = db_select('drupal_user' , 'u')
  ->fields('u', array('id', 'id_user_drupal', 'civilite', 'last_name', 'first_name',  'mail', 'fonction', 'telephone'))
  ->condition('id', intval($id) , '=')
  ->execute();

  $user_infos  = $sql->fetchAll();

  db_set_active();

  return $user_infos;
}

function shared_db_get_title($list = false) {
  db_set_active(@DB_SLAVE);

  $results = db_select('v_civilites', 't')
    ->fields('t', array('id', 'libelle'))
    ->condition('est_actif', 1, '=')
    ->condition('est_valide', 1, '=')
    ->orderBy('libelle')
    ->execute()
    ->fetchAll();
  foreach ($results as $result) {
    $return[trim($result->id)] = trim($result->libelle);
  }
  if ($list) {
    array_unshift($return, 'Veuillez choisir dans la liste');
  }

  db_set_active();
  return $return;
}

function shared_db_get_fonction_from_id($id) {
  db_set_active(@DB_SLAVE);

  $results = db_select('v_fonctions', 't')
  ->fields('t', array('libelle'))
  ->condition('est_actif', 1, '=')
  ->condition('id', $id, '=')
  ->execute()
  ->fetchField();

  db_set_active();
  return $results;
}

function shared_db_get_civilite_from_id($id) {
  db_set_active(@DB_SLAVE);

  $results = db_select('v_civilites', 't')
  ->fields('t', array('libelle'))
  ->condition('est_actif', 1, '=')
  ->condition('id', $id, '=')
  ->execute()
  ->fetchField();

  db_set_active();
  return $results;
}

function shared_db_get_fonction($list = false) {
  db_set_active(@DB_SLAVE);

  $results = db_select('v_fonctions', 't')
  ->fields('t', array('id', 'libelle'))
  ->condition('est_actif', 1, '=')
  ->condition('est_valide', 1, '=')
  ->execute()
  ->fetchAll();
  foreach ($results as $result) {
    $return[trim($result->id)] = trim($result->libelle);
  }
  if ($list) {
    array_unshift($return, 'Veuillez choisir dans la liste');
  }

  db_set_active();
  return $return;
}

function shared_db_get_user_habilitations($id) {
  db_set_active(@DB_EXTRANET);

  $query = db_select('lien_drupal_user_habilitation' , 'duh');
  $query->leftJoin('habilitation', 'h', 'h.cle = duh.id_habilitation');
  $query->fields('duh')
  ->fields('h')
  ->condition('id_drupal_user', $id, '=');
  $result = $query->execute();
  $habilitations = $result->fetchAll();

  $habilitationArray = array();
  foreach ($habilitations as $hab) {
    $habilitationArray[trim($hab->cle)] = $hab;
  }

  db_set_active();

  return $habilitationArray;
}

function shared_db_get_user_entreprise($id_drupal_user) {
  db_set_active(@DB_EXTRANET);

  $sql = db_select('user_entreprise', 'u')
  ->fields('u', array('id'))
  ->condition('id_drupal_user', intval($id_drupal_user), '=')
  ->execute();

  $id_user_entreprise = $sql->fetchField();

  db_set_active();

  return $id_user_entreprise;
}

function shared_db_get_lien_user_entreprise_ref_esclave_entreprise($id_drupal_user) {
  $id_user_entreprise = shared_db_get_user_entreprise($id_drupal_user);

  db_set_active(@DB_EXTRANET);

  $sql = db_select('lien_user_entreprise_ref_esclave_entreprise', 'lue')
  ->fields('lue')
  ->condition('id_user_entreprise', $id_user_entreprise, '=')
  ->execute();

  $lien_user_entreprise_ref_esclave_entreprise = $sql->fetchAll();

  db_set_active();

  return $lien_user_entreprise_ref_esclave_entreprise;
}

/**
 * Infos de l'utilisateur via le Drupal USER
 *
 */
function shared_db_utilisateurs_get_users_infos($id_drupal_user) {

  db_set_active(@DB_EXTRANET);

  $sql = db_select('drupal_user' , 'u')
  ->fields('u', array('civilite', 'last_name', 'first_name',  'mail', 'fonction', 'telephone', 'id_user_creation'))
  ->condition('id', $id_drupal_user , '=')
  ->execute();

  $user_infos  = $sql->fetch();

  db_set_active();

  return $user_infos;
}

/**
 *
 * Renvoie les informations de l'utilisateur pour le header
 * à partir de l'objet global $user
 *
 * @todo à compléter si l'objet $user évolue
 *
 * @param stdClass $user
 * @return array
 */
function shared_users_get_infos_header($user) {
    $info_user = array();

    if (isset($user->data['extranet_user'])) {
        if (property_exists($user->data['extranet_user'], 'drupal_user')) {
            // Pour les utilisateurs Entreprises
            $drupal_user = $user->data['extranet_user']->drupal_user;
            $info_user['name'] = trim($drupal_user->first_name) . ' '
                . trim($drupal_user->last_name);
            if (property_exists($user->data['extranet_user'], 'entreprises')) {

                $entreprises = $user->data['extranet_user']->entreprises;

                if (count($entreprises) == 1) {
                    $entreprise = array_shift($entreprises);
                    $info_user['entreprise'] = trim($entreprise->raison_social);
                    $info_user['n_adherent'] = $entreprise->id_ref_esclave_entreprise;
                } else if (count($entreprises) > 1) {
                    $info_user['entreprise'] = 'Multi-Entreprise';
                } else {
                    $info_user['entreprise'] = '';
                }
            }

        } else if (property_exists($user->data['extranet_user'], 'user_adefim')) {
            // Pour les utilisateurs ADEFIM

            $user_adefim = $user->data['extranet_user']->user_adefim;
            $info_user['name'] = trim($user_adefim->prenom) . ' '
                . trim($user_adefim->nom);

            $info_user['adefim'] = is_null($user_adefim->raison_sociale_adefim)
                                   ? '' : trim($user_adefim->raison_sociale_adefim);
        } else {
            // Pour les aures utilisateurs (Que Drupal !)
            $info_user['name'] = $user->name;

        }
    } else {
        // Pour les autres utilisateurs
        $info_user['name'] = $user->name;
    }

    if (has_role_opcaim()) {
      $info_user['role'] = 'OPCAIM';
    } else if (has_role_adefim()) {
      $info_user['role'] = 'ADEFIM';
    } else if (has_role_entreprise()) {
      $info_user['role'] = 'ENTREPRISE';
    } else if (has_role_admin()) {
      $info_user['role'] = 'ADMIN';
    }

    return $info_user;

}