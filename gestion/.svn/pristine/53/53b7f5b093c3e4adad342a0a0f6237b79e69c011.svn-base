
<div class="row onglets">

  <div id="synthese-onglet" class="onglet synthese col-lg-4 col-md-4 col-sm-4"><a href="#" id="edit-synthese"> Synthèse de la demande</a></div>
  <div id="justificatif-onglet" class="onglet justificatif col-lg-4 col-md-4 col-sm-4"><a href="#" id="edit-justificatif"> Pièces associées</a></div>
  <div id="justificatif-paiement-onglet" class="onglet justificatif_paiement col-lg-4 col-md-4 col-sm-4"><a href="#" id="edit-justificatif-paiement"> Justificatifs paiement</a></div>
</div>
<div class='row fenetre'>
<?php

print '<input type="hidden" id="page" value='.$page.'>';

print theme(
     'dgf_visualisation_finale_synthese_theme',
       array(
            'synthese' => $synthese,
       ));

print theme(
    'dgf_visualisation_finale_justificatif_theme',
    array(
        'justificatif' => $justificatif,
    ));
?>
   
    <?php

print theme(
    'dgf_visualisation_finale_justificatif_paiement_theme',
    array(
        'justificatif_paiement' => $justificatif_paiement,
    ));
?>
</div>

<form>
                    <div id="boutonAction" class="row">
                        
        <?php print drupal_render($action_form['back']); ?>
        <?php print drupal_render($action_form['quit']); ?>
        <?php print drupal_render($action_form['next']); ?>
    </div>
</form>
