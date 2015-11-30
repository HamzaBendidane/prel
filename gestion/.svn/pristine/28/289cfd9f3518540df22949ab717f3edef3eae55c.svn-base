<?php

function demande_db_get_temp_dgf_form_demande($id_dgf) {
  db_set_active(@DB_EXTRANET);
  $result = db_select('temp_dgf_form_demande', 'sa')
  ->fields('sa')
  ->condition('id_dgf', $id_dgf, '=')
  ->execute()
  ->fetchAssoc();

  db_set_active();

  return $result;
}

function get_demande_data_extranet($id_dgf) {
    db_set_active(@DB_EXTRANET);

    $query = "SELECT
dema.id_dgf as id_dgf, refdem.label as t_nature_demande, reffor.label as t_nature_formation,
forma.date_creation as date_creation,
forma.id_user_creation as id_user_creation,
forma.date_last_edit as date_last_edit,
forma.id_user_last_edit as id_user_last_edit,
forma.date_delete as date_delete,
forma.id_user_delete as id_user_delete,
forma.is_delete as is_delete

 FROM [temp_dgf_form_demande] dema
left join ref_nature_demande refdem on refdem.id = dema.id_dgf_nature_demande
left join ref_nature_formation reffor on reffor.id = dema.id_dgf_nature_formation
left join temp_dgf_form_formation forma on forma.id_dgf = dema.id_dgf
where dema.id_dgf = :id_dgf";

    $result = db_query($query,array(':id_dgf' => $id_dgf));

    $resultdata  = $result->fetchAssoc();
    db_set_active();

    if (!$resultdata) return array();

    return $resultdata;
}


function get_demande_data_referenciel() {

    return array();

}

function demande_convertParam($key,$data){
    
    $data = shared_format_sqlsrv_datetime_for_insertion($data);
    
    return $data;
}

function insert_demande($data)
{
    db_set_active(@DB_EXTRANET);
    $nid = db_insert('dgf_form_demande');

    $data = demande_convertParam('',$data);

    $nid->fields($data);

    $nid->execute();
    db_set_active();
}