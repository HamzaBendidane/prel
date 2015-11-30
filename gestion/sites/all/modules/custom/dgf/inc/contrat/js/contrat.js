(function($){
    jQuery(document).ready(function($) {
        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#etape-cerfa").show();
        if ($('#edit-monthly-gross-pay').attr('class') == 'form-text error'){
            $('#edit-monthly-gross-pay').val($('input[name=min_monthly_gross_pay]').val());
        }
        manageValidationModal();
        manageDatePicker();
        manageTooltip();
        calculateContractDuration();
        manageContractSelect();
        changeAttributeForSendingDatas();
        alertDate();
        
        var dates = getContractDates();
        
        share_gestion_autocomplete_code_label('referentiel', 'types_de_contrats', 'type_code', 1, 'type_libelle', 1, 'type');
        share_gestion_autocomplete_code_label('extranet', 'ref_groupe', 'group_code', 1, 'group_label', 1, 'group');
        //setDiffDays(dates);

    });
})(jQuery)

/**
 * Gère l'affichage de la modale de validation 
 */
function manageValidationModal() {
    // affichage de la modale de validation
    jQuery('#edit-quit').click(function() {
        jQuery('#modalquit').show();
        return false;
    });
    jQuery('.modalQuit').click(function() {
        jQuery('#modalquit').hide();
    });
}

/**
 * Gère les datePicker sur les champs date
 */
function manageDatePicker() {
    // le datepicker
    // ATTENTION : le format du datepicker est renouvelé lors de son appel
    // pour le calcul de la durée de formation (sinon retour au format par défaut).
    jQuery('.datePicker').datepicker({
        format: 'dd/mm/yyyy',
        language: 'fr',
        orientation: 'right',
        showOnFocus: false
    });
}

/**
 * Affiche les infobulles
 */
function manageTooltip() {
    // Les tooltips
    jQuery('#niveau_info').tooltip({
        placement : 'top'
    });
    jQuery('#coef_info').tooltip({
        placement : 'top'
    });
    jQuery('#group_info').tooltip({
        placement : 'top'
    });
    jQuery('#pay_info').tooltip({
        placement : 'top'
    });
}

/**
 * Calcule la différence en mois complet entre deux dates 
 * Appelée dans calculateContractDuration()
 * 
 * @param date d1
 * @param date d2
 * @returns int months
 */
function monthDiff(d1, d2) {
    var months = d2.getMonth() - d1.getMonth()
            + (12 * (d2.getFullYear() - d1.getFullYear()));

    if (d2.getDate() < d1.getDate()) {
        months--;
    }
    return months <= 0 ? 0 : months;
}

function daysDiff(d1, d2) {
    //si les jours sont les mêmes il y a pas le differnce en jours
    if (d1.getDate() == d2.getDate()) {
        return 0;
    }
    //si la date de debut est supérieur à la date de fin
    if (d1 > d2) {
        return 0;
    }
    //jour en milisecondes
    var msDay = 60*60*24*1000;
    //prend la date du mois suivant à la date de debut
    
    var firstDayOfNextMonth = new Date(d1.getFullYear(), d1.getMonth()+1, d2.getDate());
    var nbDaysInMonth = new Date(d1.getFullYear(), d1.getMonth() + 1, 0).getDate();
    var difference = (firstDayOfNextMonth - d1) / msDay;
    if (difference >= nbDaysInMonth) {
        difference = d2.getDate() - d1.getDate();
    }
    return difference <= 0 ? 0 : difference;
}
/**
 * Calcule la différence en mois entre la date de début et la date de fin du contrat
 */
function calculateContractDuration() {
    // Calcul de la durée de formation
    jQuery('#edit-date-begin, #edit-date-end').datepicker({format: 'dd/mm/yyyy',language: 'fr'}).bind("change", function () {
        
        var dates = getContractDates();       
        if (dates['begin'] && dates['end']) {
            setDiffDays(dates);
            setDiffMonths(dates);
        }
    });
}

/**
 * Recepurrer les dates  (begin / end) de contrat
 */
function getContractDates() {
    var dates = {'begin': null, 'end': null};
    var dateBeginVal = jQuery('#edit-date-begin').val();
    var s1 = dateBeginVal.split('/');
    dates['begin'] = new Date(s1[2], s1[1] - 1, s1[0]);

    var dateEndVal = jQuery('#edit-date-end').val();
    var s2 = dateEndVal.split('/');
    dates['end'] = new Date(s2[2], s2[1] - 1, s2[0]);
    return dates;
}
/**
 * Caclule la difference entre 2 deux dates en jours et l'affiche
 */
function setDiffDays(dates) {
    var diffDays = 0;
    diffDays = daysDiff(dates['begin'], dates['end']);
    if (isNaN(diffDays)) diffDays = 0;
    jQuery('#edit-training-duration-days').val(parseInt(diffDays));
}
/**
 * Caclule la difference entre 2 deux dates en mois et l'affiche
 */
function setDiffMonths(dates) {
    var diffMonth = 0;
    diffMonth = monthDiff(dates['begin'], dates['end']); 
    if (isNaN(diffMonth)) diffMonth = 0;
    jQuery('#edit-training-duration').val(parseInt(diffMonth));
}

/**
 * Affiche la modale de sélection du type de contrat selon le choix 'renouvellement'
 * Cette fonction n'est plus active 
 * --> changement de fonctionnement
 */
function manageContractSelect() {
    // Gestion du select de type de contrat
    jQuery('#edit-type').change(function() {
        var text = jQuery('#edit-type option:selected').text();

        if (text == 'Renouvellement') {
            jQuery('#typeModal').show();
        }
    });
}

/**
 * Retire l'attribut disabled des champs pour permettre le passage de la valeur au serveur
 */
function changeAttributeForSendingDatas() {
    // On retire l'attribut disable pour que les données saisies soient
    // envoyées au serveur.
    jQuery('form').bind('submit', function() {
        jQuery(this).find('select').removeAttr('disabled');
        jQuery(this).find('input').removeAttr('disabled');
    });

    jQuery('#edit-next').click(function() {
        jQuery(this).find('select').removeAttr('disabled');
        jQuery(this).find('input').removeAttr('disabled');
    });
}

/**
 * Alerte sur les dates d'envoi des dossiers
 **/

function alertDate() {
    jQuery('#edit-date-begin').change(function() {
        if (jQuery('#edit-date-begin').val().length == 10) {
            var diffDays = 0;
            $dateDebut = jQuery('#edit-date-begin').val().split("/");
            $dateDebut = new Date($dateDebut[2], $dateDebut[1] - 1, $dateDebut[0]);
            $dateJour = new Date();
            diffDays = daysDiff($dateDebut, $dateJour);
            diffMonth = monthDiff($dateDebut, $dateJour);
            if ($dateDebut < $dateJour) {
                if (diffDays > 5 || diffMonth >0) {
                	
                	jQuery( ".message-inline" ).html("<p>Nous vous rappelons que pour tout contrat de professionnalisation," +
                			" le dossier doit nous parvenir au plus tard dans les 5 jours (calendaires) " +
                			"qui suivent la date de début du contrat, veuillez-vous rapprocher de votre ADEFIM.</p>");
                }
                else {
                    jQuery( ".message-inline" ).html("");
                }
            } else {
                jQuery( ".message-inline" ).html("");
            }
        }
    });
}
