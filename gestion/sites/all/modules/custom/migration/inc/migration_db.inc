<?php
require_once DRUPAL_ROOT.'/includes/password.inc';
function migration_get_ref_comptes_extranet(){

    db_set_active(@DB_SLAVE);

    $query = db_select('comptes_extranet', 'ce');
    $query->fields('ce');
  //  $query->condition("migration", 'NULL' ,"is");
    $query->condition("est_actif", 1 ,"=");
    $query->condition("est_compte_entreprise", 1 ,"=");
  //  $query->condition("id_entreprise", 'I.' ,"<>");
    $results = $query->execute()->fetchAll(PDO::FETCH_ASSOC);
    db_set_active();
    return $results;
}

function migration_process_comptes_extranet($id,$newId){

    db_set_active(@DB_SLAVE);

    // save date begin et date end de contrat
    $query = db_update('comptes_extranet')
        ->fields(array(
           'migration' => $newId
        ));
    $query->condition('id', db_like($id), 'LIKE');

   $result =  $query->execute();
    db_set_active();
}

 function migration_compte_entreprise_db_save_user_habilitations($id_drupal_user) {

    $user_habilitations = shared_get_habilitation();

     db_set_active(@DB_EXTRANET);

    $sql_delete = db_delete('lien_drupal_user_habilitation')  // Supprime toutes les habilitations de l'utilisateur associé à l'id
    ->condition('id_drupal_user' , $id_drupal_user, '=')
        ->execute();

    foreach ($user_habilitations as $key => $value) {   // Sauvegarde les habilitations  // Vaudrait mieux faire un db_update : lien_drupal_user_habilitation
        if ($value != '0') {
            $hab_sql = db_insert('lien_drupal_user_habilitation')
                ->fields(array(
                    'id_drupal_user'     => $id_drupal_user,
                    'id_habilitation'    => $key,
                ))
                ->execute();
        }
    }
    db_set_active();
}

function migration_add_drupal_user($data_information){

    //___________________ Sauvegardde des entreprises et utilisateurs ________________________ //
    // On sauvegarde le user dans la table users de drupal en bloqué
    $new_user = array(
        'name' => trim($data_information['email']),
        //'pass' => user_hash_password(trim($data_information['mot_de_passe'])),
        'pass' => trim($data_information['mot_de_passe']),
        'mail' => trim($data_information['email']),
        'init' => trim($data_information['email']),
        'status' => 1,
        'access' => REQUEST_TIME,
        'roles' => array('7' => 'COLLABORATEUR ENTREPRISE'),
    );
    // $account returns user object
    $account = user_save(null, $new_user);
    $id_drupal_user = $account->uid;
    return $id_drupal_user;
}

/**
 *  Sauvegarde les infos d'un utilisateur entreprise
 *  Nom de la table: drupal_user
 */
function company_register_db_save_extranet_drupal_user($data, $id_user_drupal) {
    global $user;

    db_set_active(@DB_EXTRANET);

    $id_extranet_drupal_user = db_insert('drupal_user')

        ->fields( array(
            'civilite' => $data['utilisateur_titre'],
            'last_name' => $data['utilisateur_nom'],
            'first_name' => $data['utilisateur_prenom'],
            'mail' => $data['utilisateur_email'],
            'fonction' => null,
            'telephone' => trim($data['utilisateur_telephone']),
            'date_creation' => shared_send_to_mssql_date(null,'datetime'),
            'id_user_creation' => 1,
            'is_delete' => 0,
            'id_user_drupal' => $id_user_drupal,'statut' => 1,))
        ->execute();
    db_set_active();

    return $id_extranet_drupal_user;
}

/**
 *  Sauvegarde le numÃ©ro de demande
 *  Nom de la table: user_entreprise
 */
function company_register_db_save_user_entreprise($num_demande , $nom_sign, $id_extranet_drupal_user, $id_user_responsable,$charte_signe=0) {
    global  $user;

    db_set_active(@DB_EXTRANET);

    // SQL INSERT
    $id_user_entreprise = db_insert(@TABLE_USER_ENTREPRISE)
        -> fields(array(
            'id_user_responsable' => $id_user_responsable,
            'id_drupal_user' => $id_extranet_drupal_user,
            'numero_demande' => $num_demande,
            'charte_signe'   => 0,
            'nom_signe'   => $nom_sign,
            'date_charte_signe' =>  shared_send_to_mssql_date(null, 'datetime'),
        ))
        ->execute();
    db_set_active();

    return $id_user_entreprise;
}


