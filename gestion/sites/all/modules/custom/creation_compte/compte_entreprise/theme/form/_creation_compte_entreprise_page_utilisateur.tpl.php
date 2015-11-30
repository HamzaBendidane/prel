<fieldset class="form-wrapper" id="edit-utilisateur">
  <div class="fieldset-title">L'UTILISATEUR</div>
  <div class="fieldset-wrapper">
    <div class="row">
      <div class="col-md-8 required inline-content">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_titre']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_nom']); ?>
      </div>
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_prenom']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_email']); ?>
      </div>
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_email2']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_telephone']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_fonction']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_password']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 required">
        <?php print drupal_render($form_creation_compte['utilisateur']['utilisateur_fonctions']); ?>
      </div>
    </div>
  </div>
</fieldset>