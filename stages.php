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
    <div class="row right">
        <br>
        <div class="col-sm-10 col-sm-offset-10">
            <?php
            if (trom($data['bloc_m'])) {
            ?>
                <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal"><img
                        src="inscription.png" width="200px"></button>
            <?php
            }else {
                ?>
                <a  href="permis.php?id=<?php print trom($data['id'])?>">
                        <img src="inscription.png" width="200px">
                </a>
            <?php
            }
            ?>

        </div>
    </div>
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
    <div class="container">

        <!-- Trigger the modal with a button -->

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">MODALITES</h4>
                    </div>
                    <div class="modal-body">
                        <p><?php print trom($data['bloc_m'])?></p>
                    </div>
                    <div class="modal-footer">
                        <a  href="permis.php?id=<?php print trom($data['id'])?>">
                        <button type="button" class="btn btn-primary">
                                <img src="inscription.png" width="200px">
                            </button></a>
                    </div>
                </div>

            </div>
        </div>

    </div>

</div>
  <?php include "footer.php" ?>
    <!-- Projects Row -->

    <!-- /.row -->
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
