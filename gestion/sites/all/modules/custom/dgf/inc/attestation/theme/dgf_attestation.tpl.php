<div class="row">
<div>
    <?php print render($attestation['#prefix']); ?>
</div>
<form id="<?php print $attestation['#id'] ?>"
  accept-charset="UTF-8"
  method="<?php print $attestation['#method'] ?>"
  class="form-inline"
  action="<?php print $attestation['#action'] ?>">
  <div class="col-md-12 padding15">
      <div class="col-md-12 center">
          <?php print drupal_render($attestation['title']); ?>
      </div>
      <div class="col-md-12 center">
          <?php print drupal_render($attestation['certifie']); ?>
      </div>
      <div class="col-md-12 center">
          <?php print drupal_render($attestation['message_adefim']); ?>
          <?php print drupal_render($attestation['id_adefim']); ?>
      </div>
      <div class="col-md-12 center">

          <?php print drupal_render($attestation['message']); ?>

      </div>
      <div class="col-md-12 center">
          <?php print drupal_render($attestation['transmettre']); ?>
      </div>
  </div> <!-- end padding15 -->
    <div id="modal-fin-saisie" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title">Fin de saisie</h4>
          </div>
          <div class="modal-body center">
            <?php print drupal_render($attestation['messagefinsaisie']); ?>
            <?php print drupal_render($attestation['list']); ?>
            <?php print drupal_render($attestation['siret']); ?>
          </div>
          <div class="modal-footer center">
            <?php print drupal_render($attestation['voir_cerfa']); ?>
            <?php print drupal_render($attestation['tuteur_demande']); ?>
            <?php print drupal_render($attestation['nouvelle_demande']); ?>
            <?php print drupal_render($attestation['duplicate_demande']); ?>
            <?php print drupal_render($attestation['accueil']); ?>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <?php print drupal_render_children($attestation); ?>
</form>
</div> <!-- end row -->