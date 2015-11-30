<h3>
    <?php
        print compute_title($page);
    ?>
</h3>
<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>" class = "form-inline" action="<?php print $form['#action'] ?>">
    <div class="row">
        <div class="col-md-6 required">
            <?php print drupal_render($form['type_etablissement']);?>
        </div>
        <div class="col-md-6 required">
            <?php print drupal_render($form['adefim_gestion']);?>
        </div>
    </div>
    <div class="padding15">
        <div id="informations-personnelles" class="fieldset">
          <div class="row">
              <div class="col-md-12">
                  <h5>Etablissements</h5>
              </div>
          </div>
          <div class="row">
              <div class="col-md-6 required">
                  <?php print drupal_render($form['etab']['siret']);?>
              </div>
              <div class="col-md-6 required">
                  <?php print drupal_render($form['etab']['corporate_name']);?>
              </div>
          </div>
          <div class="row">
            <div class="row col-md-6 left-part-form">
              <?php
                print '<div class="required">';
                print drupal_render($form['etab']['street_name']);
                print '</div>';
                print drupal_render($form['etab']['adress_complement']);
                print drupal_render($form['etab']['adress_complement_2']);
                print '<div class="required">';
                print shared_form_input_coller_serrer($form['etab']['zip_code'],
                    $form['etab']['city']);
                print '</div>';

              ?>
            </div>
            <div class="row col-md-6 right-part-form">
              <?php
                print '<div class="required">';
                print shared_form_input_coller_serrer($form['etab']['code_nace'],
                        $form['etab']['libelle_nace']);
                print drupal_render($form['etab']['id_nace']);
                print '</div>';
                print '<div class="required">';
                print shared_form_input_coller_serrer($form['etab']['code_filiere'],
                        $form['etab']['libelle_filiere']);
                    print drupal_render($form['etab']['id_filiere']);
                print '</div>';
                print shared_form_input_coller_serrer($form['etab']['code_filiere2'],
                        $form['etab']['libelle_filiere2']);
                print drupal_render($form['etab']['id_filiere2']);
              ?>
            </div>
          </div>
          <div class="row">
            <div class="row col-md-6 required">
              <?php print drupal_render($form['etab']['phone_number']); ?>
            </div>
          </div>
        </div>

        <div id="informations-personnelles" class="fieldset required">
            <div class="row">
                <div class="col-md-12">
                    <h5>Contact</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render($form['resp']['title']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['resp']['lastname']);?>
                </div>
                <div class="col-md-6 required">
                    <?php print drupal_render( $form['resp']['firstname']);?>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render($form['resp']['email']);?>
                </div>
                <div class="col-md-6 required">
                    <?php print drupal_render($form['resp']['confirm_email']);?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 required">
                    <?php print drupal_render($form['resp']['function']);?>
                </div>
            </div>
        </div>

        <div id="boutonAction" class="row">
          <?php print drupal_render($form['refuser_creation']);?>
          <?php print drupal_render($form['valider_creation']);?>
          <?php print drupal_render($form['submit']);?>
        </div>

    </div>
    <br >

    <?php print drupal_render($form['back']);?>
    <?php print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id')); ?>

</form>
