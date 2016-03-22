<section class="content-header">
  <h1>
    Liste des stagiaires
    <small>Liste des stagiaires</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
    <li><a href="#">Stagiaires</a></li>
    <li class="active">Liste des stagiaires</li>
  </ol>
</section>
<section class="content">

  <!--
  <div class="row">
    <div class="col-md-6">
      <div class="box box-default ">
        <div class="box-header with-border ">
          <h3 class="box-title">Recherche simple</h3>
          <div class="box-tools pull-right">
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <?php print drupal_render($form['region']);?>
            </div>

          </div>
        </div><
        <div class="box-footer">
          <?php print drupal_render($form['submit']);?>
        </div>
      </div>
    </div>
  </div>
  -->
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
       <!--   <h3 class="box-title">Nombre de résultats : 3</h3> -->
          <div class="box-tools">
            <div style="width: 150px;" class="input-group">
              <div class="input-group-btn">
              </div>
            </div>
          </div>
        </div><!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
          <?php
          print  $page;
          ?>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div>
  </div>
</section>