<?php

/**
 *  Permet la validation de la création d'une entreprise
 *  @param: $id_entreprise
 *  @param: $idAddress
 *  @param: $user_id / Utilisateur connecté
 *
 */
function valider_creation_entreprise($user_id, $id_entreprise, $id_adresse) {

    $update_entreprise = array('user' => $user_id,
        'id_entreprise' => $id_entreprise
    );
    $update_adresse_entreprise = array('user' => $user_id,
        'id_adresse_entreprise' => $id_adresse
    );
    shared_execute_procedure('sp_valider_modification_entreprise', $update_entreprise);
    shared_execute_procedure('sp_valider_modification_adresse_entreprise', $update_adresse_entreprise);
}


function annuler_modification_adresse_contact_entreprise($user_id,$id_contact){

    $data = array('user' => $user_id,
        'id_adresse_contact' => $id_contact
    );
    shared_execute_procedure('sp_annuler_modification_adresse_contact_entreprise', $data);
}

function annuler_modification_entreprise($user_id,$id_entreprise){

    $data = array('user' => $user_id,
        'id_entreprise' => $id_entreprise
    );
    shared_execute_procedure('sp_annuler_modification_entreprise', $data);
}

/**
 *  Validation de la création du contact entreprise
 *  @param: $id_contact_entreprise
 *  @param: $user_id / Utilisateur connecté
 *
 */
function valider_creation_contact_entreprise($user_id, $id_contact_entreprise) {

    $update_contact_entreprise = array('user' => $user_id,
        'id_contact' => $id_contact_entreprise,
    );
    shared_execute_procedure('sp_valider_modification_contact_entreprise', $update_contact_entreprise);
}

/**
 *  Permet le refus de la création d'une entreprise
 *  @param: $id_entreprise
 *  @param: $id_adresse
 */
function refuser_creation_etablissement($user_id, $id_entreprise, $id_adresse) {


    $sp_annuler_modification_entreprise = array('user'  => $user_id,
        'id_entreprise' => $id_entreprise
    );
    $sp_annuler_modification_adresse_entreprise = array('user' => $user_id,
        'id_adresse_entreprise' => $id_adresse
    );
    shared_execute_procedure('sp_annuler_modification_entreprise', $sp_annuler_modification_entreprise);
    shared_execute_procedure('sp_annuler_modification_adresse_entreprise', $sp_annuler_modification_adresse_entreprise);
}

/**
 * Vérifie l'existence d'un siret en base
 *
 */
function check_siret_already_exist($siret) {

    db_set_active(@DB_SLAVE);
    $query = db_select('v_entreprises', 'e');
    $query->fields('e', array('id', 'siret'));

    $query->condition('est_actif', 1, '=');
    $query->condition('est_valide', 1, '=');
    $query->condition('siret', $siret, '=');

    $result = $query->execute()->fetchCol('siret');
    db_set_active();
    if ($result) {
        return true;
    } else {
        return false;
    }
}

/**
 *   Renvoie l'Adefim lié à l'id Entreprise.
 *
 */
function get_entreprise_adefim($id) {

    db_set_active(@DB_SLAVE);
    $query = db_select('v_adefims', 'a');
    $query->fields('a', array('raison_sociale'));
    $query->condition('a.est_actif', 1, '=');
    $query->condition('a.est_valide', 1, '=');

    $results = $query->execute()->fetchCol();
    db_set_active();

    return $results;

}

/**
 *  Supprimer un établissement avec son contact entreprise
 *
 */
function supprimer_etablissement($user_entreprise, $id_entreprise, $id_contact,$id_adresse_entreprise)
{

    $drop_etablissement = array(
        'user' => $user_entreprise, // ou user drupal entreprise
        'id_entreprise' => $id_entreprise,
    );
    $drop_contact_etablissement = array(
        'user' => $user_entreprise, // ou user drupal entreprise
        'id_contact' => $id_contact,
    );
    if ($id_entreprise) {
        shared_execute_procedure('sp_supprimer_entreprise', $drop_etablissement);
    }
    if ($id_contact) {
        shared_execute_procedure('sp_supprimer_contact_entreprise', $drop_contact_etablissement);
    }
    if (has_role_adefim()) {
        if (!empty($id_adresse_entreprise)) {
            valider_creation_entreprise($user_entreprise, $id_entreprise, $id_adresse_entreprise);
        }
        if (!empty($id_contact_entreprise)) {
            ;
            valider_creation_contact_entreprise($user_entreprise, $id_contact);
        }
    }
}