<?php

/**
 * administration_utilisateurs_suppression_db_bloquer
 * Fcontion qui
 *
 * @param unknown $id_drupal_user
 * @return multitype:string boolean |multitype:string multitype:NULL
 */
function administration_utilisateurs_suppression_db_bloquer($id_drupal_user) {
  global $user;
  db_set_active(@DB_EXTRANET);

  // On récupères les informations de l'utilisateur sélectionné
  $query_get_user = db_select('drupal_user', 'u');
  $query_get_user->fields('u');
  $query_get_user->condition('id', $id_drupal_user, '=');
  $result = $query_get_user->execute();
  $user_infos = $result->fetch();

  db_set_active();

  try {
    $account = user_load($user_infos->id_user_drupal);
    $new_account = user_save($account, array('status' => 0));

    db_set_active(@DB_EXTRANET);
    $query_delete_user = db_update('drupal_user');
    $query_delete_user->fields(array(
        'statut' => 0,
        'is_delete' => 1,
        'date_delete' => shared_send_to_mssql_date(null, 'datetime'),
        'id_user_delete' => $user->uid,
    ));
    $query_delete_user->condition('id', $id_drupal_user, '=');
    $query_delete_user->execute();

    db_set_active();

    $result = array(
        'statut' => 'ok',
        'nom' => $user_infos->first_name . ' ' . $user_infos->last_name,
        'error' => false
    );

    return $result;
  } catch (Exception $e) {
    $result = array(
        'statut' => 'ko',
        'nom' => $user_infos->first_name . ' ' . $user_infos->last_name,
        'erreur' => array(
            'code' => $e->getCode(),
            'message' => $e->getMessage(),
        ),
    );

    return $result;
  }
}

/**
 * administration_utilisateurs_suppression_db_supprimer
 *
 * @param unknown $id_drupal_user
 * @return multitype:string boolean |multitype:string multitype:NULL
 */
function administration_utilisateurs_suppression_db_supprimer($id_drupal_user) {

  global $user;
  db_set_active(@DB_EXTRANET);

  // On récupères les informations de l'utilisateur sélectionné
  $query_get_user = db_select('drupal_user', 'u');
  $query_get_user->fields('u');
  $query_get_user->condition('id', $id_drupal_user, '=');
  $result = $query_get_user->execute();
  $user_infos = $result->fetch();

  // On récupères les informations de l'utilisateur sélectionné
  $query_get_user = db_select('user_entreprise', 'u');
  $query_get_user->fields('u');
  $query_get_user->condition('id_drupal_user', $id_drupal_user, '=');
  $result = $query_get_user->execute();
  $user_entreprise_infos = $result->fetch();


  try {
    // Supprime toutes les liens entreprise
    $delete = db_delete('lien_user_entreprise_ref_esclave_entreprise')
      ->condition('id_user_entreprise' , $user_entreprise_infos->id, '=')
      ->execute();

    // Supprimer l'user entreprise
    $delete = db_delete('user_entreprise')
    ->condition('id' , $user_entreprise_infos->id, '=')
    ->execute();

    // Supprimer l'user responsable
    $delete = db_delete('user_responsable')
      ->condition('id' , $user_entreprise_infos->id_user_responsable, '=')
      ->execute();

    // Supprime toutes les habilitations de l'utilisateur associé à l'id
    $delete = db_delete('lien_drupal_user_habilitation')
      ->condition('id_drupal_user' , $id_drupal_user, '=')
      ->execute();

    $query_delete_user = db_delete('drupal_user')
      ->condition('id', $id_drupal_user, '=')
      ->execute();

    db_set_active();

    user_delete($user_infos->id_user_drupal);

    $result = array(
        'statut' => 'ok',
        'nom' => $user_infos->first_name . ' ' . $user_infos->last_name,
        'error' => false
    );

    return $result;
  } catch (Exception $e) {
    $result = array(
        'statut' => 'ko',
        'nom' => $user_infos->first_name . ' ' . $user_infos->last_name,
        'error' => array(
            'code' => $e->getCode(),
            'message' => $e->getMessage(),
        ),
    );

    return $result;
  }


}