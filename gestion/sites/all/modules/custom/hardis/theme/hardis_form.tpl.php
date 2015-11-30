<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8"
      method="<?php print $form['#method'] ?>" class="form-inline"
      action="<?php print $form['#action'] ?>">
    <div class="row">
        <div class="col-md-6 required"><?php print render($form['test-field']); ?></div>
    </div>

    <?php print drupal_render_children($form); ?>
</form>