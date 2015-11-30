<?php

// Fonctions liées à contrat pro
/**
 *  Renvoie URI du CERFA
 * 
 */
function shared_get_uri_cerfa($siret, $num_demande) {
  $name = 'cerfa_' . $siret . '-'. $num_demande . '.pdf';
  $path_uri = 'opcaim/demande/cerfa/' . $name;
  return $path_uri;
  //$filename = $_SERVER['DOCUMENT_ROOT'].'sites/default/files/' . $path_uri;
}
