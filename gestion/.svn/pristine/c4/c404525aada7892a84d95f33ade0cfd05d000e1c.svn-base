<?php
function creation_form_skip ($form, &$form_state)
{
    unset ($_SESSION['messages']['error']);
    if (isset($form_state['values']['refuser_creation'])) {
      drupal_goto("/gestion/etablissement/valider/entreprises/listes");
    } else {
      drupal_goto("/gestion/etablissement/entreprises/listes");
    }
}

function validation_form_skip ($form, &$form_state)
{
    unset ($_SESSION['messages']['error']);
}
/**
 *
 *  Validation du formulaire de création
 *  Hook_validate()
 *
 *  @param: $form
 *  @param: $form_state
 *
 */
function creation_form_validate($form, &$form_state) {
    // Liste des champs
    $fields_forms['siret'] = @ERR_STD_ESTABL_MANAG_SIRET;
    $fields_forms['street_name'] = @ERR_STD_ESTABL_MANAG_NAME_STREET;
    //$fields_forms['adress_complement'] = @ERR_STD_ESTABL_MANAG_COMPLEMENT_ADRESS;
    $fields_forms['city'] = @ERR_STD_ESTABL_MANAG_CITY;

    // Champs Entreprise
    $fields_forms['code_nace'] = @ERR_STD_ESTABL_MANAG_NACE;
    $fields_forms['corporate_name'] = @ERR_STD_ESTABL_MANAG_CORP_NAME;
    $fields_forms['zip_code'] = @ERR_STD_ESTABL_MANAG_ZIP;
//     $fields_forms['phone_number'] = @ERR_STD_ESTABL_MANAG_PHONE;

    // Champs Responsabele Entreprise
    $fields_forms['title']     = @ERR_STD_ESTABL_MANAG_TITLE;
    $fields_forms['firstname'] = @ERR_STD_ESTABL_MANAG_FIRTSNAME;
    $fields_forms['email'] =  @ERR_STD_ESTABL_MANAG_EMAIL;
    $fields_forms['confirm_email'] = @ERR_STD_ESTABL_MANAG_EMAIL;
    $fields_forms['lastname']  = @ERR_STD_ESTABL_MANAG_LASTNAME;
    $fields_forms['function']  = @ERR_STD_ESTABL_MANAG_FUNCTION;
  //  $fields_forms['adefim_gestion']  = @ERR_STD_ESTABL_MANAG_ADEFIM;


    // Spécific validation
    $raison_sociale = $form_state['values']['corporate_name'];
    $email  = $form_state['values']['email'];
    $confirm_email  = $form_state['values']['confirm_email'];
    $siret =  $form_state['values']['siret'];
    $oldsiret =  $form_state['values']['old_siret'];
    $data = $form_state;
    shared_validate($data, $fields_forms);  // Validation des champs
    if ($oldsiret != $siret && !$data['values']['mod_type']) {
        if (check_if_siret_exist($siret)) {
            form_set_error('siret', sprintf(t(@MSG_ERR_GES_ETA15), $raison_sociale, $siret));
        }
    }

    if($email != $confirm_email){ // Check des deux emails
        form_set_error('confirm_email', t(@ERROR_MAIL_NOT_EQUAL));
    }

    if(shared_validate_siret_number($siret) == FALSE){   // Validation d'un siret
        drupal_set_message(t(@ERROR_SIRET_NUMBER), 'error');
    }

    if (!$form_state['values']['code_nace'] || !$form_state['values']['libelle_nace']) {
      form_set_error('code_nace', t(@ERR_STD_ESTABL_MANAG_NAF));
      form_set_error('libelle_nace', '');
    }

    if (!$form_state['values']['code_filiere'] || !$form_state['values']['libelle_filiere']) {
      form_set_error('code_filiere', t(@ERR_STD_ESTABL_MANAG_FILIERE));
      form_set_error('libelle_filiere', '');
    }
}

/**
 *  Check si le siret existe en base
 */
function check_if_siret_exist($siret){
    $siret_number = shared_find_if_siret_exist($siret);

    if(!empty($siret_number)){
        return true;
    }else return false;
}