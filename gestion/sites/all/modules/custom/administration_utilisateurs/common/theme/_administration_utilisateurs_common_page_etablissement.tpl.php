<div id="etablissement" class="fieldset">
  <div class="row">
    <div class="col-md-12">
      <h5>Périmètre de gestion (établissements)</h5>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12">
<?php
  $header = array('Etablissements', 'ADEFIM', 'Statuts');
  print theme('table',  array('header' => $header, 'rows' => $table_rows));
  print l(
      t('Ajouter un établissement'),
      '/opcaim-admin/utilisateurs/'.$id_drupal_user.'/etablissement/attacher/'.$page,
      array('attributes' => array('class' => 'new-siret'))
  );
?>
    </div>
  </div>
</div>


<div class="modal" id="new-siret-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Rattacher un autre SIRET</h4>
      </div>
      <div class="modal-body">
        <div>Veuillez sélectionner l'entreprise soit par le SIRET, soit par la raison sociale :</div>
        <?php print drupal_render($form['utilisateur']['tout_etablissement']);?>
        <?php print drupal_render($form['utilisateur']['id_etablissement']);?>
      </div>
      <div class="modal-footer">
        <input class="btn pop-up-action" data-dismiss="modal" type="button" value="Annuler">
        <input class="btn modalValid form-submit pop-up-action" type="button" id="modal-new-siret-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal" id="retirer-siret-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Retirer un étalissement</h4>
      </div>
      <div class="modal-body">
        <div>Veuillez indiquer la raison du retrait de cet étabissement de votre périmètre : </div>
        <?php print drupal_render($form['utilisateur']['raison_retrait']);?>
        <?php print drupal_render($form['utilisateur']['raison_retrait_autre']);?>
      </div>
      <div class="modal-footer">
        <input class="btn btn-default" data-dismiss="modal" type="button" value="Annuler">
        <input class="btn btn-default modalValid form-submit" type="button" id="modal-retirer-siret-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->