<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Prelude Formations - inscritpion</title>
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

    module_load_include('inc', 'login','login_form');
    module_load_include('inc', 'login','login_form_submit');
    module_load_include('inc', 'login','login_langs');

    $login_form = drupal_get_form('login_site_form') ;

    ?>
    <?php

    if (isset($_GET['id'])){
        $_SESSION['stage'] = $_GET['id'];
    }
    global $user;

    if ($user->uid && $_SESSION['stage']) {
        header('location:permis.php');
    }
    ?>
    <!-- Projects Row -->
    <div class="row bg-ctIn">

        <div class="center" style="width: 120px;">
            <H1 class="title">INSCRIPTION</H1>
        </div>
        </div>
    <div class="divider-small-px">
        <div class="row bar-title">
            <h2>étape 1</h2>
        </div>
        <div class="row bar-step center">
            <div class="col-xs-3"><div class="step on"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
        </div>
        <div class="row bar-title2">
            <h2> CONNEXION</h2>
        </div>
    </div>
    <div class="connexion center">
    <div class="connexion-bas">

        <div class="connexion-haut">
            CONNEXION

        </div>
        <div class="error">
        <?php    $errors = drupal_get_messages();
         if (is_array(@$errors['error'])){
             echo implode("<br>",$errors['error']);
         }?>
        </div>
        <div class="conn-form">
            <form id="<?php print $login_form['#id'] ?>" accept-charset="UTF-8"
                  method="<?php print $login_form['#method'] ?>" class="form-inline"
                  action="<?php print $login_form['#action'] ?>">

                <div class="row input center">
                    <?php
                    //unset($login_form['username']['#theme_wrappers']);
                    print drupal_render($login_form['username']); ?>
                </div>
                <div class="divider-small-ps"></div>
                <div class="row input center">
                    <?php
                    //unset($login_form['password']['#theme_wrappers']);
                    print drupal_render($login_form['password']); ?>
                </div>
                <div class="divider-small-ps"></div>
                <div class="row input center">
                   <a href="mot-de-passe.php"> Mot de passe oublié ?</a>
                </div>

                <div class="divider-small-ps"></div>
                <div class="row input center">
                    <?php print drupal_render($login_form['submit']); ?>
                </div>
                <?php print drupal_render_children($login_form); ?>
            </form>
        </div>

        <a class="btn-new-acc" href="creation-compte.php"> CREATION DE COMPTE
            </a>

    </div>
    </div>

</div>
<?php include "footer.php" ?>

    <!-- /.row -->
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
