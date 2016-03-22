<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Bold, Bright Bootstrap Template</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<!-- Wrap all page content here -->
<div id="wrap">

    <?php include("header.php");
        module_load_include('inc', 'login','inscription');
        $form = drupal_get_form('inscription_form');
    ?>

    <!-- Projects Row -->
    <div class="row bg-ctIn">

        <div class="center" style="width: 120px;">
            <H1 class="title">INSCRIPTION</H1>
        </div>
    </div>
    <div class="divider-small-px">
        <div class="row bar-title">
            <h2>étape 2</h2>
        </div>
        <div class="row bar-step center">
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step on"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
        </div>
        <div class="row bar-title2">
            <h2> Mon compte</h2>
        </div>
        <?php
        if ($_GET['ok']){
        ?>
        <div class="row bar-title2">
            <h2> Mon Modification a été prise en compte</h2>
        </div>
        <?php
        }
        ?>
    </div>

    <?php
    $errors = form_get_errors();
    foreach($errors as $value){
        ?>
        <div class="error">
            <?php print $value ?>
        </div>
    <?php
    }
    ?>
        <form id="<?php print $form['#id'] ?>" accept-charset="UTF-8"
              method="<?php print $form['#method'] ?>" class="conn-form"
              action="<?php print $form['#action'] ?>">
        <div class="row">
            <div class="col-md-1"><h3>VOUS</h3></div>
            <div class="col-md-3"> <p> <?php print drupal_render($form['civilite']);?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['prenom']);;?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['nom']);?></p></div>

        </div>
        <div class="divider-small-pp"></div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['ne_le']);;?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['ne_a']);;?></p></div>

        </div>
        <div class="divider-small-pp"></div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['adresse']);?></p></div>
            <div class="col-md-3"> <p> <?php print drupal_render($form['cp']); ?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['ville']); ?></p></div>

        </div>
        <div class="divider-small-pp"></div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['telephone']);;?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['telephone2']);;?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['email']);;?></p></div>
        </div>
        <div class="divider-small-p"></div>
        <div class="row">
            <div class="col-md-1"><h3>PERMIS</h3></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['numero_permis']);?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['date_delivrance']);?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['lieu_delivrance']);?></p></div>

        </div>
        <div class="divider-small-p"></div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['date_obtention']);;?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['points']);?></p></div>
            <div class="col-md-3"> <p><?php print drupal_render($form['souce_points']);?></p></div>

        </div>
        <div class="divider-small-p"></div>
        <div class="row input center">
            <p class="submit"><?php print drupal_render($form['submit']);?></p>
        </div>
            <?php print drupal_render_children($form); ?>
        </form>
</div>






<!-- /.row -->
<!-- script references -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
<script src="js/scripts.js"></script>
</body>
</html>