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

function login_password_forgot_form($form, &$form_state) {
  $form['email'] = array(
      '#type' => 'textfield',
      '#title' => t('Votre email : '),
      '#attributes' => array('class' => array('form-email')),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );

  return $form;
}

function login_follow_form($form, &$form_state) {
  $form['email'] = array(
      '#type' => 'textfield',
      '#title' => t('Votre email : '),
      '#attributes' => array('class' => array('form-email')),
  );
  $form['numero_demande'] = array(
      '#type' => 'textfield',
      '#title' => t('Votre numéro de demande : '),
      '#attributes' => array('class' => array('form-numero-demande')),
  );
  $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('OK'),
      '#attributes' => array('class' => array('btn')),
  );

  return $form;
}