<?php
/**
 * Class hardis_form
 */
class ajouterlieu_form extends common_form {
    function get_form(){

        $db = new db_stagiaires();
        $data = $db->get_by_id(1);


        $form['libelle'] = array(
            '#type' => 'textfield',
            '#title' => t('Libellé'),
            '#attributes' =>array(
                'placeholder' => t('ex: Hôtel IBIS, Centre de formation'),
             ),
        );
        $form['nom'] = array(
            '#type' => 'textfield',
            '#title' => t('Nom'),
            '#default_value' => '',
        );
        $form['prenom'] = array(
            '#type' => 'textfield',
            '#title' => t('Prénom'),
            '#default_value' => '',

        );
        $for['email'] = array(
            '#type' => 'textfield',
            '#title' => t('Email'),
            '#default_value' => '',
        );
        $form['telephone'] = array(
            '#type' => 'textfield',
            '#title' => t('Téléphone'),
            '#default_value' => '',
        );
        $form['telephone2'] = array(
            '#type' => 'textfield',
            '#title' => t('Téléphone secondaire	'),
            '#default_value' => '',
        );
        $form['fax'] = array(
            '#type' => 'textfield',
            '#title' => t('Confirmation courriel'),
            '#default_value' => '',
        );


        $form['back'] = array(
            '#type' => 'submit',
            '#value' => t('Précédent'),
            '#submit' => array('creation_form_cancel_submit'),
            '#validate' => array('creation_form_skip'),
        );

        $form['submit'] = array(
            '#type' => 'submit',
            '#value' => t('Ajouter'),
            '#submit' => array('creation_form_submit'),
            '#validate' => array('creation_form_validate'),
        );


        $form['adresse'] = array(
            '#type'     => 'textfield',
            '#title'    => t('Adresse'),
            '#attributes' =>array(
                'placeholder' => t(''),
            ),
            '#default_value' => '',
        );
        $form['adress_complement'] = array(
            '#type' => 'textfield',
            '#title' => t('Complément rue'),
            '#default_value' => '',
        );

        $form['code_postal'] = array(
            '#type'     => 'textfield',
            '#title'    => t('Code postal'),
            '#element_validate' => array('element_shared_code_postal'),
        );
        $form['ville'] = array(
            '#type'     => 'textfield',
            '#title'    => t('Ville'),
            '#default_value' => '',
        );

        $form['moyen_transport'] = array(
            '#type' => 'textfield',
            '#title' => t('Moyen de transport'),
            '#default_value' => '',
        );

        $form['numero_agrement'] = array(
            '#type' => 'textfield',
            '#title' => t('Numéro d′agrement'),
            '#default_value' => '',
        );

        $form['nom_agrement'] = array(
            '#type' => 'textfield',
            '#title' => t('Nom d′agrement'),
            '#default_value' => '',
        );

        $form['hardis'] = $this->get_element_form_hardis($data[0]['date_creation']);

        $form['submit'] = array(
            '#type' => 'submit',
            '#value' => t('Suivant'),
            '#validate' => array($this->get_form_validate()),
            '#submit' => array($this->get_form_submit()),
        );

        return $form;
    }
}