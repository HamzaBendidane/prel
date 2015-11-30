<div class="row">
    <?php print render($contrat['#prefix']); ?>
</div>
<form id="<?php print $contrat['#id'] ?>" accept-charset="UTF-8" method="<?php print $contrat['#method'] ?>" class = "form-inline" action="<?php print $contrat['#action'] ?>">
    <div class="padding15">
      <?php print drupal_render($contrat['cerfa-step']); ?>
      <?php print drupal_render($contrat['min_monthly_gross_pay']); ?>
      <?php print drupal_render($contrat['id_dgf']); ?>
      <?php print drupal_render($contrat['id_dgf_contrat']); ?>
      <?php print drupal_render($contrat['type']); ?>
      <?php print drupal_render($contrat['group']); ?>
      <?php print drupal_render($contrat['collective_convention']); ?>


        <div class="row">
            <div class="col-md-6 required">
                <?php print drupal_render($contrat['fieldset1']['etablishment']); ?>
            </div>
        </div>
        <div class="row  col-md-12">
            <div class="col-md-12 required"><?php print drupal_render($contrat['alerte_age']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($contrat['nature']); ?></div>
            <div class="col-md-6 required"><?php  print shared_form_input_coller_serrer($contrat['type_code'], $contrat['type_libelle']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required date datePicker">
                <?php print drupal_render($contrat['fieldset1']['date_begin']); ?>
                <div class= "message-inline"> </div>
            </div>
            <div class="col-md-6 required date datePicker">
                <?php print drupal_render($contrat['fieldset1']['date_end']); ?>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 required">
                <?php
                 print shared_form_input_presque_coller_serrer($contrat['fieldset1']['training_duration'],
                                    $contrat['fieldset1']['training_duration_days']);
                ?>
            </div>
            <div class="col-md-6 required"><?php print drupal_render($contrat['fieldset1']['test_period']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required">
              <?php
               print shared_form_input_presque_coller_serrer($contrat['fieldset1']['weekly_hour'],
                                  $contrat['fieldset1']['weekly_minute']);
              ?>
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($contrat['niveau']); ?></div>
            <div class="col-md-6 required"><?php print drupal_render($contrat['coefficient']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required">
              <?php
                print shared_form_input_coller_serrer($contrat['group_code'], $contrat['group_label']);
              ?>
            </div>
            <div class="col-md-6 required"><?php print drupal_render($contrat['position_held']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($contrat['monthly_gross_pay']); ?></div>
        </div>
    </div>

    <div id="boutonAction" class="row">
        <?php print drupal_render($contrat['back']); ?>
        <?php print drupal_render($contrat['quit']); ?>
        <?php print drupal_render($contrat['next']); ?>
    </div>

    <?php print drupal_render($contrat['modal_quit']); ?>
    <?php
    print drupal_render_children($contrat, array('form_build_id', 'form_token', 'form_id'));
    ?>
</form>
