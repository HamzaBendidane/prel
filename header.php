<?php
define('DRUPAL_ROOT', realpath(dirname(__FILE__).'/gestion/'));
require_once DRUPAL_ROOT . '/includes/bootstrap.inc';

drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);
require_once 'gestion/sites/all/modules/custom/hardis/hardis_controller.inc';


$con = new db_contenu();

$permis = $con->get_by_fields(array('type' => 2));
$stages = $con->get_by_fields(array('type' => 1));
global $user;

function trom($data){

    $data = str_replace('<pre>','',$data);

    $data = str_replace('</pre>','',$data);

return $data;

}


?>
<header class="masthead">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 header">
                <a href="index.php"> <img src="logo.png"  class="logo"> <a>
            </div>
            <div class="col-sm-2 header">
            </div>
            <div class="col-sm-4 header login">
                <?php
                if ($user->uid) {
                    ?>
                    <div class="col-sm-8 head-log">
                        <?php print $user->name ?>
                        <br>
                        Elève
                    </div>
                    <div class="col-sm-4 head-log">
                        <a href="creation-compte.php?op=update">
                            <img src="user82.png">
                        </a>
                    </div>
                <?php
                }else{
                ?>
                    <div class="col-sm-8 head-log">
                        <a href="inscription.php">
                            <img src="images/connexion.png" width="100px" style = "padding-top: 0px; margin-top: 12px;">
                        </a>
                    </div>
                    <div class="col-sm-4 head-log">

                    </div>
                <?php
                }
                ?>
            </div>
        </div>
    </div>
</header>



<!-- Fixed navbar -->
<div class="navbar navbar-custom navbar-inverse navbar-static-top" id="nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="presentation.php">Présentation</a></li>
                <li class="dropdown">
                    <a href="stages.php" class="dropdown-toggle" data-toggle="dropdown">Permis <b class="caret"></b></a>
                    <ul class="dropdown-menu">

                        <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Permis voiture</a>
                            <ul class="dropdown-menu">
                                <li><a href="stages.php?id=8">La conduite accompagnée à 15 ans</a></li>
                                <li><a href="stages.php?id=8">Permis auto</a></li>
                                <li><a href="stages.php?id=9">formation classique</a></li>
                                <li><a href="stages.php?id=11">voiture automatique BEA</a></li>
                                <li><a href="stages.php?id=10">conduite supervisé</a></li>
                                <li><a href="stages.php?id=12">stage accéléré 10 jours</a></li>
                            </ul>
                        </li>
                        <li><a href="stages.php?id=19">Permis 1€ / jour</a></li>

                        <li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Permis moto</a>
                            <ul class="dropdown-menu">
                                <li><a href="stages.php?id=13">Permis moto</a></li>

                                <li><a href="stages.php?id=14">permis A1</a></li>

                                <li><a href="stages.php?id=15">permis A2</a></li>

                                <li><a href="stages.php?id=16">permis moto accéléré</a></li>


                            </ul>
                        </li>
                        <li><a href="stages.php?id=17">Permis maxi-scooter</a></li>
                        <li><a href="stages.php?id=18">Permis BE</a></li>
                        <li><a href="stages.php?id=20">Stage Code</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="stages.php" class="dropdown-toggle" data-toggle="dropdown">Stages <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <?php
                      foreach($stages as $value) {
                        ?>
                        <li><a href="stages.php?id=<?php print $value['id'] ?>"><?php print $value['titre'] ?></a></li>
                      <?php
                      }
                      ?>
                    </ul>
                </li>
                <li><a href="contact.php">Contact</a></li>
                <li><a href="acces.php">Accès</a></li>

            </ul>
        </div><!--/.nav-collapse -->
    </div><!--/.container -->
</div><!--/.navbar -->
