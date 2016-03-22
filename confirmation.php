<?php
/*****************************************************************************
 *
 * "Open source" kit for Monetico Paiement (TM)
 *
 * File "Phase1Go.php":
 *
 * Author   : Euro-Information/e-Commerce
 * Version  : 4.0
 * Date      : 05/06/2014
 *
 * Copyright: (c) 2014 Euro-Information. All rights reserved.
 * License  : see attached document "License.txt".
 *
 *****************************************************************************/

// =============================================================================================================================================================
// SECTION INCLUDE :  Cette section ne doit pas être modifié.
// Attention !! MoneticoPaiement_Config contient la clé, vous devez protéger ce fichier avec tous les mécanismes disponibles dans votre environnement de développement.
// Vous pouvez pour l'instance mettre ce fichier dans un autre répertoire et/ou changer son nom. Dans ce cas, n'oubliez pas d'adapter le chemin d'inclusion ci-dessous.
//
// INCLUDE SECTION :  This section must not be modified
// Warning !! MoneticoPaiement_Config contains the key, you have to protect this file with all the mechanism available in your development environment.
// You may for instance put this file in another directory and/or change its name. If so, don't forget to adapt the include path below.
// =============================================================================================================================================================

require_once("monetico/MoneticoPaiement_Config.php");

// PHP implementation of RFC2104 hmac sha1 ---
require_once("monetico/MoneticoPaiement_Ept.inc.php");

// =============================================================================================================================================================
// FIN SECTION INCLUDE
//
// END INCLUDE SECTION
// =============================================================================================================================================================

// =============================================================================================================================================================
// SECTION PAIEMENT : Cette section doit être modifiée
// Ci-après, vous trouverez un exemple des valeurs requises pour effectuer un paiement en utilisant la solution Monetico Paiement.
// L'ordre des variables et le format des valeurs doivent correspondre aux spécifications techniques.
//
// PAYMENT SECTION :  This section must be modified
// Here after, you will find an example of the values needed to demand a payment using the Monetico paiement solution.
// The order of the variables and the format of the values must follow the technical specification.
// =============================================================================================================================================================
// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// SECTION PAIEMENT - Section générale
//
// PAYMENT SECTION - General section
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

// Reference: unique, alphaNum (A-Z a-z 0-9), 12 characters max
$sReference = "ref" . date("His");

// Amount : format  "xxxxx.yy" (no spaces)
$sMontant = 1.01;

// Currency : ISO 4217 compliant
$sDevise  = "EUR";

// free texte : a bigger reference, session context for the return on the merchant website
$sTexteLibre = "Texte Libre";

// transaction date : format d/m/y:h:m:s
$sDate = date("d/m/Y:H:i:s");

// Language of the company code
$sLangue = "FR";

// customer email
$sEmail = "test@test.zz";

$sOptions = "";

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// SECTION PAIEMENT FRACTIONNE - Section spécifique au paiement fractionné
//
// INSTALMENT PAYMENT SECTION - Section specific to the installment payment
// -------------------------------------------------------------------------------------------------------------------------------------------------------------

// between 2 and 4
// entre 2 et 4
//$sNbrEch = "4";
$sNbrEch = "";

// date echeance 1 - format dd/mm/yyyy
//$sDateEcheance1 = date("d/m/Y");
$sDateEcheance1 = "";

// montant �ch�ance 1 - format  "xxxxx.yy" (no spaces)
//$sMontantEcheance1 = "0.26" . $sDevise;
$sMontantEcheance1 = "";

// date echeance 2 - format dd/mm/yyyy
$sDateEcheance2 = "";

// montant �ch�ance 2 - format  "xxxxx.yy" (no spaces)
//$sMontantEcheance2 = "0.25" . $sDevise;
$sMontantEcheance2 = "";

// date echeance 3 - format dd/mm/yyyy
$sDateEcheance3 = "";

// montant �ch�ance 3 - format  "xxxxx.yy" (no spaces)
//$sMontantEcheance3 = "0.25" . $sDevise;
$sMontantEcheance3 = "";

// date echeance 4 - format dd/mm/yyyy
$sDateEcheance4 = "";

// montant �ch�ance 4 - format  "xxxxx.yy" (no spaces)
//$sMontantEcheance4 = "0.25" . $sDevise;
$sMontantEcheance4 = "";

