<div class="row">

</div><form id="<?php print $form['#id'] ?>" accept-charset="UTF-8" method="<?php print $form['#method'] ?>"
      class="form-inline" action="<?php print $form['#action'] ?>" xmlns="http://www.w3.org/1999/html">


  <section class="content-header">
    <h1>
      Contenu
      <small>Ajouter un Contenu</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Contenu</a></li>
      <li><a href="#">Contenu</a></li>
      <li class="active">Contenu un animateur</li>
    </ol>
  </section>
  <section class="content">

    <div class="col-md-8">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Ajouter un Contenu</h3>
	  <h3 class="box-title"> <a href="http://cer-prelude.fr/stages.php?id=<?php print $form['id']["#value"] ?>" target="_blank"  > - Voir la page sur le site</a></h3>
        </div><!-- /.box-header -->
        <!-- form start -->
        <div class="box-body">
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['type']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['visible']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['titre']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['bloc_g']);;?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['bloc_c']);?>
          </div>
          <div class="form-group col-sm-12">
            <?php print drupal_render($form['bloc_d']); ?>
          </div>
            <div class="form-group col-sm-12">
                <?php print drupal_render($form['bloc_m']); ?>
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
</div>
<script src="https://cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('edit-bloc-g');
    CKEDITOR.replace('edit-bloc-c');
    CKEDITOR.replace('edit-bloc-d');
    CKEDITOR.replace('edit-bloc-m');
    //bootstrap WYSIHTML5 - text editor
  });
</script>
