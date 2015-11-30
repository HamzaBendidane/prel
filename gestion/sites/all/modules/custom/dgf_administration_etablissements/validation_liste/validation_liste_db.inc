<?php

/**
 *  Renvoie les données entreprises pour une validation
 *
 */
function liste_entreprises($order, $sort, $siret = null, $corporateName = null, $responsibleName = null, $toValidate) {
    db_set_active(@DB_SLAVE);

    $query = db_select('v_entreprises', 'e');

    $query->addField('e', 'id', 'e_id');
    $query->fields('e', array(
        'id' ,
        'siret',
        'raison_sociale',
        'telephone_principal',
    ));

    if ($toValidate) {
      $query->condition('e.est_valide', 0, '=');
    } else {
      $query->condition('e.est_valide', 1, '=');
    }

    $query->condition('e.est_actif', 1, '=');

    $query->distinct('siret')->orderBy('siret');

    if ($corporateName){
        $query->condition('raison_sociale', '%' . $corporateName . '%', 'LIKE');
    }
    if ($siret){
        $query->condition('siret', '%' . $siret . '%', 'LIKE');
    }
    if ($responsibleName){
        $data = shared_get_entreprise_by_contact($responsibleName);

        $query->condition('id', $data, 'in');
    }

    shared_update_requete_adefim_entreprise($query,'e.id','esclave');

  /*  if($query->countQuery()->execute()->fetchField() >= 100 && !isset($_GET['page'])){
        drupal_set_message(sprintf(t(@MSG_CONF_GES_ETAB_LIMIIT), 'établissements' ));
        $query->range(0,100);
    }
*/
    $query->extend('PagerDefault')->limit(10)->execute();

    $exec = $query->execute();

    $result = array();
    while($value =  $exec->fetchObject()){

        $data_contact = shared_get_infos_contact($value->id,true);
        $value->nom = @$data_contact['nom'];
        $value->prenom  = @$data_contact['prenom'];
        $value->email   = @$data_contact['email'];
        $result[] =  $value;
    }

    db_set_active();
    return $result;
}