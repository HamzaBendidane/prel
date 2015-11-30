<h3>
    <?php
    print compute_title($page);
    ?>
</h3>
<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>" class = "form-inline" action="<?php print $form['#action'] ?>">

    <div class="padding15">
        <fieldset id="edit-title-markup">
            <legend>
                <span class="fieldset-legend"><?php print compute_sub_title($page); ?></span>
            </legend>
        </fieldset>


        <div class="row">
            <div class="col-md-6 ">
                <?php print drupal_render($form['filtre_etablissement']['siret']); ?>
            </div>
            <div class="col-md-6 "><?php print drupal_render($form['filtre_etablissement']['raison_sociale']); ?></div>
        </div>
        <div class="row">
            <div class="col-md-6 "><?php print drupal_render($form['filtre_etablissement']['nom_contact']); ?></div>
        </div>
        <div class="row">

            <div class="row">
                <div class="col-md-12 center">
                    <?php print drupal_render($form['filtre_etablissement']['reset']); ?>
                    <?php print drupal_render($form['filtre_etablissement']['send']); ?>
                </div>
            </div>
            </div>
    </div>
    <div id="resultats">
        <?php
            print compute_add_button($page);
        ?>
        <?php
            print validation_liste_results_data($page);
        ?>
    </div>
    <?php
        print drupal_render_children($form);
    ?>
</form>

<div class="modal" id="delete-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><?php print t(@RGI_GES_ETA31)?> <span class="user-nom"></span><span class="numero_dossier"></span></h4>
            </div>
            <div class="modal-body">
                <?php print t(@RGI_GES_ETA32)?>
            </div>
            <div class="modal-footer">
                <input class="btn btn-default" data-dismiss="modal" type="button" value="Annuler">
                <input class="btn btn-default modalValid form-submit" type="button" id="modal-delete-valid" value="Valider">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
