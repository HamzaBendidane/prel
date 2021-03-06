<?php
function shared_isset_trim($value){
  if (isset($value)) {
      if (is_array($value)) return $value;
      else return trim($value);
  }
  return null;
}
/**
 *  Vérifie les rôles d'un utilisateur
 */
function check_user_roles($user_extranet) {
    global $user;

    if(in_array($user_extranet, $user->roles)) {
        unset($user->roles[$user_extranet]);
        return true;
    } else {
        return false;
    }
}

function redirect_no_access() {
  drupal_goto("/");
}


/**
 * check security dgf
 * @param int $id
 * @return boolean
 */
function shared_user_access($habilitation) {
    global $user;

    $habilitations = shared_get_habilitation();
    if (!has_role_entreprise() || !array_key_exists($habilitation, $habilitations)) {
      return user_access($habilitation);
    }

    $id_user = @$user->data['extranet_user']->drupal_user->id;

    db_set_active(@DB_EXTRANET);

    $query = db_select('lien_drupal_user_habilitation', 'l');
    $query->fields('l', array('id_habilitation'));
    $query->condition('id_habilitation', $habilitation, '=');
    $query->condition('id_drupal_user', $id_user, '=');
    $result = $query->execute()->fetchAssoc();
    db_set_active();

    if ($result) {
        return true;
    } else {
        return false;
    }
}

/**
 * check security dgf
 * @param int $id
 * @return boolean
 */
function check_security_dgf($id) {

    global $user;

    $id_user = $user->uid;

    db_set_active(@DB_EXTRANET);

    $query = db_select('dgf', 't');
    $query->fields('t', array('id_user_creation'));
    $query->join('lien_dgf_ref_esclave_entreprise', 'l', 'l.id_dgf = t.id');
    $query->leftJoin('dgf_form_demande', 'd', 'd.id_dgf = t.id');
    $query->fields('l');

    // ROLE 6 : DIRECTEUR ADEFIM / ROLE 7 : REFERENT ADEFIM / ROLE 8 : GESTIONNAIRE ADEFIM / ROLE 9 : CONSEILLER ADEFIM
    shared_update_requete_adefim_entreprise($query,'l.id_ref_esclave_entreprise','extranet');
    if(!intval($id)) return false;
    $query->condition('t.id', $id, '=');

   // $query->condition('d.is_delete', 0, '=');
    $result = $query->execute()->fetchAll();
    db_set_active();

    if ($result && $result[0]->id) {
        return true;
    } else {
        return false;
    }
}

/**
 * check security dgf
 * @param int $id
 * @return boolean
 */
function check_security_etab($id) {
    global $user;

    if (!is_array(@$user->data['extranet_user']->entreprises)) return false;

    return in_array(trim($id),array_keys($user->data['extranet_user']->entreprises));
}
function check_security_utilisateurs($id){
    global $user;

    $user_infos = shared_db_utilisateurs_get_users_infos($id);
    // Si c'est cet utilisateur qui l'a créé, il y a accès auto
    if ($user_infos->id_user_creation === $user->uid) {
      return true;
    }

    $lien_user_entreprise_ref_esclave_entreprise = shared_db_get_lien_user_entreprise_ref_esclave_entreprise(
        $id);
    $return = false;
    foreach($lien_user_entreprise_ref_esclave_entreprise as $value){
        if (in_array(trim($value->id_ref_esclave_entreprise),array_keys($user->data['extranet_user']->entreprises))) return true;
    }
    return $return;
}

/**
 * has role opcaim
 * @return bool
 */
function has_role_opcaim(){
    global $user;
    // ROLE 6 : ADMIN OPCAIM / ROLE 13 : SUPER ADMIN OPCAIM
    if (user_has_role(6) || user_has_role(13) ) {
        return  true;
    }
    return false;
}

/**
 * has role admin
 * @return bool
 */
function has_role_admin(){
    global $user;

    if (user_has_role(3) || user_has_role(6) || user_has_role(13)) {
        return  true;
    }
    return false;
}

/**
 * has role adefim
 * @return bool
 */
function has_role_adefim(){
    global $user;
    // ROLE 9 : DIRECTEUR ADEFIM / ROLE 12 : REFERENT ADEFIM / ROLE 10 : GESTIONNAIRE ADEFIM / ROLE 8 : CONSEILLER ADEFIM
    if (user_has_role(8) || user_has_role(9) || user_has_role(10) || user_has_role(12)) {
            return  true;
    }
    return false;
}

/**
 * @return bool
 */
function has_role_entreprise(){
    global $user;
    // ROLE 5 : ADMIN ENTREPRISE / ROLE 7 : COLLABORATEUR ENTREPRISE
    if (user_has_role(5) || user_has_role(7)) {
            return true;
    }
    return false;
}

/**
 *
 * @param int $index
 * @param string $type
 * @return id|redirect
 */
function shared_security_access_user($index = null, $type) {
    $aTypes = array('DGF','ETAB','UTILIS');
    $checkSecurity = false;
    if (!in_array($type, $aTypes)) {
        redirect_no_access();
    }

    $id = arg($index);

    switch ($type) {
        case 'DGF':
            if(!intval($id)) redirect_no_access();
            if (has_role_admin() ) return arg($index);
            $checkSecurity = check_security_dgf($id);
            break;
        case 'ETAB':
            if (has_role_admin()) return arg($index);
            $checkSecurity = check_security_etab($id);
            break;
        case 'UTILIS':
            if (has_role_admin()) return arg($index);
            $checkSecurity = check_security_utilisateurs($id);
            break;
    }

    if ($checkSecurity) {
        return $id;
    } else {
        redirect_no_access();
    }
    return;
}

function shared_update_user_entreprises() {
    require_once drupal_get_path('module', 'login' ) . '/login_db.inc';
    global $user ;
    $account = user_load($user->uid);

    if (has_role_entreprise()) {
        $extranet_user = login_db_get_extranet_user($user->uid);
        if ($extranet_user) {
            user_save($account, array('extranet_user' => $extranet_user));
        }
    }
    if (has_role_adefim()){
        $user_adefims = @$user->data['extranet_user']->user_adefim;
        $extranet_user['user_adefim'] = $user_adefims;
        $extranet_user['entreprises'] = login_db_get_adefims_entreprise(trim($user_adefims->id_adefim));
        user_save($account, array('extranet_user' => $extranet_user));
    }
}

function shared_update_requete_adefim_entreprise($query,$id,$base = 'extranet') {
  global $user;

  $id_user_entreprise = shared_get_drupal_user_id($user->uid);

  if (has_role_adefim() || has_role_entreprise()) {

      if (has_role_adefim()) {
        if ($base == "esclave") {
          $query->join('v_adefims_entreprise_ext', 'lien', 'lien.id_entreprise ='.$id);
        } else {
          $query->join('liens_adefim_entreprise', 'lien', 'lien.id_entreprise ='.$id);
        }

       $query->condition('lien.id_adefim', trim($user->data['extranet_user']->user_adefim->id_adefim), '=');
      } else {

          if ($base == "esclave") {
              if (count(array_keys($user->data['extranet_user']->entreprises))){
                  $query->condition($id, array_keys($user->data['extranet_user']->entreprises), 'in');
              }else{
                  $query->condition($id, array('XX'), 'in');
              }
          }else{
              $query->join('lien_user_entreprise_ref_esclave_entreprise', 'user_entreprise', 'user_entreprise.id_ref_esclave_entreprise ='.$id);
              $query->condition('user_entreprise.id_user_entreprise', $id_user_entreprise, '=');
          }
        }
      db_set_active();

  }

  return $query;
}