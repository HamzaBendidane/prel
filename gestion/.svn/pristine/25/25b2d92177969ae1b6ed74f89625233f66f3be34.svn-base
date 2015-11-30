<?php

/**
 * _administration_utilisateurs_ajax_db_valider
 *
 * fcontion qui permet de valider le rattachement d'un établissement à un utilisateur
 *
 * @param int $id_user_entreprise
 * @param string $id_ref_entreprise
 */
function _administration_utilisateurs_ajax_db_valider($id_drupal_user, $id_ref_entreprise) {
  try {
    $id_user_entreprise = shared_db_get_user_entreprise($id_drupal_user);
    db_set_active(@DB_EXTRANET);

    $sql =  db_update('lien_user_entreprise_ref_esclave_entreprise')
      ->fields(
          array(
              'est_valide' => 1
      ))
      ->condition('id_user_entreprise', $id_user_entreprise, '=')
      ->condition('id_ref_esclave_entreprise', $id_ref_entreprise, '=')
      ->execute();

    db_set_active();
    return array(
        'status' => 1
    );
  } catch (Exception $e) {
    $message = $e->getMessage();
    return array(
        'status' => 0,
        'error' => $message
    );
  }
}

/**
 * _administration_utilisateurs_ajax_db_refuser
 *
 * fcontion qui permet de refuser le rattachement d'un établissement à un utilisateur
 *
 * @param int $id_user_entreprise
 * @param string $id_ref_entreprise
 */
function _administration_utilisateurs_ajax_db_refuser($id_drupal_user, $id_ref_entreprise) {
  try {
    $id_user_entreprise = shared_db_get_user_entreprise($id_drupal_user);
    db_set_active(@DB_EXTRANET);

    $sql =  db_update('lien_user_entreprise_ref_esclave_entreprise')
    ->fields(
        array(
            'est_actif' => 0
        ))
        ->condition('id_user_entreprise', $id_user_entreprise, '=')
        ->condition('id_ref_esclave_entreprise', $id_ref_entreprise, '=')
        ->execute();

    db_set_active();
    return array(
        'status' => 1
    );
  } catch (Exception $e) {
    $message = $e->getMessage();
    return array(
        'status' => 0,
        'error' => $message
    );
  }
}

/**
 * _administration_utilisateurs_ajax_db_retirer
 *
 * fcontion qui permet de retirer le rattachement d'un établissement à un utilisateur
 *
 * @param int $id_user_entreprise
 * @param string $id_ref_entreprise
 */
function _administration_utilisateurs_ajax_db_retirer($id_drupal_user, $id_ref_entreprise) {
  try {
    $raisons = array(
        'Je ne gère plus cet établissement',
        'Je change de fonction',
        'L\'établissement n\'existe plus',
        'Autre : précisez',
    );

    $id_user_entreprise = shared_db_get_user_entreprise($id_drupal_user);
    db_set_active(@DB_EXTRANET);

    $data_raison = arg(7);
    $data_raison_autre = arg(8);

    $sql =  db_update('lien_user_entreprise_ref_esclave_entreprise')
    ->fields(
        array(
            'est_valide' => 0,
            'est_actif' => 0,
            'raison_retrait_id' => $data_raison,
            'raison_retrait_label' => $data_raison ? $raisons[$data_raison] : null,
            'raison_retrait_autre' => $data_raison_autre,
        ))
        ->condition('id_user_entreprise', $id_user_entreprise, '=')
        ->condition('id_ref_esclave_entreprise', $id_ref_entreprise, '=')
        ->execute();

    db_set_active();
    return array(
        'status' => 1
    );
  } catch (Exception $e) {
    $message = $e->getMessage();
    return array(
        'status' => 0,
        'error' => $message
    );
  }
}

/**
 * _administration_utilisateurs_ajax_db_attacher
 *
 * fcontion qui permet de retirer le rattachement d'un établissement à un utilisateur
 *
 * @param int $id_user_entreprise
 * @param string $id_ref_entreprise
 */
function _administration_utilisateurs_ajax_db_attacher($id_drupal_user, $id_ref_entreprise, $mon_compte = false) {
  try {
    $id_user_entreprise = shared_db_get_user_entreprise($id_drupal_user);
    db_set_active(@DB_EXTRANET);

    $est_valide = $mon_compte ? 0 : 1;

    $sql =  db_insert('lien_user_entreprise_ref_esclave_entreprise')
    ->fields(
        array(
            'id_user_entreprise'=> $id_user_entreprise,
            'id_ref_esclave_entreprise' => $id_ref_entreprise,
            'est_valide' => $est_valide,
            'est_actif' => 1
        ))
        ->execute();

    db_set_active();
    return array(
        'status' => 1
    );
  } catch (Exception $e) {
    $message = $e->getMessage();
    return array(
        'status' => 0,
        'error' => $message
    );
  }
}