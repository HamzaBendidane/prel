<?php
function covert_to_date($date){
  if ($date) {
    $date = DateTime::createFromFormat('d/m/Y', $date);
    return $date->format('Y-m-d');
  }return null;
}

function covert_from_date($date){
  $date = DateTime::createFromFormat('Y-m-d', $date);
  return $date->format('d/m/Y');
}