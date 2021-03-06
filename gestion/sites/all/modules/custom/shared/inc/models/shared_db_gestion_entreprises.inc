<?php

/**
 *  Renvoie les données d'une entreprise via l'id entreprise
 *  @param: $id_entreprise
 *  @return: Les infos de l'entreprise
 *
 */
function shared_get_infos_entreprise($id_entreprise, $is_valid = '') {
  db_set_active(@DB_SLAVE);

  $query = db_select('entreprises', 'e');
  $query->leftJoin('adresses_entreprises', 'a', 'a.id_entreprise = e.id');
    $query->leftJoin('v_adefims_entreprise', 'l' , 'e.id = l.id_entreprise');
 //   $query->leftJoin('v_nafs', 'vna' , 'vna.id = e.id_naf');
  //  $query->leftJoin('v_naces', 'vnc' , 'vnc.id = e.id_nace');
//     $query->leftJoin('v_secteurs_activite', 'vsa' , 'vsa.id = e.id_secteur_activite');
//     $query->fields('vna', array('code', 'libelle'));
//     $query->fields('vsa', array('code', 'libelle'));
//     $query->addExpression('vnc.code', 'code_nace');
//     $query->addExpression('vnc.libelle', 'libelle_nace');
//     $query->addExpression('vsa.code', 'code_secteurs_activite');
//     $query->addExpression('vsa.libelle', 'libelle_secteurs_activite');
    $query->fields('l', array('id_adefim'));
  $query->fields('e', array('id', 'siret', 'raison_sociale', 'telephone_principal', 'id_naf', 'id_nace', 'id_secteur_activite'));
  $query->fields('a', array('id', 'rue', 'complement_de_rue','complement_de_rue_2', 'code_postal', 'ville', 'id'));

  if (!empty($is_valid)){
    $query->condition('e.est_valide',  0 , '=');
  }

  $query->condition('e.id', $id_entreprise, '=');
  $infos_entreprises = $query->execute()->fetchAssoc();

  db_set_active();

  if($infos_entreprises) {
    $infos_entreprises['naces'] = share_get_code_label('referentiel','v_naces', $infos_entreprises['id_nace']);

    $infos_entreprises['secteurs_activite'] = share_get_code_label('referentiel','v_secteurs_activite', $infos_entreprises['id_secteur_activite']);
  }
  return $infos_entreprises;
}

/**
 *  Prendre l'id du contact entreprise
 *
 *  et le les infos du contact entreprises
 *
 */

 function shared_get_infos_contact($id_entreprise,$principal = false) {
   db_set_active(@DB_SLAVE);

   $query = db_select('v_contacts_entreprises', 'l');
   $query->fields('l', array('id', 'id_civilite', 'prenom', 'nom', 'telephone', 'email', 'id_fonction'));
   $query->condition('id_entreprise', $id_entreprise, '=' );
   $query->condition('est_actif', 1, '=' );

   if ($principal) $query->condition('est_contact_principal', 1, '=' );

   $contact_infos = $query->execute()->fetchAssoc();

   db_set_active();

   return $contact_infos;
 }

/**
 *  Prendre l'id du contact entreprise
 *
 *  et le les infos du contact entreprises
 *
 */

function shared_get_entreprise_by_contact($contact) {
    db_set_active(@DB_SLAVE);

    $query = db_select('v_contacts_entreprises', 'l');
    $query->fields('l', array('id_entreprise' ));

    $dbOr = db_or()
        ->condition('nom', '%'.$contact.'%', 'LIKE')
        ->condition('prenom','%'.$contact.'%', 'LIKE');
    $query->condition(
        $dbOr
    );
    $query->range(0,100);
    $results = $query->execute()->fetchAll();
    $return[] = 'XXXX';
    foreach($results as $value){
        $return[] = trim($value->id_entreprise);
    }

    db_set_active();

    return $return;
}


/**
 *  Renvoie les données du contact entreprise
 *  @param:  $id_entreprise
 *  @return: Les infos de l'utilisateur entreprise
 *
 */
function shared_get_infos_contact_entreprise($id_entreprise) {
  db_set_active(@DB_SLAVE);

  $query = db_select('entreprises', 'e');
  $query->join('contacts_entreprises', 'c', 'c.id = e.id');
  $query->fields('c', array('id_civilite', 'prenom', 'nom', 'telephone', 'email', 'id_fonction'))
        ->condition('e.est_valide', 0, '=')
        ->condition('e.est_actif', 1, '=')
        ->condition('e.id', $id_entreprise, '=');

  $contacts_infos = $query->execute()->fetchAll();

  db_set_active();

  return $contacts_infos;
}



/**
 *  Renvoie les données du contact entreprise à valider
 *  @param:  $id_entreprise
 *  @return: Les infos de l'utilisateur entreprise
 *
 */
function shared_get_infos_contact_entreprise_a_valider($id_entreprise) {
  db_set_active(@DB_SLAVE);

   $query = db_select('liens_contact_entreprise', 'l');
            $query->join('contacts_entreprises', 'c', 'c.id = l.id_contact_entreprise');
            $query->fields('c', array('id_civilite', 'prenom', 'nom', 'telephone', 'email', 'id_fonction'));
            $query->condition('id_entreprise', $id_entreprise, '=' );
            $query->condition('c.est_valide', 0 , '=' );
            $query->condition('c.est_actif', 1 , '=' );

   $contact_infos = $query->execute()->fetchAll();

   db_set_active();

   return $contact_infos;
}

// TRASH

/**
 *  Renvoie les données d'une entreprise à valider via l'id entreprise
 *  @param: $id_entreprise
 *  @return: Les infos de l'entreprise
 *
 */
function shared_get_infos_entreprise_a_valider($id_entreprise) {
  db_set_active(@DB_SLAVE);

  $query = db_select('entreprises', 'e');
  $query->leftJoin('adresses_entreprises', 'a', 'a.id_entreprise = e.id');
  $query->fields('e', array('id', 'siret', 'raison_sociale', 'telephone_principal', 'id_naf', 'id_nace'))
        ->fields('a', array('id', 'rue', 'complement_de_rue','complement_de_rue_2', 'code_postal', 'ville', 'id'));
  $query->addField('a', 'id', 'IdAdress');
  $query->condition('e.est_actif', 1, '=')
        ->condition('e.est_valide', 0, '=')
        ->condition('e.id', $id_entreprise, '=');

  $infos_entreprises = $query->execute()->fetchAll();

  db_set_active();

  return $infos_entreprises;
}