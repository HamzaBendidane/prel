<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class list_stagiaires extends list_common{

    public function get_datas(){
      $lieu = new db_stagiaires();
      $all = $lieu->get_all();
      $data = array();

      $oStage = new db_stage();
        $oLieu = new db_lieu();
        $statuts =  array('1' => "En attente d’inscription" , '2' => "Pré-inscrit",
            '3' => "Confirmé");
      foreach($all as $value){
          $stage = $oStage->get_by_id($value['id_stage']);
          $lieu = $oLieu->get_by_id($stage[0]['id_lieu']);

        $statut = '<span class="label label-success">'.$statuts[$value['statut']].'</span>';
        $data[] = array('test1' => $value['nom'],'test2' =>  $value['nom'] , 'test9' => $value['inscrit_par'],
              'test3' => $stage[0]['premier_jour_stage'].' à '.$lieu[0]['libelle'],'test4' => $value['date_inscription'],'test5' => $statut);
      }
      return $data;
    }

    public function display_table_rows($data){
        foreach ($data as $key => $items) {

            $aAction = array();
            $id = $items['id'];

            unset($items['id']);

            $action_html = '<div class="center">' . implode(" ",$aAction). '</div>';
            $items['action'] = $action_html;
            $aReturn[] = $items;
         }
        return $aReturn;
    }
    public function get_header(){

        return array('Nom','Prénom','Inscrit par','Stage','Date d’inscription','Statut','');
    }
    function get_form(){
      $region["0"] = "Toutes les régions";
      $region["01"] = "ALSACE";
      $region["02"] = "AQUITAINE";
      $region["03"] = "AUVERGNE";
      $region["04"] = "BASSE NORMANDIE";
      $region["05"] = "BOURGOGNE";
      $region["06"] = "BRETAGNE";
      $region["07"] = "CENTRE";
      $region["08"] = "CHAMPAGNE-ARDENE";
      $region["09"] = "CORSE";
      $region["10"] = "FRANCHE COMTE";
      $region["11"] = "HAUTE NORMANDIE";
      $region["12"] = "IdF";
      $region["13"] = "LANGUEDOC ROUSSILLON";
      $region["14"] = "LIMOUSIN";
      $region["15"] = "LORRAINE";
      $region["16"] = "MIDI PYRENEES";
      $region["17"] = "NORD PAS DE CALAIS";
      $region["19"] = "PICARDIE";
      $region["18"] = "PAYS DE LOIRE";
      $region["20"] = "POITOU CHARENTES";
      $region["21"] = "PROVENCE ALPES COTE D’AZUR";
      $region["22"] = "RHONE-ALPES, ALPES PAYS DE SAVOIE";

      $form['region'] = array(
        '#type' => 'select',
        '#title' => t('Région'),
        '#options' => $region,
        '#field_suffix' => '',
        '#default_value' => '',
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('form-control')
        ),
      );

      $form['submit'] = array(
        '#type' => 'submit',
        '#value' => t('Rechercher'),
        '#validate' => array(),
        '#submit' => array(),
        '#attributes' =>array(
          'placeholder' => t(''),
          'class' => array('btn btn-info pull-right')
        ),
      );

      return $form;
    }
}