<?php
 /**
 *  Renvoi le siret via l'id entreprise
 */
function shared_get_siret_entreprise($id_ref_esclave_entreprise) {
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_SLAVE);

  $sql = db_select('v_entreprises', 'v')
         ->fields('v', array('siret'))
         ->condition('id', $id_ref_esclave_entreprise, '=')
         ->orderBy('siret', 'ASC')
         ->execute();

  $data = $sql->fetchAssoc();

  $siret_entreprise = trim($data['siret']);

  db_set_active();

  return $siret_entreprise;
}

/**
 *  Renvoi la raison sociale via l'id entreprise
 */
function shared_get_raison_sociale_entreprise($id_entreprise) {
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_SLAVE);

  $sql = db_select('v_entreprises', 'v')
  ->fields('v', array('raison_sociale'))
  ->condition('id', $id_entreprise, '=')
  ->orderBy('raison_sociale', 'ASC')
  ->execute();

  $raison_sociale = $sql->fetchField();
//   $raison_sociale = $sql->fetchAll();
  db_set_active();

  return $raison_sociale;
}

/**
 *  Renvoi la raison sociale via l'id entreprise
 */
function shared_get_raison_sociale_siret_entreprise($id_entreprise) {
    // Renvoie l'id de  l'utilisateur entreprise
    db_set_active(@DB_SLAVE);

    $sql = db_select('v_entreprises', 'v')
    ->fields('v', array('raison_sociale', 'siret'))
    ->condition('id', $id_entreprise, '=')
    ->orderBy('raison_sociale', 'ASC')
    ->execute();

    $data = $sql->fetchAssoc();

    $raison_sociale_siret = trim($data['siret']) . ' - ' . trim($data['raison_sociale']);

    db_set_active();

    return $raison_sociale_siret;
}


/**
 *  Renvoie l'id d'une entreprise via le siret
 */
function shared_get_id_entreprise_from_siret($siret) {
  db_set_active(@DB_SLAVE);

  $sql  = db_select('v_entreprises', 'v')
          ->fields('v' , array('id'))
          ->condition('siret', $siret, '=')
          ->execute();

  $id = $sql->fetchField();

  db_set_active();
    if ($id)  return trim($id);
    else return null;

}

/**
 * Renvoie l'id de l'entreprise lié a l'utilisateur entreprise
 *
 */
function shared_get_id_entreprise_from_user_entreprise($id_user_entreprise) {
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_EXTRANET);

  $sql = db_select('lien_user_entreprise_ref_esclave_entreprise', 'l')
         ->fields('l', array('id_ref_esclave_entreprise'))
         ->condition('id_user_entreprise', $id_user_entreprise, '=')
         ->execute();

  $data = $sql->fetchAssoc();

  $id_entreprise = trim($data['id_ref_esclave_entreprise']);

  db_set_active();

  return $id_entreprise;
}

/**
 *  Renvoie l'id de l'utilisateur entreprise via l'id de la table Drupal user
 *  @param: $id_user
 */
function shared_get_user_id_entreprise($id_user) {
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_EXTRANET);

  $sql = db_select('user_entreprise', 'u')
         ->fields('u', array('id'))
         ->condition('id_drupal_user', $id_user, '=')
         ->execute();

  $data = $sql->fetchAssoc();

  $id_user_entreprise = trim($data['id']);

  db_set_active();

  return $id_user_entreprise;
}

/**
 *  Renvoie l'id de n'importe quelle table
 *
 */
function shared_get_id($id, $table, $column, $alias, $field){
  // Renvoie l'id de  l'utilisateur entreprise
  db_set_active(@DB_EXTRANET);

  $sql = db_select($table, $alias)
         ->fields($alias, $field)
         ->condition($column, $id, '=')
         ->execute();

  $data_ids = $sql->fetchAssoc();

  db_set_active();

  return $data_ids;
}

/**
 *  TODO Commentaire
 *
 */
