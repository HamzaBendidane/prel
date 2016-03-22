<?php
/**
 * Class hardis_form
 */
class voirstage_form extends common_form {
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

      $form['civilite'] = array(
        '#type' => 'select',
        '#title' => t('Civilité'),
        '#options' => array(1 => "Mr" , 2 => "Mme"),
        '#default_value' => $data['civilite'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );


      $form['nom_jeune_fille'] = array(
        '#type' => 'textfield',
        '#title' => t('Nom de jeune fille'),
        '#default_value' => $data['nom_jeune_fille'],
        '#attributes' =>array(
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
        '#title' => t('Prénom '),
        '#default_value' => $data['prenom'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );
      $form['ne_le'] = array(
        '#type' => 'textfield',
        '#title' => t('Né(e) le'),
        '#default_value' => $data['ne_le'],
        '#attributes' =>array(
          'class' => array('form-control','dateP'),
          'placeholder' => 'jj/mm/aaaa'
        ),
      );
      $form['ne_a'] = array(
        '#type' => 'textfield',
        '#title' => t('Né(e) à'),
        '#default_value' => $data['heure_fin_matin'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['adresse'] = array(
        '#type' => 'textfield',
        '#title' => t('Adresse'),
        '#default_value' => $data['adresse'],
        '#attributes' =>array(
          'class' => array('form-control')
        ),
      );
      $form['cp'] = array(
        '#type'     => 'textfield',
        '#title'    => t('Code postal'),
        '#attributes' =>array(
          'class' => array('form-control')
        ),
        '#default_value' => $data['cp'],
      );
      $form['ville'] = array(
        '#type' => 'textfield',
        '#title' => t('Ville'),
        '#default_value' => $data['ville'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['telephone'] = array(
        '#type' => 'textfield',
        '#title' => t('Tél'),
        '#default_value' => $data['telephone'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['telephone2'] = array(
        '#type' => 'textfield',
        '#title' => t('Tél (2)'),
        '#default_value' => $data['telephone2'],
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
      $form['fax'] = array(
        '#type' => 'textfield',
        '#title' => t('Fax'),
        '#default_value' => $data['fax'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['numero_permis'] = array(
        '#type' => 'textfield',
        '#title' => t('N° du permis de conduire'),
        '#default_value' => $data['numero_permis'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['date_delivrance'] = array(
        '#type' => 'textfield',
        '#title' => t('Date de délivrance'),
        '#default_value' => $data['date_delivrance'],
        '#attributes' =>array(
          'placeholder' => t('jj/mm/aaaa'),
          'class' => array('form-control','dateP')
        ),
      );

      $form['lieu_delivrance'] = array(
        '#type' => 'textfield',
        '#title' => t('Lieu de délivrance'),
        '#default_value' => $data['lieu_delivrance'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['date_obtention'] = array(
        '#type' => 'textfield',
        '#title' => t("Date d'obtention"),
        '#default_value' => $data['date_obtention'],
        '#attributes' =>array(
          'placeholder' => t('jj/mm/aaaa'),
          'class' => array('form-control','dateP')
        ),
      );

      $form['points'] = array(
        '#type' => 'textfield',
        '#title' => t('Nombre de points restants'),
        '#default_value' => $data['fax'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['souce_points'] = array(
        '#type' => 'select',
        '#title' => t('Source estimation des points'),
        '#options' => array('Estimation stagiaire' => "Estimation stagiaire" , 'Préfécture' => "Préfécture",
                                      'Lettre 48' => "Lettre 48","Lettre 48M" => "Lettre 48M",'Lettre 48N' => 'Lettre 48N','Sans 48S' => 'Sans 48S'),
        '#default_value' => $data['souce_points'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );


      $form['statut'] = array(
        '#type' => 'select',
        '#title' => t('Statut'),
        '#options' => array('1' => "En attente d’inscription" , '2' => "Pré-inscrit",
          '3' => "Confirmé"),
        '#default_value' => $data['statut'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['date_paiement'] = array(
        '#type' => 'textfield',
        '#title' => t('Date du paiement'),
        '#default_value' => $data['date_paiement'],
        '#attributes' =>array(
          'placeholder' => t('jj/mm/aaaa'),
          'class' => array('form-control','dateP')
        ),
      );

      $form['montant_paye'] = array(
        '#type' => 'textfield',
        '#title' => t('Montant payé'),
        '#default_value' => $data['textfield'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['moyen_paye'] = array(
        '#type' => 'textfield',
        '#title' => t('Moyen du paiement'),
        '#default_value' => $data['moyen_paye'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
        '#element_validate' => array('element_shared_not_empty_validate'),
      );

      $form['moyen_paye'] = array(
        '#type' => 'select',
        '#title' => t('Moyen du paiement'),
        '#options' => array('CB' => "CB" , 'CHEQUE' => "Cheque",
          'ESPECE' => "Espece"),
        '#default_value' => $data['moyen_paye'],
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );
      $form['back'] = array(
        '#type' => 'submit',
        '#value' => t('Précédent'),
        '#submit' => array(''),
        '#validate' => array('creation_form_cancel_stage_add'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-default')
        ),
      );
      $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Enregistrer'),
        '#validate' => array('creation_form_validate_stage_add'),
        '#submit' => array('creation_form_submit_stage_add'),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-info pull-right')
        ),
      );
      return $form;
    }
}
