<?php
class db_inscription extends hardisdbadapter{
    protected $db = '';
    protected $table = 'inscription';
    protected $id = 'id';

    function liste($type){
      $return = array();
      $all = $this->get_by_fields(array('qualite' => $type));
      foreach($all as $value){
        $return[$value['id']] = $value['nom'] . " " .$value['prenom'];
      }
      return $return;
    }
}