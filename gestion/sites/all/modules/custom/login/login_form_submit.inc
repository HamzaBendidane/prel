<?php

/**
 * check_login
 *
 * Fonction qui permet de connecter l'utilisateur
 *
 * Si l'utilisateur existe dans la BDD Drupal users alors on récupère les infos extranet (login_db_get_extranet_user)
 * Sinon on regarde s'il existe dans la BDD Référentiel compte_adefims (login_db_get_referentiel_user)
 */
function check_login() {
  global $user;
  $username = $_POST['username'];
  $password = $_POST['password'];

  $extranet_user = array();

  // Si on es en post et que l'utilisateur a rempli les champs username et password
  if (!empty($username) && !empty($password)) {
    // Si l'utilisateur existe dans la table user de la BDD opcaim_drupal
    $account = user_load_by_name($username);

    if ($account && $account->status != 0) {
      // on vérifie que les identifiants sont bons
      $uid = user_authenticate($username, $password);
      if ($uid) {
        // on loggue l'utilisateur
        $form_state['uid'] = $uid;
        user_login_submit(array(), $form_state);

        drupal_goto('/dashboard');
      }else{
          // Utilisateur non trouvé, on affiche un message d'erreur
          drupal_set_message(@ERROR_CHECK_LOGIN_2, 'error');
      }
    }
  } else {
    // Sinon on affiche les messages d'erreurs
    if (empty($username)) {
      // identifiant vide
      drupal_set_message(@ERROR_CHECK_LOGIN_REQUIRE_COMPTE, 'error');
    }
    if (empty($password)) {
      // password vide
      drupal_set_message(@ERROR_CHECK_LOGIN_REQUIRE_PASSWORD, 'error');
    }
  }
}

function check_login_submit() {

    global $user;
    $username = $_POST['username'];
    $password = $_POST['password'];

    $extranet_user = array();

    // Si on es en post et que l'utilisateur a rempli les champs username et password
    if (!empty($username) && !empty($password)) {
        // Si l'utilisateur existe dans la table user de la BDD opcaim_drupal
        $account = user_load_by_name($username);

        if ($account && $account->status != 0) {

            // on vérifie que les identifiants sont bons
            $uid = user_authenticate($username, $password);

            if ($uid ) {
                // on loggue l'utilisateur
                $form_state['uid'] = $uid;
                user_login_submit(array(), $form_state);

                if (!$_SESSION['stage']){
                    drupal_goto('/index.php');
                }else{
                    drupal_goto('/permis.php');
                }

            }else{

                // Utilisateur non trouvé, on affiche un message d'erreur
                drupal_set_message(@ERROR_CHECK_LOGIN_2, 'error');
                drupal_goto('/inscription.php');
            }
        }
    } else {
        drupal_goto('/inscription.php');
        // Sinon on affiche les messages d'erreurs
        if (empty($username)) {
            // identifiant vide
            drupal_set_message(@ERROR_CHECK_LOGIN_REQUIRE_COMPTE, 'error');
        }
        if (empty($password)) {
            // password vide
            drupal_set_message(@ERROR_CHECK_LOGIN_REQUIRE_PASSWORD, 'error');
        }
    }
}

function password_forgot($form, &$form_state) {

  $email = $form_state['values']['username'];
  $errors='ok';
  // Si le champ email est vide, on affiche un message d'erreur
  if (empty($email)) {
      drupal_set_message(@ERROR_FORGOT_PWD_MAIL_EMPTY, 'error_modal');
      drupal_set_message(@FORGOT_PWD_VALID, 'status');
      drupal_goto('/mot-de-passe.php');
  } else {
    $user = user_load_by_mail($email);
    if (false !== $user) {
      // envoi du mail
      _user_mail_notify('password_reset', $user);
      drupal_set_message(@FORGOT_PWD_VALID, 'status');
        drupal_goto('/mot-de-passe.php');
    }  else {
      // Si l'email n'est pas connu dans le système, on affiche un message d'erreur
      $errors = @ERROR_FORGOT_PWD_MAIL_KO;
        drupal_set_message(@ERROR_FORGOT_PWD_MAIL_KO, $type = 'error_modal');
        drupal_goto('/mot-de-passe.php');
    }
  }
}