// =============================================================================================================================================================
// FIN SECTION PAIEMENT
//
// END PAYMENT SECTION
// =============================================================================================================================================================

// =============================================================================================================================================================
// SECTION CODE : Cette section ne doit pas être modifiée
//
// CODE SECTION : This section must not be modified
// =============================================================================================================================================================

$oEpt = new MoneticoPaiement_Ept($sLangue);
$oHmac = new MoneticoPaiement_Hmac($oEpt);

// Control String for support
$CtlHmac = sprintf(MONETICOPAIEMENT_CTLHMAC, $oEpt->sVersion, $oEpt->sNumero, $oHmac->computeHmac(sprintf(MONETICOPAIEMENT_CTLHMACSTR, $oEpt->sVersion, $oEpt->sNumero)));

// Data to certify
$phase1go_fields = sprintf(MONETICOPAIEMENT_PHASE1GO_FIELDS,     $oEpt->sNumero,
    $sDate,
    $sMontant,
    $sDevise,
    $sReference,
    $sTexteLibre,
    $oEpt->sVersion,
    $oEpt->sLangue,
    $oEpt->sCodeSociete,
    $sEmail,
    $sNbrEch,
    $sDateEcheance1,
    $sMontantEcheance1,
    $sDateEcheance2,
    $sMontantEcheance2,
    $sDateEcheance3,
    $sMontantEcheance3,
    $sDateEcheance4,
    $sMontantEcheance4,
    $sOptions);

// MAC computation
$sMAC = $oHmac->computeHmac($phase1go_fields);

