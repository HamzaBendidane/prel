<?php
$stage = new db_stage();
$stage = $stage->get_by_id($_GET['id']);
$stage = array_pop($stage);
$lieu = new db_lieu();
$lieu = $lieu->get_by_id($stage['id_lieu']);
$lieu = array_pop($lieu);
$animateur = new db_animateur();
$bafm =  $animateur->get_by_id($stage['id_bafm']);
$bafm =  array_pop($bafm);

$psy = $animateur = $animateur->get_by_id($stage['id_psy']);
$psy =  array_pop($psy);

$stagiaires  = new db_stagiaires();

$stagiaires = $stagiaires->get_by_fields(array('id_stage' => $_GET['id']));

?>
<section class="content-header">
    <h1>
        Stage
        <small>Inscrire un stagiaire au stage : </small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Admin</a></li>
        <li><a href="#">Stages</a></li>
        <li class="active">Inscrire un stagiaire</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-4">
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title">Animateurs</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <dl class="dl-horizontal">

                        <dt>PSYCHOLOGUE:</dt>
                        <dd><?php print $psy['nom'] . $psy['prenom'] ?></dd>
                        <dt>BAFM :</dt>
                        <dd><?php print $bafm['nom'] . $bafm['prenom'] ?></dd>
                    </dl>
                </div>
            </div><!-- /.box-body -->
        </div>


        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Information sur le stage</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <dl class="dl-horizontal">
                        <dt> Centre de Formations:</dt>
                        <dd><?php print $lieu['libelle'] ?></dd>
                        <dt>Premier jour:</dt>
                        <dd><?php print $stage['premier_jour_stage'] ?></dd>
                        <dt>Matin :</dt>
                        <dd><?php print $stage['heure_debut_matin'] . ' - '.$stage['heure_fin_matin']  ?></dd>
                        <dt>Après-midi :</dt>
                        <dd><?php print $stage['heure_debut_aprem'] . ' - '.$stage['heure_fin_aprem']  ?></dd>
                        <dt>Capacité de la salle :</dt>
                        <dd><?php print $stage['capacite_salle'] ?></dd>
                    </dl>

                </div>

            </div><!-- /.box-body -->


        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Stagiaires</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">

                    <a style="width:95%;margin-bottom:5px;" class="btn btn-default btn-xs" href="documents/courrier_type_ministere.pdf">Création des attestations</a>
                    <a style="width:95%;margin-bottom:5px;" class="btn	 btn-default btn-xs" href="documents/demande_interruption_action.pdf">Imprimer la liste</a>
                    <a style="width:95%;margin-bottom:5px;" class="btn btn-default btn-xs" href="documents/demande_remboursement_amende.pdf?v=2">Feuille d'émargement</a>
                </div>

            </div><!-- /.box-body -->

        </div>
        <div class="col-md-4">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Documents</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <div class="panel-body">
                        <a style="width:95%;margin-bottom:5px;" class="btn btn-default btn-xs" href="documents/courrier_type_ministere.pdf">Courrier type Ministère</a>
                        <a style="width:95%;margin-bottom:5px;" class="btn	 btn-default btn-xs" href="documents/demande_interruption_action.pdf">Demande d'interruption</a>
                        <a style="width:95%;margin-bottom:5px;" class="btn btn-default btn-xs" href="documents/demande_remboursement_amende.pdf?v=2">Demande de remboursement</a>
                    </div>
                </div>

            </div><!-- /.box-body -->

        </div>

        <div class="col-md-12">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title">Liste des stagiaires inscrits et pré-inscrits</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <div class="row">
                    <?php
                    foreach($stagiaires as $value) {
                        ?>
                        <div class=" col-md-2">

                            <div class="box-body">
                                <div class="info-box">
                                    <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-number"><?php print $value['nom'] .' '. $value['prenom']?></span>
                                        <span class="info-box-text"><?php print $value['telephone'] .' - '. $value['telephone2']?></span>
                                        <span class="info-box-text"><?php print $value['email']?></span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div><!-- /.box-body -->

        </div>

    </div>
