<div class="row">
    <?php print render($formation['#prefix']); ?>
</div>
<form id="<?php print $formation['#id'] ?>" accept-charset="UTF-8" method="<?php print $formation['#method'] ?>" class = "form-inline" action="<?php print $formation['#action'] ?>">
    <div class="padding15">

        <?php print drupal_render($formation['specialty_training']); ?>

    	<?php print drupal_render($formation['finalite_formation']); ?>
        <div class="row">
            <div class="col-md-8 required">
              <?php print drupal_render($formation['type_qualification']); ?>
            </div>
            <div class="col-md-4">
              <?php print drupal_render($formation['formations_recurrentes']); ?>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12 required">
              <?php print shared_form_input_coller_serrer($formation['num_CQPI_CQPM'], $formation['libelle']); ?>
          </div>
        </div>
        <div class="row">
            <div class="col-md-6 required date datePicker">
            	<?php print drupal_render($formation['fieldset1']['date_begin']); ?>

            </div>
            <div class="col-md-6 required date datePicker">
            	<?php print drupal_render($formation['fieldset1']['date_end']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 required date datePicker">
            	<?php print drupal_render($formation['fieldset2']['training_start']); ?>
            </div>
            <div class="col-md-6 required date datePicker">
            	<?php print drupal_render($formation['fieldset2']['date_exam']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($formation['fieldset3']['total_duration']); ?></div>
          <div class="col-lg-6 col-durees-formations">
              <div class="col-md-12"><?php print drupal_render($formation['fieldset3']['duration_main_learning']); ?></div>
              <div class="col-md-12"><?php print drupal_render($formation['fieldset3']['accompanying_actions']); ?></div>
          </div>

        </div>
        <div class="row">
          <div class="col-md-6">
            <?php print shared_form_input_coller_serrer($formation['specialty_training_code'], $formation['specialty_training_libelle']); ?>
          </div>
            <div class="col-md-6">
              <?php print shared_form_input_coller_serrer($formation['finalite_formation_code'], $formation['finalite_formation_label']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6"><?php print drupal_render($formation['internal_training']); ?></div>
        </div>
        <div class="row">
        	<div class="col-md-6"><?php print drupal_render($formation['annual_distribution']); ?></div>
        </div>
    </div>
    <div id="boutonAction" class="row">
        <?php print drupal_render($formation['back']); ?>
        <?php print drupal_render($formation['quit']); ?>
        <?php print drupal_render($formation['next']); ?>
    </div>

    <?php print drupal_render($formation['modal_quit']); ?>
    <?php print drupal_render_children($formation, array('form_build_id', 'form_token', 'form_id', 'id_libelle','cerfa-step')); ?>

    <div id="modalinternaltraining" class="modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="mySmallModalLabel">
      <div class="modal-dialog modal-md">
          <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title">Formation interne</h4>
              </div>
              <div class="modal-body">
                <p>
                    L'employeur atteste que le service de formation interne dispose
                    des moyens nécessaires à la réalisation de la formation du salarié.
                </p>
              </div>
              <div class="modal-footer">
              <input class="btn btn-submit form-submit" data-dismiss="modal" type="button" id="internal_training_quit_modal" value="Oui">
              </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</form>