// =============================================================================================================================================================
// FIN SECTION CODE
//
// END CODE SECTION
// =============================================================================================================================================================
?>
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
    $stages = $stages->get_by_id($_POST['id_stage']);
    $stages = array_pop($stages);

    global $user;

    if ($user->uid){
        $stagiaire = new db_stagiaires();
        $stagiaire = $stagiaire->get_by_fields(array('id_drupal_user' => $user->uid));
        $data = array_pop($stagiaire);
    	
    }
    if ($_POST['id_stage'] && $data['id']){
        $dbInscription = new db_inscription();

        $dbInscription->insert(array('id_stage' => $_POST['id_stage'],'id_stagiaire' => $data['id'],'statut' => 1 ));
    }else{
        drupal_goto('index.php');
    }



    /*****************************************************************************
     *
     * "Open source" kit for Monetico Paiement (TM)
     *
     * File "Phase1Go.php":
     *
     * Author   : Euro-Information/e-Commerce
     * Version  : 4.0
     * Date      : 05/06/2014
     *
     * Copyright: (c) 2014 Euro-Information. All rights reserved.
     * License  : see attached document "License.txt".
     *
     *****************************************************************************/

    // =============================================================================================================================================================
    // SECTION INCLUDE :  Cette section ne doit pas être modifié.
    // Attention !! MoneticoPaiement_Config contient la clé, vous devez protéger ce fichier avec tous les mécanismes disponibles dans votre environnement de développement.
    // Vous pouvez pour l'instance mettre ce fichier dans un autre répertoire et/ou changer son nom. Dans ce cas, n'oubliez pas d'adapter le chemin d'inclusion ci-dessous.
    //
    // INCLUDE SECTION :  This section must not be modified
    // Warning !! MoneticoPaiement_Config contains the key, you have to protect this file with all the mechanism available in your development environment.
    // You may for instance put this file in another directory and/or change its name. If so, don't forget to adapt the include path below.
    // =============================================================================================================================================================

    require_once("monetico/MoneticoPaiement_Config.php");

    // PHP implementation of RFC2104 hmac sha1 ---
    require_once("monetico/MoneticoPaiement_Ept.inc.php");

    // =============================================================================================================================================================
    // FIN SECTION INCLUDE
    //
    // END INCLUDE SECTION
    // =============================================================================================================================================================

    // =============================================================================================================================================================
    // SECTION PAIEMENT : Cette section doit être modifiée
    // Ci-après, vous trouverez un exemple des valeurs requises pour effectuer un paiement en utilisant la solution Monetico Paiement.
    // L'ordre des variables et le format des valeurs doivent correspondre aux spécifications techniques.
    //
    // PAYMENT SECTION :  This section must be modified
    // Here after, you will find an example of the values needed to demand a payment using the Monetico paiement solution.
    // The order of the variables and the format of the values must follow the technical specification.
    // =============================================================================================================================================================
    // -------------------------------------------------------------------------------------------------------------------------------------------------------------
    // SECTION PAIEMENT - Section générale
    //
    // PAYMENT SECTION - General section
    // -------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Reference: unique, alphaNum (A-Z a-z 0-9), 12 characters max
    $sReference = "ref" . date("His");
    // Amount : format  "xxxxx.yy" (no spaces)
    $sMontant = $stages['tarif_reference'];

    // Currency : ISO 4217 compliant
    $sDevise  = "EUR";

    // free texte : a bigger reference, session context for the return on the merchant website
    $sTexteLibre = "Texte Libre";

    // transaction date : format d/m/y:h:m:s
    $sDate = date("d/m/Y:H:i:s");

    // Language of the company code
    $sLangue = "FR";

    // customer email
    $sEmail = "bendidane@hotmail.com";

    $sOptions = "";

    // -------------------------------------------------------------------------------------------------------------------------------------------------------------
    // SECTION PAIEMENT FRACTIONNE - Section spécifique au paiement fractionné
    //
    // INSTALMENT PAYMENT SECTION - Section specific to the installment payment
    // -------------------------------------------------------------------------------------------------------------------------------------------------------------

    // between 2 and 4
    // entre 2 et 4
    //$sNbrEch = "4";
    $sNbrEch = "";

    // date echeance 1 - format dd/mm/yyyy
    //$sDateEcheance1 = date("d/m/Y");
    $sDateEcheance1 = "";

    // montant �ch�ance 1 - format  "xxxxx.yy" (no spaces)
    //$sMontantEcheance1 = "0.26" . $sDevise;
    $sMontantEcheance1 = "";

    // date echeance 2 - format dd/mm/yyyy
    $sDateEcheance2 = "";

    // montant �ch�ance 2 - format  "xxxxx.yy" (no spaces)
    //$sMontantEcheance2 = "0.25" . $sDevise;
    $sMontantEcheance2 = "";

    // date echeance 3 - format dd/mm/yyyy
    $sDateEcheance3 = "";

    // montant �ch�ance 3 - format  "xxxxx.yy" (no spaces)
    //$sMontantEcheance3 = "0.25" . $sDevise;
    $sMontantEcheance3 = "";

    // date echeance 4 - format dd/mm/yyyy
    $sDateEcheance4 = "";

    // montant �ch�ance 4 - format  "xxxxx.yy" (no spaces)
    //$sMontantEcheance4 = "0.25" . $sDevise;
    $sMontantEcheance4 = "";

    // =============================================================================================================================================================
    // FIN SECTION PAIEMENT
    //
    // END PAYMENT SECTION
    // =============================================================================================================================================================

    // =============================================================================================================================================================
    // SECTION CODE : Cette section ne doit pas être modifiée
    //
    // CODE SECTION : This section must not be modified
    // =============================================================================================================================================================

    $oEpt = new MoneticoPaiement_Ept($sLangue);
    $oHmac = new MoneticoPaiement_Hmac($oEpt);

    // Control String for support
    $CtlHmac = sprintf(MONETICOPAIEMENT_CTLHMAC, $oEpt->sVersion, $oEpt->sNumero, $oHmac->computeHmac(sprintf(MONETICOPAIEMENT_CTLHMACSTR, $oEpt->sVersion, $oEpt->sNumero)));

    // Data to certify
    $phase1go_fields = sprintf(MONETICOPAIEMENT_PHASE1GO_FIELDS,     $oEpt->sNumero,
        $sDate,
        $sMontant,
        $sDevise,
        $sReference,
        $sTexteLibre,
        $oEpt->sVersion,
        $oEpt->sLangue,
        $oEpt->sCodeSociete,
        $sEmail,
        $sNbrEch,
        $sDateEcheance1,
        $sMontantEcheance1,
        $sDateEcheance2,
        $sMontantEcheance2,
        $sDateEcheance3,
        $sMontantEcheance3,
        $sDateEcheance4,
        $sMontantEcheance4,
        $sOptions);

    // MAC computation
    $sMAC = $oHmac->computeHmac($phase1go_fields);


    ?>
    <!-- Projects Row -->
    <div class="row bg-ctIn">

        <div class="center" style="width: 120px;">
            <H1 class="title">PAIEMENT</H1>
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
            <h2>CONFIRMATION ET PAIEMENT</h2>
        </div>
    </div>

    <div class="large center">

        <div id="header">
            <a href="http://www.monetico.ca"><img src="logomoneticopaiement.png" alt="Monetico Paiement" title="Monetico Paiement" /></a>
        </div>


        
        <h1>Connexion au serveur de paiement</h1>

        <div id="frm">

            <!--============================================================================================================================================================
              SECTION FORMULAIRE : cette section doit être copiée dans votre propre page afin d'afficher le bouton de paiement. Aucune modification n'est requise.

              FORM SECTION : this section must be copied into your own page in order to display payment button. No modification are needed.
            =============================================================================================================================================================-->
            <form action="<?php echo $oEpt->sUrlPaiement;?>" method="post" id="PaymentRequest">
                <p>
                    <input type="hidden" name="version"             id="version"        value="<?php echo $oEpt->sVersion;?>" />
                    <input type="hidden" name="TPE"                 id="TPE"            value="<?php echo $oEpt->sNumero;?>" />
                    <input type="hidden" name="date"                id="date"           value="<?php echo $sDate;?>" />
                    <input type="hidden" name="montant"             id="montant"        value="<?php echo $sMontant . $sDevise;?>" />
                    <input type="hidden" name="reference"           id="reference"      value="<?php echo $sReference;?>" />
                    <input type="hidden" name="MAC"                 id="MAC"            value="<?php echo $sMAC;?>" />
                    <input type="hidden" name="url_retour"          id="url_retour"     value="<?php echo $oEpt->sUrlKO;?>" />
                    <input type="hidden" name="url_retour_ok"       id="url_retour_ok"  value="<?php echo $oEpt->sUrlOK;?>" />
                    <input type="hidden" name="url_retour_err"      id="url_retour_err" value="<?php echo $oEpt->sUrlKO;?>" />
                    <input type="hidden" name="lgue"                id="lgue"           value="<?php echo $oEpt->sLangue;?>" />
                    <input type="hidden" name="societe"             id="societe"        value="<?php echo $oEpt->sCodeSociete;?>" />
                    <input type="hidden" name="texte-libre"         id="texte-libre"    value="<?php echo HtmlEncode($sTexteLibre);?>" />
                    <input type="hidden" name="mail"                id="mail"           value="<?php echo $sEmail;?>" />
                    <!-------------------------------------------------------------------------------------------------------------------------------------------------------------
                      SECTION PAIEMENT FRACTIONNE - Section spécifique au paiement fractionné

                      INSTALLMENT PAYMENT SECTION - Section specific to the installment payment
                    -------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <input type="hidden" name="nbrech"              id="nbrech"         value="<?php echo $sNbrEch;?>" />
                    <input type="hidden" name="dateech1"            id="dateech1"       value="<?php echo $sDateEcheance1;?>" />
                    <input type="hidden" name="montantech1"         id="montantech1"    value="<?php echo $sMontantEcheance1;?>" />
                    <input type="hidden" name="dateech2"            id="dateech2"       value="<?php echo $sDateEcheance2;?>" />
                    <input type="hidden" name="montantech2"         id="montantech2"    value="<?php echo $sMontantEcheance2;?>" />
                    <input type="hidden" name="dateech3"            id="dateech3"       value="<?php echo $sDateEcheance3;?>" />
                    <input type="hidden" name="montantech3"         id="montantech3"    value="<?php echo $sMontantEcheance3;?>" />
                    <input type="hidden" name="dateech4"            id="dateech4"       value="<?php echo $sDateEcheance4;?>" />
                    <input type="hidden" name="montantech4"         id="montantech4"    value="<?php echo $sMontantEcheance4;?>" />
                    <!-------------------------------------------------------------------------------------------------------------------------------------------------------------
                      FIN SECTION PAIEMENT FRACTIONNE

                      END INSTALLMENT PAYMENT SECTION
                    -------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <input type="submit" name="bouton"              id="bouton"         value="Connexion / Connection" />
                </p>
            </form>
            <!--============================================================================================================================================================
              FIN SECTION FORMULAIRE

              END FORM SECTION
            =============================================================================================================================================================-->
        </div>

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
