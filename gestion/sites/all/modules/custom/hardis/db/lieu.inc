<?php
class db_lieu extends hardisdbadapter{
    protected $db = '';
    protected $table = 'lieu';
    protected $id = 'id';



    function liste(){
      $return = array();
      $all = $this->get_all();
      foreach($all as $value){
        $return[$value['id']] = $value['libelle'];
      }
      return $return;
    }


}