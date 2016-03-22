<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class list_contenu extends list_common{

    public function get_datas(){
      $lieu = new db_contenu();
      $all = $lieu->get_by_fields(array('type' => $_GET['t']));
      $data = array();
      $tab = array('1' => "Stage", '2' => "Permis");

      foreach($all as $value){
      if ($value['visible']){
        $statut = '<span class="label label-success">Visible</span>';
      }else $statut = '<span class="label label-danger">Non visible</span>';
        $data[] = array('test1' => $value['titre'],'test2' => $tab[$value['type']], 'test3' => $statut ,'action' => '','id'=> $value['id']);
      }
      return $data;
    }

    public function display_table_rows($data){
        foreach ($data as $key => $items) {

            $aAction = array();
            $id = $items['id'];
            unset($items['id']);
            $aAction[] = l(
                '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>',
                '/ajoutercontenu',
                array(
                    'html' => true,
                    'attributes' => array('class' => array('action')),
                  'query' => array('id' => $id)
                )

            );

            $aAction[] = l(
                '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>',
                'delstage',
                array(
                    'html' => true,
                    'attributes' => array(
                        'class' => array('action delete'),
                        'data-id' => 'data',
                        'data-nom' => 'data'
                    ),
                  'query' => array('id' => $id)
                )
            );
            $action_html = '<div class="center">' . implode(" ",$aAction). '</div>';
            $items['action'] = $action_html;
            $aReturn[] = $items;
         }
        return $aReturn;
    }
    public function get_header(){

        return array('Slug','Type','Statut','Actions');
    }
    function get_form(){
      $form = array();

      return $form;
    }
}