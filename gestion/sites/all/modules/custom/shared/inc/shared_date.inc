<?php

function shared_parse_mssql_datetime($dateToTransform) {
  $tab = explode('.', trim($dateToTransform));
  $date = \DateTime::createFromFormat('Y-m-d H:i:s', $tab[0]);
  return $date;
}

function shared_parse_mssql_date($dateToTransform) {
  $date = \DateTime::createFromFormat('Y-m-d', trim($dateToTransform));
  return $date;
}

// Transforme une date au format attendu par SQL SERVER
// Format SQL SERVER 2015-04-10 00:00:00.000
function shared_sqlsrv_date($dateToTransform) {
  $date = \DateTime::createFromFormat('Y-m-d H:i:s.000', $dateToTransform);
  return $date;
}

function shared_send_to_mssql_date($dateFr = null, $type = 'date') {
  if ($dateFr == null) {
    $dateFr = date('d/m/Y');
  }
  $oDate = \DateTime::createFromFormat('d/m/Y', $dateFr);
  if ($type == 'datetimeoffset') {
    return $oDate->format('Y-m-d\T00:00:00.0000000\+00:00');
  } else if ($type == 'datetime') {
    return $oDate->format('Y-m-d\TH:i:s');
  } else if ($type == 'date') {
    return $oDate->format('Y-m-d');
  }
  return $dateFr;
}

function shared_check_date_contrat_formation($dateStart,$dateEnd){

    if (!$dateStart || !$dateEnd) return true;

    $datetime1 =  DateTime::createFromFormat('d/m/Y', $dateStart) ;
    $datetime2 =  DateTime::createFromFormat('d/m/Y', $dateEnd);

    if (!$datetime1 || !$datetime2) return false;

    $datetime1->add(new DateInterval('P6M'));

    if ($datetime1 > $datetime2) {
        return false;
    }

    $datetime1 =  DateTime::createFromFormat('d/m/Y', $dateStart) ;
    $datetime1->add(new DateInterval('P24M'));

    if ($datetime1 < $datetime2) {
        return false;
    }
    return true;
}

/**
 * Transforme datetime sql server de Y-m-d H:i:s.000 à Y-m-dTH:i:s
 * pour l'insertion
 * @author RME
 * @param array $data
 * @return string
 */
function shared_format_sqlsrv_datetime_for_insertion(array $data) {

    if(isset($data['date_creation']) && !is_null($data['date_creation'])) {
        $date_creation = shared_sqlsrv_date($data['date_creation']);
        $data['date_creation'] = $date_creation->format('Y-m-d\TH:i:s');
    }

    if(isset($data['date_last_edit']) && !is_null($data['date_last_edit'])) {
        $date_edit = shared_sqlsrv_date($data['date_last_edit']);
        $data['date_last_edit'] = $date_edit->format('Y-m-d\TH:i:s');
    }

    if(isset($data['date_delete']) && !is_null($data['date_delete'])) {
      $date_edit = shared_sqlsrv_date($data['date_delete']);
      $data['date_delete'] = $date_edit->format('Y-m-d\TH:i:s');
    }

    return $data;
}

/**
 * calcule l'âge en fonction de la date donnée
 *
 *
 * @param DateTime $birth_date
 * @return int $age
 */
function shared_calculate_age_from_datetime($birth_date) {
  $date_now = new DateTime();
  $birth_date = new DateTime($birth_date);
  $age = $date_now->diff($birth_date);

  return $age;
}