function get_entreprise_data_extranet($id_dgf) {
    db_set_active(@DB_EXTRANET);

    $query = "SELECT * FROM lien_dgf_ref_esclave_entreprise where id_dgf = '$id_dgf'";

    $result = db_query($query);

    $resultdata  = $result->fetchAll();
    db_set_active();

    if (!$resultdata) return array();

    return $resultdata;
}
/**
 * Renvoie l'id ADEFIM associé à une entreprise via l'id entreprise
 *
 */
 function shared_get_id_contact_entreprise_from_id_entreprise($id_entreprise) {

  db_set_active(@DB_SLAVE);

  // Renvoie l'id contact entreprise
  $sql_adefims = db_select('liens_contact_entreprise', 'l')
                 ->fields('l', array('id_contact_entreprise'))
                 ->condition('id_entreprise' , $id_entreprise , '=')
                 ->execute();

  $sql_contact_entreprise = $sql_adefims->fetchAssoc();

  $id_contact_entreprise = trim($sql_contact_entreprise['id_contact_entreprise']);

  return $id_contact_entreprise;
 }

/**
 * Renvoie le code NAF
 */
function shared_get_nafs(){
   // Connection au référentiel OPCAIM
  $fields = array('id', 'code', 'libelle');

  $codes_nafs = shared_db_select(@DB_SLAVE, 'nafs', 'n', $fields);

  $nafs = array();

  foreach ($codes_nafs as $value) {
    $id_nafs = trim($value->id); // Id
    $code_nafs = trim($value->code); // Code
    $libelle_nafs = $value->libelle; // Libelle
    // Sauvegarde en session des codes NAF
    $nafs[$id_nafs] = trim($code_nafs) . ' - ' . $libelle_nafs;
  }
  return  $nafs;
}

/**
 * Renvoie la liste des secteurs d'activités
 */
function shared_get_secteurs_activites() {

  db_set_active(@DB_SLAVE);
  // Ramène les infos entreprises
  $query = db_select('v_secteurs_activite', 'vsa');
  $query->fields('vsa');
  $query->orderBy('code');
  $get_infos_sql = $query->execute();
  $result = $get_infos_sql->fetchAll();

  db_set_active();

  $secteurs_activites = array('Veuillez choisir dans la liste');

  foreach ($result as $value) {
    $id = trim($value->id); // Id
    $code = trim($value->code); // Code
    $libelle = $value->libelle; // Libelle
    $secteurs_activites[$id] = trim($code) . ' - ' . $libelle;
  }
  return  $secteurs_activites;
}

function shared_db_get_code_naf() {
  // Connection au référentiel OPCAIM
  $fields = array('id', 'code', 'libelle');

  $codes_nafs = shared_db_select(@DB_SLAVE, 'v_nafs', 'n', $fields);

  $nafs = array('Veuillez choisir dans la liste');

  foreach ($codes_nafs as $value) {
    $id_nafs = trim($value->id); // Id
    $code_nafs = trim($value->code); // Code
    $libelle_nafs = $value->libelle; // Libelle
    // Sauvegarde en session des codes NAF
    $nafs[$id_nafs] = trim($code_nafs) . ' - ' . $libelle_nafs;
  }
  return  $nafs;
}

function shared_db_get_code_naces() {
    // Connection au référentiel OPCAIM
    $fields = array('id', 'code', 'libelle');

    $codes_nafs = shared_db_select(@DB_SLAVE, 'v_naces', 'n', $fields);

    $nafs = array('Veuillez choisir dans la liste');

    foreach ($codes_nafs as $value) {
        $id_nafs = trim($value->id); // Id
        $code_nafs = trim($value->code); // Code
        $libelle_nafs = $value->libelle; // Libelle
        // Sauvegarde en session des codes NAF
        $nafs[$id_nafs] = trim($code_nafs) . ' - ' . $libelle_nafs;
    }
    return  $nafs;
}

/**
 *   Ramène les fonctions du contact entreprise
 */
