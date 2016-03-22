<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">


  <section class="content-header">
    <h1>
      Stage
      <small>Inscrire un stagiaire au stage : </small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
      <li><a href="#">Stages</a></li>
      <li class="active">Inscrire un stagiaire</li>
    </ol>
  </section>

  <section class="content">
<div class="row">
    <div class="col-md-6">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Données personnelles</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['civilite']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['nom_jeune_fille']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['nom']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['prenom']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['ne_le']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['ne_a']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['adresse']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['cp']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['ville']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['telephone']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['telephone2']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['email']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['fax']);;?>
          </div>
        </div>
      </div><!-- /.box-body -->
</div>

    <div class="col-md-6">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Permis</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['numero_permis']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['date_delivrance']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['lieu_delivrance']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['date_obtention']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['points']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['souce_points']);;?>
          </div>
        </div>

      </div><!-- /.box-body -->


    </div>

</div>
<br>
    <div class="row">
      <div class="col-md-6">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Inscription</h3>
          </div><!-- /.box-header -->
          <!-- form start -->
          <div class="box-body">
            <div class="form-group col-sm-12">
              <?php print drupal_render($form['statut']);?>
            </div>

            <div class="form-group col-sm-12">
              <?php print drupal_render($form['date_paiement']);?>
            </div>

            <div class="form-group col-sm-12">
              <?php print drupal_render($form['montant_paye']);?>
            </div>

            <div class="form-group col-sm-12">
              <?php print drupal_render($form['moyen_paye']);;?>
            </div>
            <div class="form-group col-sm-12">
              <?php print drupal_render($form['tarif_reference']);;?>
            </div>
          </div>

        </div><!-- /.box-body -->

      </div>

      <div class="col-md-6">
        <div class="box box-primary">
          <div class="box-header with-border">
            <h3 class="box-title">Paiement sécurisé</h3>
          </div><!-- /.box-header -->
          <!-- form start -->
          <div class="box-body">
                cryptage SSL utilisé par la banque Crédit du Nord.

          </div>

        </div><!-- /.box-body -->

      </div>

    </div>
    <div class="row">
      <div class="box-footer">
        <?php print drupal_render($form['back']);?>
        <?php print drupal_render($form['submit']);?>
      </div>
    </div>
<?php print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id')); ?>
</form>

<script>
  $(function() {
    $('.dateP').datepicker({
      todayBtn:"true",
      format:"dd/mm/yyyy",
      autoclose:"true",
      pickerPosition:"bottom-left",
      language:"fr"
    });
    $('#edit-heure-debut-matin').timepicker({
      timeFormat: 'HH:mm:ss'
    });


  });
</script>
