<?php

function login_db_get_extranet_user($uid) {
  global $user;
  $extranet_user = array();

  db_set_active(@DB_EXTRANET);

  $query = db_select('drupal_user' , 'du');
  $query->fields('du')
    ->condition('id_user_drupal', $uid, '=');

  $result = $query->execute();

  $drupal_user = $result->fetch();

  // si on a pas de drupal user, alors c'est juste un user drupal
  if (!$drupal_user) {
    db_set_active();
    return;
  }

  // on regarde si c'est un utilisateur entreprise et récupère ses données
  $query = db_select('user_entreprise' , 'ue');
  $query->leftJoin('user_responsable', 'ur', 'ur.id = ue.id_user_responsable');
  $query->fields('ue')
    ->fields('ur', array('civilite', 'nom', 'prenom', 'email', 'fonction'))
    ->condition('id_drupal_user', $drupal_user->id, '=');
  $result = $query->execute();
  $user_entreprise = $result->fetch();

  if ($user_entreprise) {
    $habilitations = shared_db_get_user_habilitations($drupal_user->id);
    $entreprises = login_db_get_entreprise('user_entreprise', $user_entreprise->id);

    $extranet_user['drupal_user'] = $drupal_user;
    $extranet_user['user_entreprise'] = $user_entreprise;
    $extranet_user['habilitations'] = $habilitations;
    $extranet_user['entreprises'] = $entreprises;

    // On sauvegarde les données utilisateur pour les récupérer ensuite
    db_set_active();

    return $extranet_user;
  }

  // on regarde si c'est un utilisateur OF
  $query = db_select('user_organisme_formation' , 'org');
  $query->leftJoin('user_responsable', 'ur', 'ur.id = org.id_user_responsable');
  $query->fields('org')
    ->fields('ur', array('civilite', 'nom', 'prenom', 'email', 'fonction'))
    ->condition('id_drupal_user', $drupal_user->id, '=');
  $result = $query->execute();
  $user_organisme_formation = $result->fetch();

  if ($user_organisme_formation) {
    $extranet_user['drupal_user'] = $drupal_user;
    $extranet_user['user_organisme_formation'] = $user_organisme_formation;

    // On sauvegarde les données utilisateur pour les récupérer ensuite
    db_set_active();

    return $extranet_user;
  }

  // on regarde si c'est un utilisateur autre
  $query = db_select('user_autre' , 'ua');
  $query->fields('ua')
    ->condition('id_drupal_user', $drupal_user->id, '=');
  $result = $query->execute();
  $user_autre = $result->fetch();

  if ($user_autre) {
    $entreprises = login_db_get_entreprise('user_autre', $user_autre->id);
    $extranet_user['drupal_user'] = $drupal_user;
    $extranet_user['user_autre'] = $user_autre;
    $extranet_user['entreprises'] = $entreprises;

    // On sauvegarde les données utilisateur pour les récupérer ensuite
    db_set_active();

    return $extranet_user;
  }

  db_set_active();

  // On sauvegarde les données utilisateur pour les récupérer ensuite
  $extranet_user['drupal_user'] = $drupal_user;

  return $extranet_user;
}

function login_db_get_habilitation($id) {
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

function login_db_get_drupal_user_authmap($username, $password) {
  // On vérifie que l'user existe dans la table authmap de Drupal
  $query = db_select('authmap' , 'a');
  $query->fields('a')
    ->condition('authname', $username, '=');

  $result = $query->execute();
  $nb_result = count($result->fetchAll());

  if ($nb_result == 0) {
    return false;
  }

  $user_adefims = login_db_get_referentiel_comptes_adefims($username, $password);

  return $user_adefims;
}

function login_db_get_referentiel_comptes_adefims($username, $password) {
  db_set_active(@DB_SLAVE);

  // On regarde si l'utilisateur existe dans la table comptes_adefims
  $query = db_select('v_comptes_adefims' , 'vce');
  $query->fields('vce')
    ->condition('nom_utilisateur', $username, '=')
    ->condition('mot_de_passe', $password, '=');

  $result = $query->execute();
  $user_adefims = $result->fetch();

  db_set_active();

  return $user_adefims;
}

function login_db_get_entreprise($type, $id_user) {
  global $user;
  db_set_active(@DB_EXTRANET);

  if ($type === 'user_autre') {
    $query = db_select('lien_user_autre_entreprise' , 'ure');
    $query->fields('ure')
      ->condition('id_user_autre', $id_user, '=')
      ->condition('est_valide', 1, '=')
      ->condition('est_actif', 1, '=');
  } else if ($type === 'user_entreprise') {
    $query = db_select('lien_user_entreprise_ref_esclave_entreprise' , 'ure');
    $query->fields('ure')
      ->condition('id_user_entreprise', $id_user, '=')
      ->condition('est_valide', 1, '=')
      ->condition('est_actif', 1, '=');
  }

  $results = $query->execute()->fetchAll();

  $entreprises = array();
  foreach ($results as $result) {
    $raison_social = shared_get_raison_sociale_entreprise($result->id_ref_esclave_entreprise);
    $result->raison_social = $raison_social;
    $entreprises[trim($result->id_ref_esclave_entreprise)] = $result;
  }

  db_set_active();

  return $entreprises;
}

function login_db_get_adefims_entreprise($id_adefim) {

  global $user;
  db_set_active(@DB_SLAVE);

  $query = db_select('v_adefims_entreprise_ext' , 'vae');
  $query->fields('vae')
    ->condition('id_adefim', $id_adefim, '=');

  $results = $query->execute()->fetchAll();

  $entreprises = array();

  foreach ($results as $result) {
    $entreprises[trim($result->id_entreprise)] = $result;
  }

  db_set_active();

  return $entreprises;
}
