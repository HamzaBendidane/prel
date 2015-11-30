<?php

/**
 *  Sauvegarde d'une entreprise avec la procédure stocké
 *  @author: Patrick M
 *  @param:
 *  @return: Id de l'entreprise
 *
 *
 */
 function shared_sauver_entreprise($drupal_cms_user, $raison_sociale, $siret, $id_naf,$id_secteur_activite,$tel = null,$param_id_company=null, $id_nace=null){

  $sp_sauver_entreprise_data = array(
    'user' => $drupal_cms_user,
    'id'  => $param_id_company,
    'raison_sociale' => $raison_sociale,
    'siret'   => $siret,
    'id_naf'  => NULL,
    'id_nace' => $id_nace,
    'est_en_cours_immatriculation' => '0',
    'telephone_principal' => $tel,
    'telephone_secondaire' => NULL,
    'fax' => NULL,
    'site_web' => NULL,
    'email' => NULL,
    'tva_intracommunautaire' => NULL,
    'id_categorie' => NULL,
    'id_departement' => NULL,
    'est_hors_branche' => '0',
    'id_taux_de_tva' => NULL,
    'id_secteur_activite' => $id_secteur_activite,
    'id_convention_collective' => NULL,
    'est_geiq' => '0'
   );

  return shared_execute_procedure('sp_sauver_entreprise', $sp_sauver_entreprise_data);
 }

 /**
 *  Sauver une adresse entreprise.
 *
 *  @param : Données du formulaire sauvegarde pour une adresse entreprise
 *  @author: Patrick M
 *  @return: Rien
 *
 */
function shared_sauver_adresse_entreprise($drupal_cms_user, $id_entreprise, $numero_rue, $rue, $complement_rue, $complement_rue_suite, $code_postal, $ville,$id_adress_entreprise=NULL) {

  $sp_sauver_adresse_entreprise = array(
    'user' => $drupal_cms_user
    ,'id'  => $id_adress_entreprise
    ,'id_type_adresse' => NULL
    ,'rue' => $rue
    ,'complement_de_rue' => $complement_rue
    ,'complement_de_rue_2' => $complement_rue_suite
    ,'code_postal' => $code_postal
    ,'ville' => $ville
    ,'id_region' => NULL
    ,'id_entreprise' => $id_entreprise
  );

  return shared_execute_procedure('sp_sauver_adresse_entreprise', $sp_sauver_adresse_entreprise);
}

/**
 *  Sauver un contact entreprise.
 *  @param $drupal_cms_user / L'utilisateur connecté
 *  @param $civilite / La civilité
 *  @param $prenom / Prénom contact
 *  @param $nom / Nom Contact
 *  @param $phone / Tél contact
 *  @param $email / Email
 *  @param $fonction / Fonction
 *  @param $id_entreprise / ID Entreprise
 *
 */
function shared_sauver_contact_entreprise($drupal_cms_user, $id_entreprise, $civilite, $prenom, $nom, $tel, $email, $fonction,$id_contact=NULL) {

  $sauver_contact_entreprise = array(
                                 'user' => $drupal_cms_user,
                                 'id' => $id_contact,
                                 'id_entreprise' => $id_entreprise,
                                 'id_civilite' =>  $civilite,
                                 'prenom' => $prenom,
                                 'nom' =>  $nom,
                                 'telephone' =>  $tel,
                                 'fax' => NULL,
                                 'email' => $email,
                                 'id_fonction' => $fonction,
                                 'est_contact_principal' => 1,
                                );
  return shared_execute_procedure('sp_sauver_contact_entreprise', $sauver_contact_entreprise);
}

/**
 *  Lier ADEFIM et Entreprise
 *  @param $drupal_cms_user / L'utilisateur connecté
 *  @param $id_adefim / L'id ADEFIM
 *  @param $id_entreprise / L'id Entreprise
 *
 */
function shared_lier_adefim_entreprise($drupal_cms_user, $id_adefim, $id_entreprise) {

  $sp_lier_adefim_entreprise = array(
                                 'user' => $drupal_cms_user,
                                 'id_adefim' => $id_adefim,
                                 'id_entreprise' => $id_entreprise
                                );
  shared_execute_procedure('sp_lier_adefim_entreprise', $sp_lier_adefim_entreprise);
}

/**
 *  EXECUTE  UNE PROCEDURE STOCKE
 *
 *  @param: La procédure stocké à executé.
 *
 */
function shared_exec_proc($db, $procedure){
  db_set_active($db);

  $exec = db_query($procedure);

  db_set_active();
}
