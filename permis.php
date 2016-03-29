<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Bold, Bright Bootstrap Template</title>
    <meta name="generator" content="Bootply"/>
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



    $dbContenu = new db_contenu();

    if ($_GET['id']){
        $id = $_GET['id'];
    }else{
        $id = $_SESSION['stage'];
    }
    $contenu = $dbContenu->get_by_id($id);
    $contenu = array_pop($contenu);

    $stages = new db_stage();
    $stages = $stages->get_by_fields(array('id_contenu' => $contenu['id']));

    ?>
    <!-- Projects Row -->
    <div class="row bg-ctIn">

        <div class="center" style="width: 120px;">
            <H1 class="title">INSCRIPTION</H1>
        </div>
    </div>
    <div class="divider-small-px">
        <div class="row bar-title">
            <h2>étape 3</h2>
        </div>
        <div class="row bar-step center">
            <div class="col-xs-3">
                <div class="step"></div>
            </div>
            <div class="col-xs-3">
                <div class="step"></div>
            </div>
            <div class="col-xs-3">
                <div class="step on"></div>
            </div>
            <div class="col-xs-3">
                <div class="step"></div>
            </div>
        </div>
        <div class="row bar-title2">
            <h2><?php print $contenu['titre'] ?></h2>
        </div>
    </div>
        <div class="row barr-bas">
            <div class="col-md-5 text-center">
                <h2>DATE DES STAGES</h2>
            </div>
            <div class="col-md-2 text-center">
                <h2>INSCRIPTION</h2>
            </div>
            <div class="col-md-5 text-center">
                <h2>ADDRESSE DE FORMATION</h2>
            </div>
        </div>
        <?php
                if (is_array($stages) && count($stages)) {
                    ?>

                        <?php
                        foreach ($stages as $value) {
                            $dblieu = new db_lieu();
                            $lieu = $dblieu->get_by_id($value['id_lieu']);
                            $lieu = array_pop($lieu);
                            ?>
                            <div class="row barr-bas">
                                <div class="col-md-5 text-center">
                                    <h3><?php print $value['premier_jour_stage'] ?></h3><h3 class="color-red"><?php print $value['tarif_reference'] ?> €</h3>
                                </div>
                                <div class="col-md-2">
                                    <form action="confirmation.php" method="post" name="formulaire">
                                        <input type="hidden" value="<?php print $value['id'] ?>" name="id_stage">
                                        <input type="submit" class='btn-xxx'
                                               onfocus="this.blur();" value="S'INSCRIRE"
                                               class="submitbuttonlisteattente" name="submit">
                                    </form>
                                </div>
                                <div class="col-md-5 text-center">
                                    <h3><?php print $lieu['libelle'] ?></h3><?php print $lieu['adresse'] ?> <?php print $lieu['code_postal'] ?> <?php print $lieu['ville'] ?>
                                    </div>
                            </div>
                        <?php
                        }
                        ?>
                <?php
                }
                ?>

        <br><br><br><br><br><br>

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