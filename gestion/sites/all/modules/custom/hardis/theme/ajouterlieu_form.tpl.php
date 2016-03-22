<form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">


  <section class="content-header">
    <h1>
      Lieu du stage
      <small>Lieu du stage</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
      <li><a href="#">Stages</a></li>
      <li class="active">Ajouter un lieu de stage</li>
    </ol>
  </section>

  <section class="content">

    <div class="col-md-8">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Ajouter un lieux</h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['libelle']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['adresse']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['adress_complement']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['code_postal']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['ville']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['moyen_transport']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['numero_agrement']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['nom_agrement']); ?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['adresse']);;?>
          </div>

          <h4>Ajouter un Contact</h4>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['nom']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render( $form['prenom']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render( $form['telephone']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render( $form['telephone2']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render( $form['email']);?>
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
