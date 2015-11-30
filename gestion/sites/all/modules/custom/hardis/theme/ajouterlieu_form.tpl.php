<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">
            <div class="row">
                <div class="col-lg-12">
                    <h5>Lieu du stage</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 required">
                    <?php print drupal_render($form['libelle']);?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 required">
                    <?php print drupal_render($form['adresse']);;?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 required">
                    <?php print drupal_render($form['adress_complement']);;?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php print drupal_render($form['code_postal']);;?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <?php print drupal_render($form['ville']);?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?php print drupal_render($form['moyen_transport']); ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?php print drupal_render($form['numero_agrement']); ?>
                </div>

            </div>

            <div class="row">
                <div class="col-md-6">
                    <?php print drupal_render($form['nom_agrement']); ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <h5>Contact</h5>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render($form['nom']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['prenom']);?>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['email']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['telephone']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['telephone2']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['fax']);?>
                </div>
            </div>
    </div>
    <?php print drupal_render($form['back']);?>
    <?php print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id')); ?>

</form>
