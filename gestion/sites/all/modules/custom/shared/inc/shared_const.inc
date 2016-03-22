<?php

// Initialisation des variables 
$list_action_status = array(
  '0' => 'Veuillez choisir dans la liste',
  '1' => 'En cours de saisie',
  '2' => 'Transmis à l\'ADEFIM', // = transmis ou accordé dans MyOPCA
  '3' => 'En attente de pièce pour l’engagement',
  '4' => 'Accepté', // = engagé dans MyOPCA
  '5' => 'Annulé',
  '6' => 'Refusé',
  '7' => 'En attente de justificatifs pour le paiement',
  '8' => 'En cours',
  '9' => 'Soldé',
);

// Définition des constantes

// attention penser à utiliser la fonction unserialize() pour cette constante
define('LIST_STATUT_ACTION', serialize($list_action_status));
