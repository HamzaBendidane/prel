<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class list_common{

    protected $view;

    /**
     * constructeur common
     * @param $form
     */
    public function __construct($view){
        $this->view = $view;
    }

    public function display(){

        $data = $this->get_datas();

        $form = $this->get_form();

        $rows = $this->display_table_rows($data);

         $page =  theme('table',  array(
            'header' => $this->get_header(),
            'rows' => $rows,
            'quantity' => 10,
            'empty' =>  'Text empty' ,
            'sticky' => false,
        ));
        return array('page' => $page,'form'=> $form);
    }

    function get_form(){

    }

    public function get_datas(){
        return array();
    }

    public function display_table_rows($data){
        return array();
    }
    public function get_header(){
        return array();
    }

    function get_stored_date(){
        if (isset ($_SESSION[$this->view]))
            return $_SESSION[$this->view];
        else return array();
    }
    static function store_data($view,$data){
        $_SESSION[$view]= $data;
    }
}