function shared_get_contact_entreprises() {
   // Connection au référentiel OPCAIM
  $fields = array('id', 'libelle');

  $list_contacts = shared_db_select(@DB_SLAVE, 'fonctions', 'f', $fields);

  $contacts_entreprises = array();

  foreach ($list_contacts as $value) {
    $id_contacts = trim($value->id); // Id
    $libelles_contacts = $value->libelle; // Libelle
    // Sauvegarde en session des codes NAF
    $contacts_entreprises[$id_contacts] = trim($libelles_contacts);
  }

  return  $contacts_entreprises;
}

function shared_autocomplete_entreprise_all_by_siret_raison_sociale() {
  global $user;
  db_set_active(@DB_SLAVE);  // Connection au référentiel

  if (!isset($term)) {
    $term = $_GET["term"];
  }
  $sql = db_select('v_entreprises', 'e');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('e')
  ->distinct()
  ->condition(
      db_or()
      ->condition('siret',  db_like($term) . '%' , 'LIKE')
      ->condition('raison_sociale', '%' . db_like($term) . '%' , 'LIKE')
  )
  ->orderBy('siret', 'ASC');
  // On récupère aussi les infos de la convention collective
  // pour la vue stagiaire du formulaire qui a une saisie auto
  // sur le champ convention collective relative à la saisie utilisateur
  $sql->leftJoin('v_conventions_collectives', 'vcc', 'vcc.id = e.id_convention_collective');
  $sql->fields('vcc', array('libelle', 'code'));

  $values = $sql->execute()->fetchAll();

  $data = array();
  foreach ($values as $items) {
    $siret = trim($items->siret);
    $siret = substr($siret, 0 , 9) . ' ' . substr($siret, 9);
    $data[] = array(
        'label' => trim($siret) . ' - ' . trim($items->raison_sociale),
        'value' => trim($siret) . ' - ' . trim($items->raison_sociale),
        'data' =>  $items,
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}

function shared_autocomplete_entreprise_by_siret_raison_sociale() {
  global $user;
  db_set_active(@DB_SLAVE);  // Connection au référentiel

  if (!isset($term)) {
    $term = $_GET["term"];
  }
  $sql = db_select('v_entreprises', 'e');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('e')
    ->distinct()
    ->condition(
        db_or()
        ->condition('siret',  db_like($term) . '%' , 'LIKE')
        ->condition('raison_sociale', '%' . db_like($term) . '%' , 'LIKE')
  )
  ->orderBy('siret', 'ASC');
  // On récupère aussi les infos de la convention collective
  // pour la vue stagiaire du formulaire qui a une saisie auto
  // sur le champ convention collective relative à la saisie utilisateur
  $sql->leftJoin('v_conventions_collectives', 'vcc', 'vcc.id = e.id_convention_collective');
  $sql->fields('vcc', array('libelle', 'code'));

   shared_update_requete_adefim_entreprise($sql,'e.id','esclave');
    $values = $sql->execute()->fetchAll();

  $data = array();
  foreach ($values as $items) {
    $siret = trim($items->siret);
    $siret = substr($siret, 0 , 9) . ' ' . substr($siret, 9);
    $data[] = array(
        'label' => trim($siret) . ' - ' . trim($items->raison_sociale),
        'value' => trim($siret) . ' - ' . trim($items->raison_sociale),
        'data' =>  $items,
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}

 /**
 * Fonction des autocomplétions sur les entreprises
 */
function shared_autocomplete_entreprise(){
  global $user;

  db_set_active(@DB_SLAVE);  // Connection au référentiel

  if (!isset($term)) {
     $term = $_GET["term"];
  }
  $sql = db_select('v_entreprises', 'e');//  Requête SQL pour trouver un numéro de siret

  $sql->fields('e')
      ->distinct()
      ->condition('siret',  db_like($term) . '%' , 'LIKE')
        ->orderBy('siret', 'ASC');

  if (has_role_adefim() || has_role_entreprise()) {
    shared_update_requete_adefim_entreprise($sql,'e.id','esclave');
  }

  $values = $sql->execute()->fetchAll();

  $data = array();
  foreach ($values as $items) {
    $siret = trim($items->siret);
    $siret = substr($siret, 0 , 9) . ' ' . substr($siret, 9);
    $data[] = array(
      'label' => trim($siret) . ' - ' . trim($items->raison_sociale),
      'value' => trim($items->siret),
      'data' =>  $items,
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}

/**
 * Fonction des autocomplétions sur les entreprises
 */
function shared_autocomplete_all_entreprise(){
  global $user;

  db_set_active(@DB_SLAVE);  // Connection au référentiel

  if (!isset($term)) {
    $term = $_GET["term"];
  }
  $sql = db_select('v_entreprises', 'e');//  Requête SQL pour trouver un numéro de siret
  $sql->leftJoin('v_adresses_entreprises', 'vae', 'vae.id_entreprise = e.id AND vae.est_actif = 1');
//   $sql->leftJoin('v_nafs', 'vna', 'e.id_naf = vna.id AND vna.est_actif = 1');
  $sql->leftJoin('v_naces', 'vna', 'e.id_nace = vna.id AND vna.est_actif = 1');
  $sql->leftJoin('v_secteurs_activite', 'vsa', 'e.id_secteur_activite = vsa.id AND vsa.est_actif = 1');
  $sql->fields('e')
  ->fields('vae')
  ->distinct()
  ->condition('siret',  db_like($term) . '%' , 'LIKE');
  $sql->addExpression('vsa.code', 'code_secteur_activite1');
  $sql->addExpression('vsa.libelle', 'libelle_secteur_activite1');
  $sql->addExpression('vna.code', 'code_nace');
  $sql->addExpression('vna.libelle', 'libelle_nace');
  $sql -> orderBy('siret', 'ASC');



  $values = $sql->execute()->fetchAll();

  $data = array();
  foreach ($values as $items) {
    $siret = trim($items->siret);
    $siret = substr($siret, 0 , 9) . ' ' . substr($siret, 9);
    $data[] = array(
        'label' => trim($siret) . ' - ' . trim($items->raison_sociale),
        'value' => trim($items->siret),
        'data' =>  $items,
    );
  }
  db_set_active(); // Fermeture de la connexion

  drupal_json_output($data); // Renvoie des résultats en json
}

function shared_db_functions_get_ref_esclave_entreprise() {
  global $user;

  db_set_active(@DB_SLAVE);

  $query = db_select('v_entreprises', 'e');
  $query->fields('e');
//   $query->condition('e.est_valide = ', 1, '=');
  $query->condition('e.est_actif = ', 1, '=');

 shared_update_requete_adefim_entreprise($query,'e.id','esclave');

  // JOINTURE AVEC LA VUE DES ADRESSES ENTREPRISES
  $query->join('v_adresses_entreprises', 'a', 'a.id_entreprise = e.id');
  $query->fields('a');
  //Limiter le résultat dans le cas d'un admin
  $query->range(0,100);

  $results = $query->execute()->fetchAll();

  $entreprises[] = "Veuillez selectionner un établissement...";
  foreach ($results as $entreprise) {
    // ATTENTION :  suite à la jointure id de v_entreprises est écrasé par l'id de v_adresses_entreprises
    $entreprises[trim($entreprise->id_entreprise)] = trim($entreprise->raison_sociale) . ' - ' . trim($entreprise->siret)  . ' - ' . trim($entreprise->ville);
  }
  db_set_active();

  return $entreprises;
}

/**
 *   Vérifie si un siret existe
 */
function shared_find_if_siret_exist($siret){
  db_set_active(@DB_SLAVE);

  $db_sirets = db_select('entreprises', 's')
              ->fields('s', array('siret'))
              ->condition('siret', $siret , '=')
              ->execute();

  $sirets_numbers = $db_sirets->fetchAssoc();

  $siret = trim($sirets_numbers['siret']);

  db_set_active();

  return $siret;
}
function shared_get_entreprise_by_name($name) {
    db_set_active(@DB_SLAVE);
    $query = db_select('v_entreprises', 'sa');
    $query->fields('sa', array('id'));

    $query->condition(
        db_or()
            ->condition('raison_sociale', '%'.$name.'%', 'LIKE')
            ->condition('siret', '%'.$name.'%', 'LIKE')
    );
    $results = $query->execute()->fetchAll();
    $return[] = 'XXXX';
    foreach($results as $value){
        $return[] = $value->id;
    }
    db_set_active();
    return $return;
}
function shared_db_get_entreprise_data($id_entreprise) {
  db_set_active(@DB_SLAVE);

  // Ramène les infos entreprises
  $query = db_select('v_entreprises', 've');
  $query->leftJoin('v_adresses_entreprises', 'vae', 'vae.id_entreprise = ve.id');
  $query->fields('ve', array('id', 'raison_sociale', 'siret', 'est_valide', 'est_actif','id_categorie'));
  $query->fields('vae', array('rue', 'complement_de_rue', 'code_postal', 'ville'));
  $query->condition('ve.id' , $id_entreprise , '=');
  $query->range(0, 1);
  $get_infos_sql = $query->execute();
  $company_infos = $get_infos_sql->fetch();
  db_set_active();

  return $company_infos;
}

function shared_db_get_entreprise_data_from_siret($siret) {
  db_set_active(@DB_SLAVE);

  // Ramène les infos entreprises
  $query = db_select('v_entreprises', 've');
  $query->leftJoin('v_adresses_entreprises', 'vae', 'vae.id_entreprise = ve.id');
  $query->fields('ve', array('id', 'raison_sociale', 'siret', 'est_valide', 'est_actif', 'id_naf', 'id_secteur_activite'));
  $query->fields('vae', array('rue', 'complement_de_rue', 'code_postal', 'ville'));
  $query->condition('ve.siret' , $siret , '=');
  $query->range(0, 1);
  $get_infos_sql = $query->execute();
  $company_infos = $get_infos_sql->fetch();

  db_set_active();

  return $company_infos;
}

function shared_db_get_entreprise_from_siret($siret) {
  db_set_active(@DB_SLAVE);

  // Ramène les infos entreprises
  $query = db_select('v_entreprises', 've');
  $query->fields('ve');
  $query->condition('ve.siret' , $siret , '=');
  $query->range(0, 1);
  $get_infos_sql = $query->execute();
  $entreprise = $get_infos_sql->fetch();

  db_set_active();

  return $entreprise;
}

/**
 * shared_db_get_adresse_entreprise_from_id_entreprise
 *
 * @param string $id_entreprise
 * @return array $adresse_entreprise
 */
function shared_db_get_adresse_entreprise_from_id_entreprise($id_entreprise) {
  db_set_active(@DB_SLAVE);

  // Ramène les infos entreprises
  $query = db_select('v_adresses_entreprises', 'vae');
  $query->fields('vae');
  $query->condition('vae.id_entreprise' , $id_entreprise , '=');
  $query->range(0, 1);
  $get_infos_sql = $query->execute();
  $adresse_entreprise = $get_infos_sql->fetch();

  db_set_active();

  return $adresse_entreprise;
}

/**
 * shared_db_entreprise_is_valid_siret_number
 *
 * fonction qui permet de vérifier que le siret est valide
 *
 * @param string $siret
 * @return boolean
 */
function shared_db_entreprise_is_valid_siret_number($siret) {
  //longueur de la chaine $num
  $length = strlen($siret);

  //resultat de l'addition de tous les chiffres
  $total = 0;
  for ($i = $length-1 ; $i >= 0 ; $i--) {
    $digit = substr($siret, $i, 1);

    if ((($length - $i) % 2) == 0) {
      $digit = $digit * 2;
      if ($digit > 9) {
        $digit = $digit - 9;
      }
    }

    $total += $digit;
  }

  if (($total % 10) == 0) {
    return true;
  } else {
    return false;
  }
}