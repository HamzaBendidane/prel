<?php
function synthese_get_form_formation($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_formation', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

/**
 * synthese_get_form_contrat
 *
 * Permet de récupérer les infos de contrat
 *
 * @param int $id_dgf
 * @return array
 */
function synthese_get_form_contrat($id_dgf) {
  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_contrat', 'de')
    ->fields('de')
    ->condition('id_dgf', $id_dgf, '=')
    ->execute();

  $result = $query->fetchAll();

  db_set_active();

  return $result;

}

function synthese_get_dgf($idDgf) {

  db_set_active(@DB_EXTRANET);

  $query = db_select('dgf', 'de')
  ->fields('de')
  ->condition('id', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

function synthese_get_form_organisme_formation($idDgf) {

  db_set_active(@DB_EXTRANET);

  $query = db_select('dgf_form_organisme_formation', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

function synthese_get_form_salarie($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_salarie', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

function synthese_get_entreprise_demandeur($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('lien_dgf_ref_esclave_entreprise', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

function synthese_get_demande($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_demande', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}

function synthese_get_pieceJustificatice($idDgf) {

  db_set_active(@DB_EXTRANET);
  $query = db_select('dgf_form_justificatif', 'de')
  ->fields('de')
  ->condition('id_dgf', $idDgf, '=')
  ->condition('is_delete' , 0, '=')
  ->execute();

  $result = $query->fetchAll();

  db_set_active();
  return $result;

}