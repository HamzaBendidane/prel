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

  <?php include("header.php"); ?>
    <?php

    $contenu = new db_contenu();

    $data = $contenu->get_by_id($_GET['id']);
    $data = array_pop($data);

    ?>

    <div class="container middle text-center">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="page-header text-center">
                <h1><?php print trom($data['titre'])?></h1>
            </div>

        </div>
    </div>
    <div class="row bg-stg-13 link-stage middle text-center">
            <?php print trom($data['bloc_g'])?>

    </div>
    <div class="container middle">
        <div class="col-sm-10 col-sm-offset-1 ">
                <?php print trom($data['bloc_c'])?>
        </div>
    </div>
    <!-- Projects Row -->
    <div class="row">
        <div class="col-md-4 prod-1 page-prod text-center">
            <div class="divider-small-ps"></div>
            <h2>MODALITES DE PAYEMENT</h2>

            <hr class="divider-small-p-hr">

            <?php print trom($data['bloc_m'])?>
        </div>
        <div class="col-md-4  prod-2 page-prod text-center">
            <div class="divider-small-ps"></div>

                <h2>PLANNING DES HORRAIRES DE CONDUITE</h2>

                <hr class="divider-small-p-hr-bl">

                <?php print trom($data['bloc_d'])?>

        </div>
        <a  href="inscription.php?id=<?php print trom($data['id'])?>">
        <div class="col-md-4 page-prod prod-3">
            <div class="divider-small-p"></div>

            <div class="divider-small-p"></div>
            <div class="center bg-ico">

            </div>

        </div>
        </a>
    </div>
    <!-- /.row -->
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
