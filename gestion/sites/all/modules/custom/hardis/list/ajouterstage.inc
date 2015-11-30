<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class ajouterstage_hardis extends list_common{

    public function get_datas(){
        return $data = array(array('test1' => '1','test2' => '2' ,'test3' => '3','action' => ''));
    }

    public function display_table_rows($data){
        foreach ($data as $key => $items) {

            $aAction = array();

            $aAction[] = l(
                '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>',
                'update url',
                array(
                    'html' => true,
                    'attributes' => array('class' => array('action'))
                )
            );

            $aAction[] = l(
                '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>',
                'delete url' ,
                array(
                    'html' => true,
                    'attributes' => array(
                        'class' => array('action delete'),
                        'data-id' => 'data',
                        'data-nom' => 'data'
                    )
                )
            );
            $aAction[] = l(
                '<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>',
                'voir',
                array(
                    'html' => true,
                    'attributes' => array('class' => array('action'))
                )
            );
            $action_html = '<div class="center">' . implode(" ",$aAction). '</div>';
            $items['action'] = $action_html;
            $aReturn[] = $items;
         }
        return $aReturn;
    }
    public function get_header(){
        return array('test2','test2','test2','');
    }
    function get_form(){
        return common_view('form','hardis');
    }
}