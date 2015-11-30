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
            <h2> CONNEXIONe</h2>
        </div>
    </div>
    <div class="connexion center">
    <div class="connexion-bas">

        <div class="connexion-haut">
            CONNEXION

        </div>
        <div class="conn-form">
            <form method="post" action="index.php">

                <div class="row input center">
                    <p><input type="text" name="login" value="" placeholder="IDENTIFIANT"></p>
                </div>
                <div class="divider-small-p"></div>
                <div class="row input center">
                    <p><input type="password" name="password" value="" placeholder="MOT DE PASSE"></p>
                </div>
                <div class="divider-small-p"></div>
                <div class="row input center">
                    <p class="submit"><input class ="btn-xxx"type="submit" name="commit" value="CONNEXION"></p>
                </div>
            </form>
        </div>

        <a class="btn-new-acc" href="creation-compte.php"> CREATION DE COMPTE
            </a>

    </div>
    </div>

</div>




    <!-- /.row -->
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
    <script src="js/scripts.js"></script>
</body>
</html>