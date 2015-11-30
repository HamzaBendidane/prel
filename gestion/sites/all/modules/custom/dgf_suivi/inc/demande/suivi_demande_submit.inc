<?php

function dgf_suivi_demande_list_filter_form_submit($form, &$form_state) {
  // L'index op est un index auto-généré par drupal
  $op = $form_state['values']['op'];
  switch ($op) {
    case t('Rechercher'):
      // Dans le cas d'un filtre on boucle sur le form_state et vérifie si chaque champ a été saisi
      foreach ($form_state['values'] as $key => $value) {
        if ($value != '') {
          $_SESSION['suivi_demande_filter'][$key] = $value;
        } else {// Sinon (et pour les select) on les réinitialise à 0
          unset($_SESSION['suivi_demande_filter'][$key]);
          if ($key == 'action_nature' && isset($_SESSION['suivi_demande_filter']['action_nature'])) {
            unset($_SESSION['suivi_demande_filter']['action_nature']);
          }
          if ($key == 'statut' && isset($_SESSION['suivi_demande_filter']['statut'])) {
            unset($_SESSION['suivi_demande_filter']['statut']);
          }
          if ($key == 'etablishment' && isset($_SESSION['suivi_demande_filter']['etablishment'])) {
            unset($_SESSION['suivi_demande_filter']['etablishment']);
          }
        }
      }
      break;
      // Si l'utilisateur clique sur réinitialiser on vide la session correspondante
    case t('Réinitialiser'):
      $_SESSION['suivi_demande_filter'] = array();
      break;
  }

  return 'suivi/demande';
}

function reset_form_validate ($form, &$form_state)
{
    $_SESSION['suivi_demande_filter'] = array();
}