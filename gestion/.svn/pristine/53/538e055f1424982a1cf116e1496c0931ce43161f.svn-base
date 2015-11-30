<?php

  print l('Ajouter', '/opcaim-admin/parametres/add-referentiel/'.$referentiel_selected, array(
      'attributes' => array('class' => 'edit-add-button btn btn-default')
  ));
  
  // Setting the output of the field
  print theme('table',
      array(
          'header' => $header,
          'rows' => $rows,
          'attributes' => array(),
          'sticky' => true,
          'caption' => '',
          'colgroups' => array(),
          'empty' => t("Il n'y a pas de données à afficher...")
      )
  );
  print theme('pager');
?>