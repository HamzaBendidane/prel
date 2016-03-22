<?php
class hardisdbadapter{

    protected $db;
    protected $table;
    protected $id;

    public function __construct(){

    }
    /**
     * @param $db DB_SLAVE
     * @param $procedureName the name of the procedure
     * @param $procedureData the procedure DATA
     * @return mixed The return id
     * @throws Exception
     */
    function shared_execute_procedure($procedureName,$procedureData){
        db_set_active($this->db);
        if ( !is_array($procedureData) ) throw new Exception("NO DATA TO BOUND FOR PROCEDURE ".$procedureName);
        foreach ($procedureData as $key => $value){
            switch (gettype($value)) {
                case "boolean":
                case "integer":
                    $svalue = $value;
                    break;
                case "string":
                    $svalue = "'" . $value . "'";
                    break;
                case "NULL":
                    $svalue = 'NULL';
                    break;
            }

            $sQuery[] = "@" . $key . " = " . $svalue;
            $aQuery[] = "@" . $key . " = :" . $key;
            $aValue[":".$key] = $value;
        }

        $query = 'EXEC ' . $procedureName . ' ' . implode(',',$aQuery) . ";";

        try{

            $result = db_query($query,$aValue);

            try {
                $id = $result->fetchField();
            }catch (Exception $e){
                $id = null;
            }

        }
        catch(Exception $e){

            $query = 'EXEC ' . $procedureName . ' ' . implode(',',$sQuery) . ";";
            throw new Exception("#####".$query ."####### || ".$e->getMessage(), 1);
        }

        db_set_active();
        return $id;
    }

    static function process_query($query,$fields){

        $query = str_replace("{","",$query);
        $query = str_replace("}","",$query);
        foreach($fields as $key => $value){
            switch (gettype($value)) {
                case "boolean":
                case "integer":
                    $svalue = $value;
                    break;
                case "string":
                    $svalue = "'" . $value . "'";
                    break;
                case "NULL":
                    $svalue = 'NULL';
                    break;
            }
            $query = str_replace($key,$svalue,$query);
        }
        return $query;
    }

    private function run($query,$fetch=false){
        $msc = microtime(true);
        $exec = $query->execute();

        if ($fetch) {
            $results = $exec->fetchAll(PDO::FETCH_ASSOC);
        }else $results = $exec;

        if (@ENV == 'dev') {
            $msc = microtime(true) - $msc;
            $msc = $msc * 1000;
            $color = '';
            if ($msc > 500) {
                $color = 'red';

            } else if ($msc > 100) $color = 'orange';
            $_SESSION['DEVQUERIESTIME'] += $msc;
            $_SESSION['DEVQUERIES'][] = '<span class = \'' . $color . '\'>' . $this->process_query($query, $query->arguments()) . ' (' . ($msc) . ' ms)</span>';;
        }
        return $results;
    }

    public function get_by_fields($aSearch,$fields= array()) {
        db_set_active($this->db);
        $query = db_select($this->table, 'v')
            ->fields('v', $fields );


        foreach ($aSearch as $key => $value) {
            $query->condition($key, $value, '=');
        }

        $results = $this->run($query,true);

        db_set_active();
        return $results;
    }

  public function get_all() {
    db_set_active($this->db);
    $query = db_select($this->table, 'v')
      ->fields('v', array() );

    $results = $this->run($query,true);

    db_set_active();
    return $results;
  }

    public function get_by_id($value,$fields=array()){
        return $this->get_by_fields(array($this->id => $value),$fields);
    }

    public function insert($insertData) {
        db_set_active($this->db);
        $nid = db_insert($this->table);
        $nid->fields($insertData);
        return $nid->execute();
        db_set_active();
    }

    public function update($id,$insertData) {
        db_set_active($this->db);
        $nid = db_update($this->table);
        $nid->fields($insertData);
        $nid->condition($this->id, $id, '=' );
        return $nid->execute();
        db_set_active();
    }

    public function delete($id) {
      db_set_active($this->db);
      $nid = db_delete($this->table);
      $nid->condition($this->id, $id, '=' );
      return $nid->execute();
      db_set_active();
    }
    public function __destruct(){
        db_set_active();
    }
}