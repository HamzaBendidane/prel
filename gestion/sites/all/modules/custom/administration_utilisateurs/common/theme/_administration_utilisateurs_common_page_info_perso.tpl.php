<div id="informations-personnelles" class="fieldset">
  <div class="row">
    <div class="col-md-12">
      <?php if (arg(0) === 'mon-compte'): ?>
        <h5>Mon compte</h5>
      <?php else: ?>
        <h5>Informations personnelles</h5>
      <?php endif; ?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 inline-content">
      <?php print drupal_render($form['utilisateur']['utilisateur_titre']);?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <?php print drupal_render($form['utilisateur']['utilisateur_nom']);?>
    </div>
    <div class="col-md-6">
      <?php print drupal_render($form['utilisateur']['utilisateur_prenom']);?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <?php if (arg(0) === 'mon-compte'): ?>
        <?php print shared_form_view_input($form['utilisateur']['utilisateur_email']);?>
      <?php else: ?>
        <?php print drupal_render($form['utilisateur']['utilisateur_email']);?>
      <?php endif; ?>
    </div>
    <div class="col-md-6">
      <?php print drupal_render($form['utilisateur']['utilisateur_fonction']);?>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <?php print drupal_render($form['utilisateur']['utilisateur_telephone']);?>
    </div>
  </div>
</div>