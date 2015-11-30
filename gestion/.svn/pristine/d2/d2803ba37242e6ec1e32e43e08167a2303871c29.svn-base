<?php
/**
 * 
 * @param int $id_dgf
 * @param string $url
 * @return Ambigous <UpdateQuery, UpdateQuery>
 */
function save_step_dgf_url($id_dgf, $url) {
  db_set_active(@DB_EXTRANET);
  $query = db_update('dgf')->fields('t', array('etape_demande' => $url));
  $query->condition('id', $id_dgf, '=');
  $query->execute();
  db_set_active();
  return $query; 
}