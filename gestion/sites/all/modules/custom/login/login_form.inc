<?php

function login_form($form, &$form_state) {
  $form['username'] = array(
      '#type' => 'textfield',
      '#title' => t('Votre compte'),
      '#attributes' => array('class' => array('form-username')),
  );
  $form['password'] = array(
      '#type' => 'password',
      '#title' => t('Votre mot de passe'),
      '#attributes' => array('class' => array('form-password')),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );

  return $form;
}


function login_site_form($form, &$form_state) {

    $form['username'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-username'),'placeholder' => 'IDENTIFIANT'),
    );
    $form['password'] = array(
        '#type' => 'password',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-password'),'placeholder' => 'MOT DE PASSE'),
    );
    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('CONNEXION'),
        '#attributes' => array('class' => array('btn-xxx')),
        '#submit' => array('check_login_submit'),
    );

    return $form;
}

function password_form_site($form, &$form_state) {

    $form['username'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array('class' => array('form-username'),'placeholder' => 'IDENTIFIANT'),
    );

    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Valider'),
        '#attributes' => array('class' => array('btn-xxx')),
        '#submit' => array('password_forgot'),
    );

    return $form;
}
function login_password_forgot_form($form, &$form_state) {

  $form['email'] = array(
      '#type' => 'textfield',
      '#attributes' => array(
          'class' => array('form-email'),
          'placeholder' => array('Email')
      
      ),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );
  return $form;
}