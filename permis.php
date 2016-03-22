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



    $dbContenu = new db_contenu();

    $contenu = $dbContenu->get_by_id($_SESSION['stage']);
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
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
            <div class="col-xs-3"><div class="step on"></div></div>
            <div class="col-xs-3"><div class="step"></div></div>
        </div>
        <div class="row bar-title2">
            <h2><?php print $contenu['titre'] ?></h2>
        </div>
    </div>

    <div class="large center">

    <div class="col-md-3">
    <div class="permis">
    <div class="permis-bas center">

        <div class="connexion-haut">
            Type de formation
        </div>
        <div class="permis-form">
            <form method="post" action="confirmation.php">

                <div class="row input center cent">

                    <?php
                    if ($contenu['type'] == 1 ){
                    ?>
                    <h2>FORMATION</h2>
                    <?php
                    }else{
                    ?>
                     <h2>STAGE</h2>
                    <?php
                    }
                    ?>
                </div>

        </div>
    </div>
    </div>
    </div>


    <div class="col-md-6">
        <div class="permis">
            <div class="permis-bas center">

                <div class="connexion-haut">Formation
                </div>
                <div class="permis-form">
<div>
    <?php
    if (is_array($stages) && count($stages)){
    ?>
                    <table width="95%" cellspacing="0" cellpadding="0" border="1" class="front-stagetable">
                        <tbody><tr class="stagetable-header">
                            <td width="200" align="center"><b>Dates des stages</b></td>
                            <td align="center"><b>Inscription</b></td>
                            <td align="center"><b>Adresse de formation</b></td>
                        </tr>

                        <?php
                         foreach ($stages as $value) {
                             $dblieu = new db_lieu();
                             $lieu = $dblieu->get_by_id($value['id_lieu']);
                             $lieu = array_pop($lieu);
                             ?>
                             <tr class="stagetable-line1">
                                 <td align="left">
                                     <span style="font-size:11px;"><?php print $value['premier_jour_stage']?></span><br><span class="stageprix">Prix : <?php print $value['tarif_reference']?> €</span></td>
                                 <td align="center" class="complet centercol" width="30%">
                                     <form action="confirmation.php" method="post" name="formulaire">
                                         <input type="hidden" value="<?php print $value['id'] ?>" name="id_stage">
                                         <input type="submit" class = 'btn-xxx'
                                                onfocus="this.blur();" value="Inscription"
                                                class="submitbuttonlisteattente" name="submit">
                                     </form>
                                 </td>
                                 <td align="center"><b><?php print $lieu['libelle']?></b><br><?php print $lieu['adresse']?> <?php print $lieu['code_postal']?> <?php print $lieu['ville']?>
                                 </td>
                             </tr>
                         <?php
                         }
                        ?>
                        </tbody></table>
    <?php
    }
    ?>
</div>
                </div>


                </a>

            </div>
        </div>
    </div>
        <div class="col-md-3">
            <div class="permis">
                <div class="permis-bas center">

                    <div class="connexion-haut">

                        Modalités
                    </div>
                    <div class="permis-form">
                        <form method="post" action="index.html">

                            <div class="divider-small-p"></div>
                            <?php
                            if ($contenu['bloc_m'] == 1 ){
                                ?>
                                <h2>FORMATION</h2>
                            <?php
                            }
                            ?>
                    </div>


                    </a>

                </div>
            </div>
        </div>
        <br><br><br>
    </div>
</div>

</form>

    <!-- /.row -->
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
    <script src="js/scripts.js"></script>
</body>
</html>