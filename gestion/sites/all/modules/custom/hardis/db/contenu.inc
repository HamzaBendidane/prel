<?php
class db_contenu extends hardisdbadapter{
    protected $db = '';
    protected $table = 'contenu';
    protected $id = 'id';

    function liste(){
        $return = array();
        $all = $this->get_all();
        foreach($all as $value){
            $return[$value['id']] = $value['titre'];
        }
        return $return;
    }

}