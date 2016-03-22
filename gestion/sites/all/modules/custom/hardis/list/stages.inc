<?php
/**
 * Created by PhpStorm.
 * User: HBendida
 * Date: 27/08/2015
 * Time: 19:20
 */
class list_stages extends list_common{

    public function get_datas(){
      $lieu = new db_stage();
      $all = $lieu->get_all();
      $data = array();

      $lieu = new db_lieu();
      foreach($all as $value){
        $dLieu = $lieu->get_by_id($value['id_lieu']);

        $statut = '<span class="label label-success">Confirmé</span>';
        $data[] = array('test1' => $value['premier_jour_stage'],'test2' => $dLieu[0]['libelle'] . " [ N° agrément : ". $dLieu[0]['numero_agrement'] ." ] " , 'test9' => $value['capacite_salle'],
              'test3' => $value['capacite_salle'],'test4' => $value['capacite_salle'],'test5' => $statut,'test6' => $value['tarif_reference'],'action' => '','id'=> $value['id'],'<a href="/gestion/inscrirestagiaire?id='.$value['id'].'" ><i class="fa fa-fw fa-user-plus"></i></a>');
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
                '/ajouterstage',
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
            $aAction[] = l(
                '<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>',
                 '/voirstage',
                array(
                    'html' => true,
                    'attributes' => array('class' => array('action')),
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

        return array('Date','Lieux','Nb inscrit(s)','Nb pré-inscrit(s)','Places restante(s)','Statut','Mon tarif de référence','Actions','');
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