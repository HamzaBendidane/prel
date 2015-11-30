<?php

/**
 *  Validation d'un numéro de siret selon algorithme de calculs
 */
function shared_validate_siret_number($siret) {
  //longueur de la chaine $num
  $length = strlen($siret);

  //resultat de l'addition de tous les chiffres
  $total = 0;
  for ($i = $length-1 ; $i >= 0 ; $i--) {
    $digit = substr($siret, $i, 1);

    if ((($length - $i) % 2) == 0) {
      $digit = $digit * 2;
      if ($digit > 9) {
        $digit = $digit - 9;
      }
    }

    $total += $digit;
  }

  if (($total % 10) == 0) {
    return true;
  } else {
    return false;
  }
}

/**
 *  Renvoie les Adefims de plusieurs Sirets
 *  @param: $sirets - Les sirets en tableaux
 *  @return: Les ADEFIM correspondant à chaque siret
 *
 */
function shared_get_adefim_from_multiple_siret($sirets) {

  $adefims = array(); // Tableau de résultats contenants les ADEFIMS

  foreach ($sirets as $value) {
      $adefims[$value] = get_adefim_from_siret($value);
  }
  return $adefims;
}