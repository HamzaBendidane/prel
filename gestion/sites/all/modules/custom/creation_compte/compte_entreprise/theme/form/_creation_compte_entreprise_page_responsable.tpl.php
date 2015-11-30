<fieldset class="form-wrapper" id="edit-responsable">
  <div class="fieldset-title">LE RESPONSABLE DE L'ENTREPRISE</div>
  <div class="fieldset-wrapper">
    <div class="row">
      <div class="col-md-8 required inline-content">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_titre']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_nom']); ?>
      </div>
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_prenom']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_email']); ?>
      </div>
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_email2']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['responsable']['responsable_fonction']); ?>
      </div>
    </div>
  </div>
</fieldset>