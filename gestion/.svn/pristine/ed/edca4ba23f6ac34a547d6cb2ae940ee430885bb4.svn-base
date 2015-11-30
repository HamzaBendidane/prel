<h3>Gestion des utilisateurs</h3>

<div id="filter">
  <?php
    print '<form id="'.$liste_filtre_form['#id'].'"
      accept-charset="UTF-8"
      method="'.$liste_filtre_form['#method'].'"
      action="'.$liste_filtre_form['#action'].'">';
  ?>
  <div class="row">
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['numero_demande']); ?>
    </div>
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['statut']); ?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['nom']); ?>
    </div>
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['prenom']); ?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['email']); ?>
    </div>
    <div class="col-md-6">
      <?php print drupal_render($liste_filtre_form['rechercher']['siret']); ?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 center">
      <?php print drupal_render($liste_filtre_form['rechercher']['reset']); ?>
      <?php print drupal_render($liste_filtre_form['rechercher']['submit']); ?>
    </div>
  </div>
  <?php print drupal_render_children($liste_filtre_form); ?>
  <?php print '</form>'; ?>
</div>

<div id="resultats">
  <?php
  if (shared_user_access('GES_AJO_UTI')) {
    print l('Ajouter', '/opcaim-admin/utilisateurs/creation', array(
        'attributes' => array('class' => 'edit-add-button btn btn-default')
    ));
  }

    print theme('table',  array(
      'header' => $header,
      'rows' => $rows,
      'empty' => 'Aucun résultat n\'a été trouvé correspondant à vos critères de recherche',
      'sticky' => false,
    ));
    print theme('pager');

  ?>
</div>

<div class="modal" id="delete-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Confirmation<span class="numero_dossier"></span></h4>
      </div>
      <div class="modal-body">
        Etes-vous sûr de vouloir supprimer l'utilisateur : <span class="user-nom"></span>
      </div>
      <div class="modal-footer">
        <input class="btn btn-default pop-up-action" data-dismiss="modal" type="button" value="Annuler">
        <input class="btn btn-default modalValid form-submit pop-up-action" type="button" id="modal-delete-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->