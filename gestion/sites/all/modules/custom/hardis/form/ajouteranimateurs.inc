<?php
/**
 * Class hardis_form
 */
class ajouteranimateurs_form extends common_form {
    function get_form(){

      $db = new db_animateur($_GET['id']);
      $data = $db->get_by_id($_GET['id']);
      $data = array_pop($data);

      $form['id'] = array(
        '#type' => 'hidden',
        '#default_value' => $data['id'],
      );

      $lieu = new db_lieu();


      $form['qualite'] = array(
        '#type' => 'select',
        '#title' => t('Qualité'),
        '#options' => array('1' => "Psychologue", '2' => "BAFM/BAFCRI"),
        '#default_value' => '',
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );


      $form['nom'] = array(
        '#type' => 'textfield',
        '#title' => t('Nom'),
        '#default_value' => $data['nom'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['prenom'] = array(
        '#type' => 'textfield',
        '#title' => t('Prénom'),
        '#default_value' => $data['prenom'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['adresse'] = array(
        '#type' => 'textfield',
        '#title' => t('Adresse'),
        '#default_value' => $data['adresse'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['code_postal'] = array(
        '#type' => 'textfield',
        '#title' => t('CP'),
        '#default_value' => $data['code_postal'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['ville'] = array(
        '#type' => 'textfield',
        '#title' => t('Ville'),
        '#default_value' => $data['telephone2'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );

      $form['telephone'] = array(
        '#type'     => 'textfield',
        '#title'    => t('Téléphone'),
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#default_value' => $data['telephone'],
      );
      $form['telephone2'] = array(
        '#type' => 'textfield',
        '#title' => t('(Téléphone 2)'),
        '#default_value' => $data['telephone2'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['fax'] = array(
        '#type' => 'textfield',
        '#title' => t('Fax'),
        '#default_value' => $data['adress_complement'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['email'] = array(
        '#type' => 'textfield',
        '#title' => t('E-mail'),
        '#default_value' => $data['email'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['commentaire'] = array(
        '#type' => 'textarea',
        '#title' => t('Commentaire'),
        '#default_value' => $data['commentaire'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Suivant'),
        '#validate' => array('creation_form_validate_animateur'),
        '#submit' => array('creation_form_submit_animateur'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-info pull-right')
        ),
      );

      $form['back'] = array(
        '#type' => 'submit',
        '#value' => t('Précédent'),
        '#submit' => array(''),
        '#validate' => array('creation_form_cancel_submit_animateur'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-default')
        ),
      );

      return $form;
    }
}