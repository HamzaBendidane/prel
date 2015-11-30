<?php

/**
 * dgf_justificatif_paiement_form_submit_file
 *
 * Fonction qui gère le submit
 *
 * @param array $form
 * @param array $form_state
 */
function dgf_justificatif_paiement_form_submit_file($form , &$form_state) {
  $file_name  =  $_FILES['files']['name']['file_to_upload'];
  $file_size  =  $_FILES['files']['size']['file_to_upload'];
  $file_tmp   =  $_FILES['files']['tmp_name']['file_to_upload'];
  $file_error =  $_FILES['files']['error']['file_to_upload'];

  // On enregistre le fichier sur le serveur
  _dgf_justificatifs_paiement_upload_file($form_state, $file_name, $file_size, $file_tmp, $file_error, $file_size);

  // on ajoute un paramètre dans l'url pour savoir quel onglet afficher
  drupal_goto('/dgf/visualisation/'.arg(2).'/justifs');
}


/**
 *  FONCTION D'UPLOAD D'UN FICHIER
 *
 *  @param : $file_name, $file_size, $file_tmp, $file_error
 *
 *  $file_name: Nom du fichier
 *
 *  $file_size: Taille du fichier
 *
 *  $file_tmp: Fichier Temporaire
 *
 *  $file_error: Fichier erreur
 *
 */
function _dgf_justificatifs_paiement_upload_file($form_state, $file_name, $file_size, $file_tmp, $file_error, $file_size) {
  // On nettoie le nom de fichier à upload

  $file_name_cleaned = shared_clean_file_name($file_name);
  $id_dgf = $form_state['values']['id_dgf'];

  // S'il n'y a pas d'erreur
  if ($file_error == UPLOAD_ERR_OK) {
    $directory_info = justificatif_paiement_db_get_directory_info($id_dgf);
    $siren = substr($directory_info['siret'], 0, 9);
    $siret = $directory_info['siret'];
    $num_demande = $directory_info['numero_demande'];

    // On récupère le chemin où copier ce fichier
    $directory_default_files = @DEFAULT_FILE_PATH;
    // demande/[siren]/[siret]/[num_demande]/justificatifs
    $repertoire_fichier = '/demande/'.$siren.'/'.$siret.'/'.$num_demande.'/justificatifs_paiements/';
    $destination = $directory_default_files.$repertoire_fichier;
    if (!is_dir($destination)) {
      mkdir($destination, 0775, true);
    }

    // UPLOAD DES INFOS FICHIER EN  BASE DE DONNEES
    justificatif_paiement_db_save_files($form_state, $destination, $repertoire_fichier, $file_name_cleaned, $file_tmp, $file_size);

    // Message de fin
    drupal_set_message(t("Le fichier ".$file_name." a bien été uploadé."));
  } else {
    drupal_set_message(t("Une erreur est intervenue lors de l'upload de votre fichier.") , 'error');
  }
}