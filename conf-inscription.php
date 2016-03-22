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

    module_load_include('inc', 'login','login_form');
    module_load_include('inc', 'login','login_form_submit');
    module_load_include('inc', 'login','login_langs');

    $login_form = drupal_get_form('login_site_form') ;

    ?>

    <!-- Projects Row -->
    <div class="row bg-ctIn">

        <div class="center" style="width: 120px;">
            <H1 class="title">INSCRIPTION</H1>
        </div>
        </div>
    <div class="divider-small-px">
        <div class="row bar-title">
            <h2>Votre inscritption a été prise en compte</h2>
            <h4>Nous vous remercions de vous être inscrit sur notre site http://cer-prelude.fr.<br>

                Afin de finaliser votre inscription merci de cliquer sur le lien que vous avez recu par Mail .<br>

                Une fois votre compte validé vous pourrez vous inscrir au stages <br>

                Pour ce faire, il vous suffira d'indiquer lors de l'inscription
                votre identifiant  et votre mot de passe.<br>

                En cas d'oubli de mot de passe vous pourrez le réinitialiser via le lien
                ci-dessous :
                http://cer-prelude.fr/user/password

                L'équipe d'Ecofolio</h4>
        </div>
        <div class="row bar-title2">

        </div>
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