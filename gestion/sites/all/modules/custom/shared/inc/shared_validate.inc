<?php

/**
 *  Validation des champs formulaires
 *  Tableau de champs:
 *  @param:  $fields_form : index - message d'erreur
 *
 */
function shared_validate($data, $fields_forms){
  foreach ($fields_forms as $field => $message) {
    if (!$data['values'][$field]) { // Ou !isset
      form_set_error($field, t($message));
    }
  }
}

/**
 *  Validation d'un champ spécifique du formulaire
 *
 */
function shared_validate_specific($form, &$form_sate, $field, $message = '', $condition ='' ){
  if (isset($message) || isset($condition)){
      if ($condition) {
        form_set_error($field, t($message));
      }
  }
}

function shared_validate_date($date, $format = 'd/m/Y') {
  $d = DateTime::createFromFormat($format, $date );
  return $d && $d->format($format ) == $date;
}


function element_shared_date_validate($element, &$form_state){
    $value = $element ['#value'];
    $aDate = explode("/",$value);
    if ($value && (count($aDate)!= 3 || !checkdate($aDate[1], $aDate[0], $aDate[2]))) {
        form_error($element, t('@name doit être une date.', array('@name' => $element['#attributes']['placeholder'])));
    }
}

function element_shared_nom_validate($element, &$form_state){
    $value = $element ['#value'];
//     $reg = "/^([A-Za-z \-]+(\'|&#0*39; )*)*$/";
    $reg = "/^([a-zA-ZÀ-ÿ\s\'-])*$/";
    if (!preg_match($reg,$value)) {
        form_set_error($element['#name'], t('Le champ @name ne peut contenir que des lettres.', array('@name' => $element ['#title'])));
    }
}

function element_shared_password_validate($element, &$form_state) {
  $value = $element ['#value']['pass1'];
  $reg = '^\S*(?=\S{8,})(?=\S*[\W])(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*^';
  if (!preg_match($reg, $value)) {
    form_error($element, t('Votre mot de passe n\'est pas conforme, il faut qu\'il soit composé de 8 caractères minimum
        dont au moins une lettre majuscule, une lettre miniscule, un chiffre et un caractère spécial'));
  }
}

/**
 * @author RME
 * Valider que le champ n'est pas vide
 * @param unknown $element
 * @param unknown $form_state
 */
function element_shared_not_empty_validate($element, &$form_state){
    $value = $element ['#value'];
    if ($value == '') {
        form_error($element, t('Le champ @name est obligatoire.', array('@name' => $element['#attributes']['placeholder'])));
    }
}

/**
 * @author RME
 * Valider que le champ n'est pas vide
 * @param unknown $element
 * @param unknown $form_state
 */
function element_shared_decimal_validate($element, &$form_state){
    $value = $element ['#value'] = str_replace(",",".",$element ['#value']);

    if ( !empty($value) && !is_numeric($value) ) {
        form_error($element, t('Le champ @name doit être un nombre décimal valide.', array('@name' => $element ['#title'])));
    }
}

/**
 * @author RME
 * Valider que le champ est numérique positif
 * @param unknown $element
 * @param array $form_state
 */
function element_shared_not_numeric_validate($element, &$form_state){
  $value = $element['#value'];
  if ($value && (intval($value) < 0 || !is_numeric($value))) {
    form_error($element, t('Le champ @name doit comprendre une valeur numéraire positive', array('@name' => $element ['#title'])));
  }
}

/**
 * @author HBEN
 * Valider que le champ n'est pas vide
 * @param unknown $element
 * @param unknown $form_state
 */
function element_shared_code_postal($element, &$form_state){

    $value = $element ['#value'];
    if (!preg_match('/^(BP)?[0-9]{5,5}$/', $value)) {
        form_error($element, t('Le code postal doit être composé ainsi : 75001 ou BP90123. '));
    }

}

/**
 * @author HBEN
 * Valider que le champ n'est pas vide
 * @param unknown $element
 * @param unknown $form_state
 */
function element_shared_telephone($element, &$form_state){

    $value = $element ['#value'];
    if ($value && !preg_match('/^0[1-68][0-9]{8}$/', $value)) {
        form_error($element, t('Le champ téléphone doit être un nombre valide.'));
    }

}
/**
 * @author HBEN
 * Valider que le champ n'est pas vide
 * @param unknown $element
 * @param unknown $form_state
 */
function element_shared_mail($element, &$form_state){
  $value = $element ['#value'];
  if (!valid_email_address($value )) {
      form_error($element, t('Le champ Email doit être un nombre valide.'));
  }else{
      $user = user_load_by_mail($value);
      if ($user->uid ){
          form_error($element, t('Cet E-mail est  déjà associées à un compte client Merci de vous connecter. Mot de passe oublié ?'));
      }
  }

}