/**
 *  Sauvegarde les infos d'un responsable entreprise
 *  Nom de la table: @TABLE_USER_RESPONSABLE
 */
function company_register_db_save_user_responsable($data) {
    global $user;

    db_set_active(@DB_EXTRANET);

    $Resp_Nom = $data['responsable_nom'];
    $Resp_Prenom =  $data['responsable_prenom'];
    $Resp_Email = $data['responsable_email'];
    $Resp_Fonction = $data['responsable_fonction'];

    $aTitle ['M.'] = 'I.TITR.M.';
    $aTitle ['Mle'] = 'I.TITR.Mle';
    $aTitle ['Mme'] = 'I.TITR.Mme';
    $id_user_responsable = db_insert(@TABLE_USER_RESPONSABLE)
        ->fields( array(
            'civilite' => trim($aTitle[trim($data['responsable_civilite'])]),
            'nom'      => $Resp_Nom,
            'prenom'   => $Resp_Prenom,
            'email'    => $Resp_Email,
            'fonction' => $Resp_Fonction,
        ))
        ->execute();

    db_set_active();

    return $id_user_responsable;
}

/**
 * _administration_utilisateurs_ajax_db_attacher
 *
 * fcontion qui permet de retirer le rattachement d'un établissement à un utilisateur
 *
 * @param int $id_user_entreprise
 * @param string $id_ref_entreprise
 */
function migration_utilisateurs_db_attacher($id_user_entreprise, $id_ref_entreprise) {
    try {
        db_set_active(@DB_EXTRANET);

        $sql =  db_insert('lien_user_entreprise_ref_esclave_entreprise')
            ->fields(
                array(
                    'id_user_entreprise'=> $id_user_entreprise,
                    'id_ref_esclave_entreprise' => $id_ref_entreprise,
                    'est_valide' => 1,
                    'est_actif' => 1
                ))
            ->execute();

        db_set_active();
        return true;
    } catch (Exception $e) {
        return false;
    }
}

/**
 */
function migration_process_adefim_entreprise() {
    print "START TIME : ".date('Y-m-d H:i:s')."\n";
  try {
  db_set_active(@DB_SLAVE );
  $query = db_select('v_adefims_entreprise_ext', 'v');
  $query->fields('v');
  //$query->condition("est_actif", 1 ,"=");
  //$query->condition("est_valide", 1 ,"=");
  $results = $query->execute();


  while ($demande = $results->fetchAssoc() ){
    db_set_active(@DB_EXTRANET );
    try {
      $sql =  db_insert('liens_adefim_entreprise')
      ->fields(
          array(
              'id_adefim'=> $demande['id_adefim'],
              'id_entreprise' => $demande['id_entreprise'],
              'est_valide' => 1,
              'est_actif' => 1,
              'creation_utilisateur' => 'informix',
              'creation_date' => shared_send_to_mssql_date(null,'datetime')
          ))
          ->execute();
    } catch (exception $e) {
    }
    
  }
    db_set_active();
    return true;
  }
  catch (Exception $e) {
    print($e) ;
    return false;
  }
}

function migration_process_user_entreprise() {
  print "START TIME : ".date('Y-m-d H:i:s')."\n";
  try {
  db_set_active(@DB_EXTRANET );
  $query = db_select('lien_user_entreprise_ref_esclave_entreprise', 'e');
  $query->fields('e');
  $results = $query->execute();


  while ($lien = $results->fetchAssoc() ){
    db_set_active(@DB_SLAVE );
    try {
      $sql =  db_insert('lien_user_entreprise_ref_esclave_entreprise')
      ->fields(
          array(
              'id_user_entreprise'=> $lien['id_user_entreprise'],
              'id_ref_esclave_entreprise' => $lien['id_ref_esclave_entreprise'],
              'est_valide' => $lien['est_valide'],
              'est_actif' => $lien['est_actif'],
          ))
          ->execute();
    } catch (exception $e) {}
  }
    db_set_active();
    return true;
  }
  catch (Exception $e) {
    print($e) ;
    return false;
  }
}