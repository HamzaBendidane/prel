<?php

function administration_utilisateurs_liste_filtre_form_submit($form, &$form_state) {
  $op = $form_state['values']['op'];
  switch ($op) {
    case t('Rechercher'):
      foreach ($form_state['values'] as $key => $value) {
        if ($value != '') {
          $_SESSION['administration_utilisateurs_filter'][$key] = $value;
        } else if ($key == 'statut' && isset($_SESSION['administration_utilisateurs_filter']['statut'])) {
          unset($_SESSION['administration_utilisateurs_filter']['statut']);
        } else {
          unset($_SESSION['administration_utilisateurs_filter'][$key]);
        }
      }
      break;
    case t('Réinitialiser'):
      $_SESSION['administration_utilisateurs_filter'] = array();
      break;
  }
  return 'opcaim-admin/utilisateurs';
}