<?php

/**
 * Implements hook_token_info().
 */
function shared_token_info() {
  $types['user_info'] = array(
    'name' => t("User info tokens" ),
    'description' => t("Tokens for user info" ));
  $user_info['user_first_name'] = array(
    'name' => t("Prenom" ),
    'description' => t("The first name of the current user." ));
  
  $types['user_last_name'] = array(
      'name' => t("User last name" ),
      'description' => t("test" ));
  $user_last_name['user_last_name'] = array(
      'name' => t("Nom" ),
      'description' => t("The last name of the current user." ));
  
  $types['user_civilite'] = array(
      'name' => t("User civilite tokens" ),
      'description' => t("" ));
  $user_civilite['user_civilite'] = array(
      'name' => t("civilite" ),
      'description' => t("The civilite name of the current user." ));

  $user_civilite['user_civilite'] = array(
      'name' => t("civilite" ),
      'description' => t("The civilite name of the current user." ));
  
  return array(
    'types' => $types,
    'tokens' => array(
      'user_info' => $user_info,
      'user_last_name' => $user_last_name,
      'user_civilite' => $user_civilite),
      
  );
}

/**
 * Implements hook_tokens().
 */
function shared_tokens($type, $tokens, array $data = array(), array $options = array()) {
  global $user_info;
  
  if(isset($_POST['email']) && ($user_info == '') ) {
    $user = user_load_by_mail($_POST['email']);
   // $user_info_table = (shared_users_verify_get_infos($user->uid));
    $user_info = $user_info_table[0];
  }
  
  $replacements = array();

  if ($type == 'user_info') {
    foreach ($tokens as $name => $original) {
      switch ($name) {
        case 'user_first_name' :
          if ($user_info && property_exists($user_info, 'first_name' )) {
            $replacements[$original] = $user_info->first_name;
          }
          break;
      }
    }
  }
  
  if ($type == 'user_civilite') {
    foreach ($tokens as $name => $original) {
      switch ($name) {
        case 'user_civilite' :
          if ($user_info && property_exists($user_info, 'civilite' )) {
            $replacements[$original] = getUserCivilite($user_info->civilite);
          }
          break;
      }
    }
  }
  
  if ($type == 'user_last_name') {
    foreach ($tokens as $name => $original) {
      switch ($name) {
        case 'user_last_name' :
          if ($user_info && property_exists($user_info, 'last_name' )) {
            $replacements[$original] = $user_info->last_name;
          }
          break;
      }
    }
  }
  
  return $replacements;
}

/**
 * Get a first name of a object of user
 * 
 * @param object $user          
 * @return string
 */
function getUserFirstName($user) {
  if (isset($user->data['extranet_user'] )) {
    if (property_exists($user->data['extranet_user'], 'drupal_user' )) {
      return trim($user->data['extranet_user']['drupal_user']->first_name );
    }
    else if (property_exists($user->data['extranet_user'], 'user_adefim' )) {
      return trim($user->data['extranet_user']['user_adefim']->prenom );
    }
  }
  return $user->name;
}

/**
 * Get civilite of user
 *
 * @param object $user
 * @return string
 */
function getUserCivilite($user) {
  $civilite ='';

  if(trim($user)=='I.TITR.M.'){
    $civilite='Mr';
  }else if (trim($user)=='I.TITR.Mme'){
    $civilite='Mme';
  }else if (trim($user)=='I.TITR.Mle') {
    $civilite='Mlle';
  }
  return $civilite;
}

