<?php

/**
 * Submit for the trainee step
 *
 * @param type $form
 * @param type $form_state
 */
function dgf_contrat_pro_stagiaire_form_submit($form, &$form_state) {

    try {
        if ($form_state['values']['id_dgf'] === '') {
            // On enregistre (INSERT) dans la table dgf et on récupère l'id
            $id_dgf = stagiaire_db_insert_dgf($form_state);

            if (isset($_SESSION['demande'])) {
                // On enregistre (INSERT) dans la table lien_dgf_ref_esclave_entreprise et on récupère l'id
                $id_temp_dgf_form_demande = stagiaire_db_insert_temp_dgf_form_demande($id_dgf, $_SESSION['demande']['nature_demande'],
                    $_SESSION['demande']['nature_formation']);
                unset($_SESSION['demande']);
            }

            // On enregistre (INSERT) dans la table lien_dgf_ref_esclave_entreprise et on récupère l'id
            $id_lien_dgf_ref_esclave_entreprise = stagiaire_db_insert_lien_dgf_ref_esclave_entreprise($form_state, $id_dgf);

            // On insert dans la table referentiel salarié par la procédure stockée
            $id_ref_esclave_salarie = stagiaire_db_sp_sauver_salarie($form_state);

            // Traitement des données du formulaire avant l'insertion dans la base
            $id_temp_dgf_form_salarie = stagiaire_db_insert_temp_dgf_form_salarie($form_state, $id_dgf, $id_ref_esclave_salarie);
        } else {
            $id_dgf = $form_state['values']['id_dgf'];

            // On enregistre (UPDATE) dans la table dgf
            stagiaire_db_update_dgf($id_dgf);

            // On enregistre (UPDATE) dans la table lien_dgf_ref_esclave_entreprise et on récupère l'id
            stagiaire_db_update_lien_dgf_ref_esclave_entreprise($form_state, $id_dgf);

            // On insert dans la table referentiel salarié par la procédure stockée
            $id_ref_esclave_salarie = stagiaire_db_sp_sauver_salarie($form_state);

            // On met à jour la table temp_dgf_form_salarie
            stagiaire_db_update_temp_dgf_form_salarie($form_state, $id_dgf, $id_ref_esclave_salarie);
        }
    }catch (Exception $e){

        db_set_active();
        drupal_set_message("TEXTE à définir sur l'unicité des stagiaires . <br />".$e->getMessage());
        drupal_goto($_SERVER['HTTP_REFERER']);
    }

  // On redirige l'utilisateur vers le bon écran
  if ($form_state['triggering_element']['#id'] == 'edit-modal-save'){
    drupal_goto('/dashboard');
  } else if ($form_state['triggering_element']['#value'] == 'Suivant') {
    drupal_goto('/dgf/demande/contrat/'.$id_dgf);
    $url = '/dgf/demande/contrat/';
  }
}