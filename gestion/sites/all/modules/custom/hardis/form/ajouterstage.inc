<?php
/**
 * Class hardis_form
 */
class ajouterstage_form extends common_form {
    function get_form(){

      $db = new db_stage();
      $data = $db->get_by_id($_GET['id']);

      $data = array_pop($data);

      if($data['premier_jour_stage']) {
        $date = DateTime::createFromFormat('Y-m-d', $data['premier_jour_stage']);
        $data['premier_jour_stage'] = $date->format('d/m/Y');
      }

      $form['id'] = array(
        '#type' => 'hidden',
        '#default_value' => $data['id'],
      );
      $lieu = new db_lieu();
      $form['lieu'] = array(
        '#type' => 'select',
        '#title' => t('Lieu du stage'),
        '#options' => $lieu->liste(),
        '#default_value' => $data['id_lieu'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
        $contenu  = new db_contenu();
        $form['contenu'] = array(
            '#type' => 'select',
            '#title' => t('Liaison avec la page du site'),
            '#options' => $contenu->liste(),
            '#default_value' => $data['id_contenu'],
            '#attributes' =>array(
                'placeholder' => t(''),
                'class' => array('form-control')
            ),
        );

      $anim = new db_animateur();
      $form['psy'] = array(
        '#type' => 'select',
        '#title' => t('Psychologue'),
        '#options' => $anim->liste(1),
        '#default_value' => $data['id_psy'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['bafm'] = array(
        '#type' => 'select',
        '#title' => t('BAFM/BAFCRI'),
        '#options' => $anim->liste(2),
        '#default_value' => $data['id_dafm'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );


      $form['premier_jour'] = array(
        '#type' => 'textfield',
        '#title' => t('Premier jour du stage *'),
        '#default_value' => $data['premier_jour_stage'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['tarif_reference'] = array(
        '#type' => 'textfield',
        '#title' => t('Mon tarif de référence '),
        '#default_value' => $data['tarif_reference'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_decimal_validate'),
      );
      $form['capacite'] = array(
        '#type' => 'textfield',
        '#title' => t('Capacité de la salle '),
        '#default_value' => $data['capacite_salle'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_numeric_validate','element_shared_not_empty_validate'),
      );
      $form['heure_debut_matin'] = array(
        '#type' => 'textfield',
        '#title' => t('Heure de début matinée'),
        '#default_value' => $data['heure_debut_matin'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['heure_fin_matin'] = array(
        '#type' => 'textfield',
        '#title' => t('Heure de fin matinée '),
        '#default_value' => $data['heure_fin_matin'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['heure_debut_aprem'] = array(
        '#type' => 'textfield',
        '#title' => t('Heure de début après-midi'),
        '#default_value' => $data['heure_debut_aprem'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['heure_fin_aprem'] = array(
        '#type'     => 'textfield',
        '#title'    => t('Heure de fin après-midi '),
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#default_value' => $data['heure_fin_aprem'],
      );
      $form['min_stagiaires'] = array(
        '#type' => 'textfield',
        '#title' => t('confirmé à partir de'),
        '#default_value' => $data['min_inscrit'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_numeric_validate','element_shared_not_empty_validate'),
      );

      $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Suivant'),
        '#validate' => array('creation_form_validate_stage'),
        '#submit' => array('creation_form_submit_stage'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-info pull-right')
        ),
      );

      $form['back'] = array(
        '#type' => 'submit',
        '#value' => t('Précédent'),
        '#submit' => array(''),
        '#validate' => array('creation_form_cancel_submit_stage'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-default')
        ),
      );

      return $form;
    }
}