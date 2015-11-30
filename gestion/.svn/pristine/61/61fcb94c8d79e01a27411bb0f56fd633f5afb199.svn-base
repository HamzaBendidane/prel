<div class="row">
    <?php // print render($suivi_demande_list_form['#prefix']); ?>
</div>
<h3>Suivi des demandes</h3>
<form id="<?php print $suivi_demande_list_form['#id'] ?>" 
  accept-charset="UTF-8" method="<?php print $suivi_demande_list_form['#method'] ?>" 
  class = "form-inline" action="<?php print $suivi_demande_list_form['#action'] ?>">
    <div class="padding15">
        <div class="row">
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['action_number']); ?>
            </div>
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['action_nature']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['statut']); ?>
            </div>
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['year_exercise']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['worker_name']); ?>
            </div>
            <div class="col-md-6">
                <?php print drupal_render($suivi_demande_list_form['tout_etablissement']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 center">
                <?php print drupal_render($suivi_demande_list_form['reset']); ?>
                <?php print drupal_render($suivi_demande_list_form['filter']); ?>
            </div>
        </div>
        <?php print drupal_render_children($suivi_demande_list_form); ?>
    </div>
</form>
<div id="resultats">
<?php print compute_export_button();?>
<div class="list-legend-icon list-inline">
  <li class="legend-icon">
    <span class="glyphicon glyphicon-list-alt statut-color-1"></span><span class="legend-text">En cours de saisie</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-paperclip statut-color-2"></span><span class="legend-text">En attente de pièce /engagement</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-credit-card statut-color-7"></span><span class="legend-text">En attente de justificatifs /paiement</span></li>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-send statut-color-3"></span><span class="legend-text">Transmis à l'ADEFIM</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-ok statut-color-4"></span><span class="legend-text">Accepté</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-hourglass statut-color-8"></span><span class="legend-text">En cours</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-saved statut-color-9"></span><span class="legend-text">Soldé</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-ban-circle statut-color-5"></span><span class="legend-text">Annulé</span>
  </li>
  <li class="legend-icon">
    <span class="glyphicon glyphicon-remove statut-color-6"></span><span class="legend-text">Refusé</span>
  </li>
</div>


  <?php
    print("<div class ='scroll'>");
    print theme('table',  array(
        'header' => $header,
        'rows' => $rows,
        'attributes' => array(),
        'caption' => '',
        'colgroups' => array(),
        'empty' => t("Il n'y a pas de données à afficher..."),
        'sticky' => true,
    ));
  ?>
<?php print compute_export_button();?>
  </div>
</div>
<?php  
print theme('pager');?>

<!-- modal des établisssements -->
<div id="etablishment-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true"> 
  <div class="modal-dialog modal-sm">
    <div class="modal-content"><div class="modal-header">
      <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Liste des établissements</h4>
      </div>
      <div class="modal-body" id="modal-etablishment-body">
      </div>
      <div class="modal-footer">
        <input class="btn btn-default modalQuit" data-dismiss="modal" type="button" id="edit-modal-quit" value="Quitter">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- modal des participants -->
<div id="intern-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true"> 
  <div class="modal-dialog  modal-sm">
    <div class="modal-content"><div class="modal-header">
      <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Liste des participants à la formation</h4>
      </div>
      <div class="modal-body" id="modal-intern-body">
      </div>
      <div class="modal-footer">
        <input class="btn btn-default modalQuit" data-dismiss="modal" type="button" id="edit-modal-quit" value="Quitter">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- modal des justificatifs -->
<div id="justif-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true"> 
  <div class="modal-dialog">
    <div class="modal-content"><div class="modal-header">
      <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Liste des pièces jointes au dossier - <span class="numero_dossier"></span></h4>
      </div>
      <div class="modal-body" id="modal-justif-body">
      </div>
      <div class="modal-footer">
        <input class="btn btn-default modalQuit" data-dismiss="modal" type="button" id="edit-modal-quit" value="Quitter">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- modal pour suppression -->
<div id="delete-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true"> 
  <div class="modal-dialog  modal-sm">
    <div class="modal-content"><div class="modal-header">
      <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Voulez vous supprimer cette action ?</h4>
      </div>
      <div class="modal-body" id="modal-delete-body">
      </div>
      <div class="modal-footer">
        <input class="btn btn-default modalQuit" data-dismiss="modal" type="button" id="modal-delete-quit" value="Annuler">
        <input class="btn btn-default modalValid form-submit" data-dismiss="modal" type="button" id="modal-delete-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- modal pour duplication -->
<div id="duplicate-modal" class="modal" tabindex="-1" role="dialog" aria-hidden="true"> 
  <div class="modal-dialog  modal-sm">
    <div class="modal-content"><div class="modal-header">
      <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 class="modal-title">Voulez vous dupliquer cette action ?</h4>
      </div>
      <div class="modal-footer">
        <input class="btn btn-default modalQuit" data-dismiss="modal" type="button" id="modal-duplicate-quit" value="Annuler">
        </a><input class="btn btn-default modalValid form-submit" data-dismiss="modal" type="button" id="modal-duplicate-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

