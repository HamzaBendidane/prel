<?php
/**
 * Class hardis_form
 */
class ajouterlieu_form extends common_form {
  function get_form(){

    $db = new db_lieu();
    $data = $db->get_by_id($_GET['id']);
    $data = array_pop($data);


    $form['id'] = array(
      '#type' => 'hidden',
      '#default_value' => $data['id'],
    );

    $form['libelle'] = array(
      '#type' => 'textfield',
      '#title' => t('Libellé'),
      '#attributes' =>array(
        'placeholder' => t('ex: Hôtel IBIS, Centre de formation'),
        'class' => array('form-control')
      ),
      '#element_validate' => array('element_shared_not_empty_validate'),
      '#default_value' => $data['libelle'],

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
    $form['email'] = array(
      '#type' => 'textfield',
      '#title' => t('Email'),
      '#default_value' => $data['email'],
      '#attributes' =>array(
        'class' => array('form-control')
      ),
      '#element_validate' => array('element_shared_mail'),
    );
    $form['telephone'] = array(
      '#type' => 'textfield',
      '#title' => t('Téléphone'),
      '#default_value' => $data['telephone'],
      '#attributes' =>array(
        'class' => array('form-control')
      ),
      '#element_validate' => array('element_shared_telephone'),
    );
    $form['telephone2'] = array(
      '#type' => 'textfield',
      '#title' => t('Téléphone secondaire	'),
      '#default_value' => $data['telephone2'],
      '#attributes' =>array(
        'class' => array('form-control')
      ),
    );
    $form['fax'] = array(
      '#type' => 'textfield',
      '#title' => t('Confirmation courriel'),
      '#default_value' => '',
      '#attributes' =>array(
        'class' => array('form-control')
      ),
    );
    $form['adresse'] = array(
      '#type'     => 'textfield',
      '#title'    => t('Adresse'),
      '#attributes' =>array(
        'class' => array('form-control')
      ),
      '#default_value' => $data['adresse'],
      '#element_validate' => array('element_shared_not_empty_validate'),
    );
    $form['adress_complement'] = array(
      '#type' => 'textfield',
      '#title' => t('Complément rue'),
      '#default_value' => $data['adress_complement'],
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
    );

    $form['code_postal'] = array(
      '#type'     => 'textfield',
      '#title'    => t('Code postal'),
      '#default_value' => $data['code_postal'],
      '#element_validate' => array('element_shared_code_postal'),
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
    );
    $form['ville'] = array(
      '#type'     => 'textfield',
      '#title'    => t('Ville'),
      '#default_value' => $data['ville'],
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
      '#element_validate' => array('element_shared_not_empty_validate'),
    );

    $form['moyen_transport'] = array(
      '#type' => 'textfield',
      '#title' => t('Moyen de transport'),
      '#default_value' => $data['informations_complement'],
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
    );

    $form['numero_agrement'] = array(
      '#type' => 'textfield',
      '#title' => t('Numéro d′agrement'),
      '#default_value' => $data['numero_agrement'],
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
    );

    $form['nom_agrement'] = array(
      '#type' => 'textfield',
      '#title' => t('Nom d′agrement'),
      '#default_value' => $data['nom_agrement'],
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('form-control')
      ),
    );

    $form['hardis'] = $this->get_element_form_hardis($data[0]['date_creation']);

    $form['submit'] = array(
      '#type' => 'submit',
      '#value' => t('Suivant'),
      '#validate' => array('creation_form_validate_lieux'),
      '#submit' => array('creation_form_submit_lieux'),
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('btn btn-info pull-right')
      ),
    );

    $form['back'] = array(
      '#type' => 'submit',
      '#value' => t('Précédent'),
      '#submit' => array(''),
      '#validate' => array('creation_form_cancel_submit_lieux'),
      '#attributes' =>array(
        'placeholder' => t(''),
        'class' => array('btn btn-default')
      ),
    );


    return $form;
  }

  /**
   * exemple submit form
   * @return string
   */
  protected function get_form_submit(){
    return 'toto';
  }

}