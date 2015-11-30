<h3>
  Validation de l'utilisateur :
  <?php print  $form['utilisateur']['utilisateur_prenom']['#value']; ?>
  <?php print  $form['utilisateur']['utilisateur_nom']['#value']; ?>
</h3>

<form id="<?php print $form['#id']; ?>" accept-charset="UTF-8"
  method="<?php print $form['#method']; ?>"
  action="<?php print $form['#action']; ?>">
  <div class="padding15">
<?php

  print theme('administration_utilisateurs_common_page_info_perso_theme', $variables);
  print '<br />';
  print theme('administration_utilisateurs_common_page_fonctionnalite_theme', $variables);
  print '<br />';
  print theme('administration_utilisateurs_common_page_etablissement_theme', $variables);

?>
<div id="bouton-action">
<?php
  print drupal_render($form['bouton']['refuser']);
  print drupal_render($form['bouton']['valider']);
?>
</div>

<?php
  print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id'));
?>
  </div>

  <div id="bouton-retour">
    <?php print drupal_render($form['bouton']['back']); ?>
  </div>

</form>


<div class="modal" id="refuser-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Confirmation<span class="numero_dossier"></span></h4>
      </div>
      <div class="modal-body">
        Etes-vous sûr de vouloir refuser cette demande de compte ?
      </div>
      <div class="modal-footer">
        <input class="btn btn-default" data-dismiss="modal" type="button" value="Annuler">
        <input class="btn btn-default modalValid form-submit" type="button" id="modal-refuser-valid" value="Valider">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->