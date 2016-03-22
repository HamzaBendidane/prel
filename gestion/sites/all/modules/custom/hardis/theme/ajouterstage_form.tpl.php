<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">


  <section class="content-header">
    <h1>
      Stage
      <small>Ajouter un  stage</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
      <li><a href="#">Stages</a></li>
      <li class="active">Ajouter un stage</li>
    </ol>
  </section>

  <section class="content">

    <div class="col-md-8">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Ajouter un stage</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['lieu']);?>
          </div>
            <div class="form-group col-sm-12">
                <?php print drupal_render($form['contenu']);?>
            </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['psy']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['bafm']);?>
          </div>

          <div class="form-group col-sm-12">
            <?php print drupal_render($form['premier_jour']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['tarif_reference']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['capacite']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['heure_debut_matin']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['heure_fin_matin']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['heure_debut_aprem']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['heure_fin_aprem']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['min_stagiaires']);;?>
          </div>

        </div>

      </div><!-- /.box-body -->

      <div class="box-footer">
        <?php print drupal_render($form['back']);?>
        <?php print drupal_render($form['submit']);?>
      </div>
</div>
<?php print drupal_render_children($form, array('form_build_id', 'form_token', 'form_id')); ?>
</form>

<script>
  $(function() {
    $('#edit-premier-jour').datepicker({
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
