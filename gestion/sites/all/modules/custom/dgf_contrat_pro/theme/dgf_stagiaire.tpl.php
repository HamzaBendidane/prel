<div class="row">
    <?php print render($stagiaire['#prefix']); ?>
</div>
<form id="<?php print $stagiaire['#id'] ?>" accept-charset="UTF-8"
  method="<?php print $stagiaire['#method'] ?>" class="form-inline"
  action="<?php print $stagiaire['#action'] ?>">
  <div class="padding15">
       <?php print drupal_render($stagiaire['fieldset4']['highest_level']); ?>
       <?php print drupal_render($stagiaire['fieldset4']['last_status']); ?>
       <?php print drupal_render($stagiaire['fieldset4']['social_beneficiary']); ?>
       <?php print drupal_render($stagiaire['fieldset1']['collective_convention']); ?>
    <div class="row">
      <div class="col-md-6 required">
          <?php

              if (has_role_admin() || has_role_adefim()) {
                  print drupal_render($stagiaire['fieldset1']['tout_etablissement']);
                  print drupal_render($stagiaire['fieldset1']['etablishment']);
              } else {
                  print drupal_render($stagiaire['fieldset1']['etablishment']);
              }
          ?>
      </div>
      <div class="col-md-6 required">
        <?php print shared_form_input_coller_serrer($stagiaire['fieldset1']['collective_convention_code'], $stagiaire['fieldset1']['collective_convention_libelle']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required"><?php print drupal_render($stagiaire['fieldset4']['pension_fund']); ?></div>
      <div class="col-md-6 required"><?php print drupal_render($stagiaire['fieldset4']['contingency_fund']); ?></div>
    </div>
    <div class="barre-separator"></div>
    <div class="row">
      <div class="col-md-12">
        <h3 style="float: left; margin-right: 5px;">Informations salarié</h3>
        <a id="juridique_info" class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-original-title="<?php print (new infoBulle('info_bulle_stagiaire_information_salarie'))->getBody(); ?>" style ="float:none;"></a>
      </div>
    </div>
    <div class="row">
      <div class="col-md-8 required inline-content"><?php print drupal_render($stagiaire['fieldset2']['man_woman']); ?></div>
    </div>
    <div class="row">
      <div class="col-md-6 required"><?php print drupal_render($stagiaire['fieldset2']['lastname']); ?></div>
      <div class="col-md-6 required"><?php print drupal_render($stagiaire['fieldset2']['firstname']); ?></div>
    </div>
    <div class="row">
      <div class="col-md-6 required date datePicker">
                <?php print drupal_render($stagiaire['fieldset2']['birthday']); ?>
            </div>
      <div class="col-md-6 required"><?php print drupal_render($stagiaire['fieldset2']['age']); ?></div>
    </div>





    <div class="row left-part-form">
      <div class="col-md-6 padding-left-right0">
        <div class="row">
          <div class="col-md-12 required">
                  <?php print drupal_render($stagiaire['fieldset3']['nom_rue']); ?>
              </div>
          <div class="col-md-12">
                <?php print drupal_render($stagiaire['fieldset3']['complement_adresse']); ?>
              </div>
          <div class="col-md-12">
                    <?php print drupal_render($stagiaire['fieldset3']['complement_adresse_2']); ?>
                </div>
          <div class="col-md-12 required">
                <?php print shared_form_input_coller_serrer($stagiaire['fieldset3']['zip_code'],
                      $stagiaire['fieldset3']['city']); ?>
              </div>
        </div>
      </div>
      <div class="col-md-6"><?php print drupal_render($stagiaire['fieldset3']['phone_number']); ?></div>
      <div class="col-md-6"><?php print drupal_render($stagiaire['fieldset3']['email']); ?></div>
    </div>

    <div class="row right-part-form">
      <div class="col-md-6 required">
          <?php print shared_form_input_coller_serrer($stagiaire['fieldset4']['highest_level_code'],
                      $stagiaire['fieldset4']['highest_level_label']); ?>
      </div>
      <div class="col-md-6">
          <?php print shared_form_input_coller_serrer($stagiaire['fieldset4']['social_beneficiary_code'],
              $stagiaire['fieldset4']['social_beneficiary_label']); ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 required">
          <?php print shared_form_input_coller_serrer($stagiaire['fieldset4']['last_status_code'],
              $stagiaire['fieldset4']['last_status_label']); ?>
      </div>
      <div class="col-md-6"><?php print drupal_render($stagiaire['fieldset2']['handicapped_worker']); ?></div>
    </div>
    <div class="row">
      <div class="col-md-6"><?php print drupal_render($stagiaire['fieldset4']['pole_emploi_number']); ?></div>
    </div>
    <div class="row">
      <div class="col-md-6"><?php print drupal_render($stagiaire['fieldset4']['since_month']); ?></div>
    </div>
    <div class="row">
      <div class="col-md-12"><?php print drupal_render($stagiaire['fieldset5']['plus_26_ans']); ?></div>
    </div>

  </div>

  <div id="boutonAction" class="row">
        <?php print drupal_render($stagiaire['back']); ?>
        <?php print drupal_render($stagiaire['quit']); ?>
        <?php print drupal_render($stagiaire['next']); ?>
    </div>

    <?php print drupal_render($stagiaire['modal_quit']); ?>
    <?php print drupal_render_children($stagiaire, array('form_build_id', 'form_token', 'form_id')); ?>
</form>
