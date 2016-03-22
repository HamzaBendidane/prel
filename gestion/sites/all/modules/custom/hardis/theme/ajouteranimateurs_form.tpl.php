<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">


  <section class="content-header">
    <h1>
      Animateurs
      <small>Ajouter un animateur</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Animateurs</a></li>
      <li><a href="#">Animateurs</a></li>
      <li class="active">Ajouter un animateur</li>
    </ol>
  </section>

  <section class="content">

    <div class="col-md-8">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Ajouter un animateur</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['nom']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['prenom']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['qualite']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['adresse']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['code_postal']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['ville']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['telephone']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['telephone2']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['fax']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['email']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['commentaire']);;?>
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
