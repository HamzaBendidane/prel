<div class="row">
    <?php print render($tuteur['#prefix']); ?>
</div>
<form id="<?php print $tuteur['#id'] ?>" accept-charset="UTF-8" method="<?php print $tuteur['#method'] ?>" class = "form-inline" action="<?php print $tuteur['#action'] ?>">
    <div class="padding15">
        <?php print drupal_render($tuteur['dernier_diplome']); ?>
        <div class="row">
            <div class="col-md-6 required">
                <?php

                    if (has_role_admin()) {
                        print drupal_render($tuteur['tout_etablissement']);
                        print drupal_render($tuteur['etablishment']);
                    } else {
                        print drupal_render($tuteur['etablishment']);
                    }
                ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($tuteur['lastname']); ?></div>
            <div class="col-md-6 required"><?php print drupal_render($tuteur['firstname']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6">
              <?php print drupal_render($tuteur['telephone']); ?>
              <?php print drupal_render($tuteur['email']); ?>
            </div>
            <div class="col-md-6 required date datePicker">
                <?php print drupal_render($tuteur['birthday']); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 required"><?php print drupal_render($tuteur['nb_salarie']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 required"><?php print drupal_render($tuteur['emploi_occupe']); ?></div>
            <div class="col-md-6">
              <?php print shared_form_input_coller_serrer($tuteur['dernier_diplome_code'],
                  $tuteur['dernier_diplome_label']); ?>
            </div>
        </div>
    </div>

    <div id="boutonAction" class="row">
        <?php print drupal_render($tuteur['back']); ?>
        <?php print drupal_render($tuteur['quit']); ?>
        <?php print drupal_render($tuteur['next']); ?>
    </div>
    <!-- Modal Attestation -->
    <div id="modal-certification-tuteur" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content attestation">
                <div class="modal-header">
                    <button type="button" class="close modalNext" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Attestation </h4>
                </div>
                <div class="modal-body">
                    <?php print drupal_render($tuteur['modal_attestation']['beneficier']); ?>
                    <div id="vaBeneficierFormation">
                        <div class="date datePicker">
                            <?php print drupal_render($tuteur['modal_attestation']['date_formation']); ?>
                        </div>
                        <?php print drupal_render($tuteur['modal_attestation']['duree_formation']); ?>
                        <?php print drupal_render($tuteur['modal_attestation']['nom_organisme']); ?>
                    </div>
                    <?php print drupal_render($tuteur['modal_attestation']['certifier']); ?>
                </div>
                <div class="modal-footer">
                    <?php print drupal_render($tuteur['modal_attestation']['modal_annuler']); ?>
                    <?php print drupal_render($tuteur['modal_attestation']['modal_save_attestation']); ?>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- Fin Modal Attestation -->

    <!-- Modal info final -->
    <div id="modal-message-information-final" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close modalQuit" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Fin de saisie</h4>
                </div>
                <div class="modal-body">
                    <?php print drupal_render($tuteur['modal_info_final']['text']); ?>
                </div>
                <div class="modal-footer">
                    <?php print drupal_render($tuteur['modal_info_final']['goto-cerfa']); ?>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!-- Fin Modal info final -->

    <?php print drupal_render($tuteur['modal_quit']); ?>
    <?php print drupal_render_children($tuteur, array('form_build_id', 'form_token', 'form_id', 'modal','cerfa-step')); ?>
</form>
