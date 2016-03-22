<?php
/**
 * Class hardis_form
 */
class ajoutercontenu_form extends common_form {
    function get_form(){

      $db = new db_contenu($_GET['id']);
      $data = $db->get_by_id($_GET['id']);
      $data = array_pop($data);

      $form['id'] = array(
        '#type' => 'hidden',
        '#default_value' => $data['id'],
      );

      $lieu = new db_contenu();


      $form['type'] = array(
        '#type' => 'select',
        '#title' => t('Type'),
        '#options' => array('1' => "Stage", '2' => "Permis"),
        '#default_value' => $data['type'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['visible'] = array(
        '#type' => 'select',
        '#title' => t('Visible ?'),
        '#options' => array('1' => "oui", '0' => "non"),
        '#default_value' => $data['visible'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['titre'] = array(
        '#type' => 'textfield',
        '#title' => t('Titre'),
        '#default_value' => $data['titre'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['bloc_g'] = array(
        '#type' => 'textarea',
        '#title' => t('Bloc de haut'),
        '#default_value' => $data['bloc_g'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['bloc_c'] = array(
        '#type' => 'textarea',
        '#title' => t('Bloc de milieu'),
        '#default_value' => $data['bloc_c'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['bloc_d'] = array(
        '#type' => 'textarea',
        '#title' => t('PLANNING DES HORRAIRES DE CONDUITE'),
        '#default_value' => $data['bloc_d'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
    $form['bloc_m'] = array(
        '#type' => 'textarea',
        '#title' => t('MODALITES DE PAYEMENT'),
        '#default_value' => $data['bloc_m'],
        '#attributes' =>array(
            'class' => array('form-control')
        ),
    );
      $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Suivant'),
        '#validate' => array('creation_form_validate_contenu'),
        '#submit' => array('creation_form_submit_contenu'),
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