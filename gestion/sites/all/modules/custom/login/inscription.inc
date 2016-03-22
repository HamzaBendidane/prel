<?php

function opcaim_form_element($variables) {
    $element = &$variables ['element'];

    // This function is invoked as theme wrapper, but the rendered form element
    // may not necessarily have been processed by form_builder().
    $element += array(
        '#title_display' => 'before',
    );


    // Add element's #type and #name as class to aid with JS/CSS selectors.
    $attributes ['class'] = array('form-item');
    if (!empty($element ['#type'])) {
        $attributes ['class'][] = 'form-type-' . strtr($element ['#type'], '_', '-');
    }
    if (!empty($element ['#name'])) {
        $attributes ['class'][] = 'form-item-' . strtr($element ['#name'], array(' ' => '-', '_' => '-', '[' => '-', ']' => ''));
    }
    // Add a class for disabled elements to facilitate cross-browser styling.
    if (!empty($element ['#attributes']['disabled'])) {
        $attributes ['class'][] = 'form-disabled';
    }$output = '<div' . drupal_attributes($attributes) . '>' . "\n";

    // If #title is not set, we don't display any label or required marker.
    if (!isset($element ['#title'])) {
        $element ['#title_display'] = 'none';
    }
    $prefix = isset($element ['#field_prefix']) ? '<span class="field-prefix">' . $element ['#field_prefix'] . '</span> ' : '';
    $suffix = isset($element ['#field_suffix']) ? ' <span class="field-suffix">' . $element ['#field_suffix'] . '</span>' : '';

    switch ($element ['#title_display']) {
        case 'before':
        case 'invisible':
            $output .= ' ' . theme('form_element_label', $variables);
            $output .= ' ' . $prefix . $element ['#children'] . $suffix . "\n";
            break;

        case 'after':
            $output .= ' ' . $prefix . $element ['#children'] . $suffix;
            $output .= ' ' . theme('form_element_label', $variables) . "\n";
            break;

        case 'none':
        case 'attribute':
            // Output no label and no required marker, only the children.
            $output .= ' ' . $prefix . $element ['#children'] . $suffix . "\n";
            break;
    }

    if (!empty($element ['#description'])) {
        $output .= '<div class="description">' . $element ['#description'] . "</div>\n";
    }


    $errors = form_get_errors();

    if (isset($variables['element']['#name']) && $errors) {
        if ($variables['element']['#type'] !== 'radio') {
            if (array_key_exists($variables['element']['#name'], $errors)) {
                $class = null;
                if ($variables['element']['#type'] === 'radios') {
                    $class = 'messages-inline error-radios';
                } else if ($variables['element']['#type'] === 'file') {
                    $class = 'messages-inline-left';
                } else {
                    $class = 'messages-inline';
                }
                $output .= '<div class="control-label">' . $errors[$variables['element']['#name']] . '</div>';

            }
        }
    }

    $output .= "</div>\n";

    return $output;
}
function inscription_form($form, &$form_state)
{

    global $user;

    if ($user->uid) {
        $stagiaire = new db_stagiaires();
        $stagiaire = $stagiaire->get_by_fields(array('id_drupal_user' => $user->uid));
        $data = array_pop($stagiaire);
    }

    if ($data['ne_le']) {
        $date = DateTime::createFromFormat('Y-m-d', $data['ne_le']);
        $data['ne_le'] = $date->format('d/m/Y');
    }

    $form['id'] = array(
        '#type' => 'hidden',
        '#default_value' => $data['id'],
    );

    $form['civilite'] = array(
        '#type' => 'select',
        '#options' => array(1 => "Mr", 2 => "Mme"),
        '#default_value' => $data['civilite'],
        '#attributes' => array(
            'placeholder' => t('Civilité'),
            'class' => array('form-control')
        ),
    );

    $form['nom'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['nom'],
        '#attributes' => array(
            'class' => array('form-control'),
            'placeholder' => t('Nom')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['prenom'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['prenom'],
        '#attributes' => array(
            'class' => array('form-control'),
            'placeholder' => t('Prénom')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['ne_le'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['ne_le'],
        '#attributes' => array(
            'class' => array('form-control', 'dateP'),
            'placeholder' => 'jj/mm/aaaa',
            'placeholder' => t('Né(e) le'),
        ),
        '#element_validate' => array('element_shared_date_validate')
    );
    $form['ne_a'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['heure_fin_matin'],
        '#attributes' => array(
            'class' => array('form-control'),
            'placeholder' => t('Né(e) à'),
        ),
    );
    $form['adresse'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['adresse'],
        '#attributes' => array(
            'class' => array('form-control'),
            'placeholder' => t('Adresse'),
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['cp'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array(
            'class' => array('form-control'),
            'placeholder' => t('Code postal'),
        ),
        '#default_value' => $data['cp'],
        '#element_validate' => array('element_shared_code_postal'),
    );
    $form['ville'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['ville'],
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Ville'),
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['mdp'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Mot de passe'),
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['mdp_confirm'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Confirmation Mot de passe'),
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
    );

    $form['telephone'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['telephone'],
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Tél'),
        ),
        '#element_validate' => array('element_shared_telephone'),
    );
    $form['telephone2'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['telephone2'],
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Tél (2)'),
        ),
        '#element_validate' => array('element_shared_telephone'),
    );
    if (!$data['email']) {

    $form['email'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['email'],
        '#attributes' => array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('E-mail'),
        ),
        '#element_validate' => array('element_shared_not_empty_validate', 'element_shared_mail'),
        );
    }
/*
    $form['numero_permis'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['numero_permis'],
        '#attributes' =>array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('N° du permis de conduire'),
        ),
    );

    $form['date_delivrance'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['date_delivrance'],
        '#attributes' =>array(
            'placeholder' => t('jj/mm/aaaa'),
            'class' => array('form-control','dateP'),
            'placeholder' => t('Date de délivrance'),
        ),
    );

    $form['lieu_delivrance'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['lieu_delivrance'],
        '#attributes' =>array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Lieu de délivrance'),
        ),
    );

    $form['date_obtention'] = array(
        '#type' => 'textfield',
        '#title' => t(""),
        '#default_value' => $data['date_obtention'],
        '#attributes' =>array(
            'placeholder' => t('jj/mm/aaaa'),
            'class' => array('form-control','dateP'),
            'placeholder' => t('Date d\'obtention'),
        ),
        '#element_validate' => array('element_shared_date_validate')
    );

    $form['points'] = array(
        '#type' => 'textfield',
        '#title' => t(''),
        '#default_value' => $data['fax'],
        '#attributes' =>array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Nombre de points restants')
        ),
    );

    $form['souce_points'] = array(
        '#type' => 'select',
        '#title' => t(''),
        '#options' => array('Estimation stagiaire' => "Estimation stagiaire" , 'Préfécture' => "Préfécture",
            'Lettre 48' => "Lettre 48","Lettre 48M" => "Lettre 48M",'Lettre 48N' => 'Lettre 48N','Sans 48S' => 'Sans 48S'),
        '#default_value' => $data['souce_points'],
        '#attributes' =>array(
            'placeholder' => t(''),
            'class' => array('form-control'),
            'placeholder' => t('Source estimation des points'),
        ),
    );

*/

    $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Valider'),
        '#validate' => array('creation_form_validate_stage_add'),
        '#submit' => array('creation_form_submit_stage_add'),
        '#attributes' =>array(
            'placeholder' => t(''),
            'class' => array('btn-xxx')
        ),
    );



    return $form;
}
function creation_form_validate_stage_add($form, &$form_state){
    if ($form_state['values']['mdp'] != $form_state['values']['mdp_confirm']){
        form_error($form['mdp_confirm'],'Mots de passe différents : Merci de saisir le même mot de passe.', 'error');
    }
}
function creation_form_submit_stage_add($form, &$form_state){

    global $user;

    $dataStage['id_drupal_user'] = $user->uid;
    $dataStage['civilite'] = $form_state['values']['civilite'];
    $dataStage['nom_jeune_fille'] = $form_state['values']['nom_jeune_fille'];
    $dataStage['nom'] = $form_state['values']['nom'];
    $dataStage['prenom'] = $form_state['values']['prenom'];
    $dataStage['ne_le'] = covert_to_date($form_state['values']['ne_le']);
    $dataStage['ne_a'] = $form_state['values']['ne_a'];
    $dataStage['adresse'] = $form_state['values']['adresse'];
    $dataStage['cp'] = $form_state['values']['cp'];
    $dataStage['ville'] = $form_state['values']['ville'];
    $dataStage['telephone'] = $form_state['values']['telephone'];
    $dataStage['telephone2'] = $form_state['values']['telephone2'];
    if ($form_state['values']['email']){
        $dataStage['email'] = $form_state['values']['email'];
    }
    $dataStage['fax'] = $form_state['values']['fax'];
    $dataStage['numero_permis'] = $form_state['values']['numero_permis'];
    $dataStage['date_delivrance'] = covert_to_date($form_state['values']['date_delivrance']);
    $dataStage['lieu_delivrance'] = $form_state['values']['lieu_delivrance'];
    $dataStage['date_obtention'] = covert_to_date($form_state['values']['date_obtention']);
    $dataStage['points'] = $form_state['values']['points'] ? $form_state['values']['points'] : null ;
    $dataStage['souce_points'] = $form_state['values']['souce_points'];
    $dataStage['statut'] = 1;
    $dataStage['montant_paye'] = $form_state['values']['montant_paye'];
    $dataStage['moyen_paye'] = $form_state['values']['moyen_paye'];
    $dataStage['date_paiement'] = covert_to_date($form_state['values']['date_paiement']);
    $dataStage['date_inscription'] = covert_to_date(date('d/m/Y'));
    $dataStage['inscrit_par'] = $user->uid;

    $stagiaire = new db_stagiaires();


    if (!$user->uid) {
        $new_user = array(
            'name' => trim($form_state['values']['email']),
            'mail' => trim($form_state['values']['email']),
            'init' => trim($form_state['values']['email']),
            'status' => 1,
            'pass' => $form_state['values']['mdp'],
            'access' => REQUEST_TIME
        );

        // $account returns user object
        $account = user_save(null, $new_user);
        $id_drupal_user = $account->uid;
        $dataStage['id_drupal_user'] = $id_drupal_user;
        $stagiaire->insert($dataStage);
       // _user_mail_notify('register_no_approval_required', $account);
    }else $stagiaire->update($form_state['values']['id'], $dataStage);

    if ($_GET['op']){
        drupal_goto('/creation-compte.php');
    }
    else if ($_SESSION['stage']) {
        drupal_goto('/permis.php');
    }else{
        drupal_goto('/conf-inscription.php');
    }
}