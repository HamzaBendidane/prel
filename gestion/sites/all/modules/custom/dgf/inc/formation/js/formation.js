(function($) {
    jQuery(document).ready(function($) {
        
        autoSettingIntituleFormationByQCP();
        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#etape-cerfa").show();
        
        // Les Datepickers
        gestDatepicker();
        
        // Les tooltips
        gestTooltips();

        //  Chargement
        gestTypeQualificaton();
        
        modifyAnnualDistribution();
        
        $('#edit-type-qualification').change(function() {
            // Changement de type de qualification
            gestTypeQualificaton();
        });
        
        $('#edit-training-start').change( function () {
            // Perte focus training-start 
            modifyAnnualDistribution();
        });
        $('#edit-date-exam').change( function () {
            // Perte focus date-exam
            modifyAnnualDistribution();
        });
        
        // Gestion de la liste des formations recurrentes
        manageFormationRecurrentes();
        
        // Gestion de la modal de formation interne
        manageModalInternalTraining();
        
        manageModalQuitter();
        
        manageAutocomplete();
        
        share_gestion_autocomplete_code_label('referentiel', 'specialites_de_formation', 
                'specialty_training_code', 1, 'specialty_training_libelle', 1, 'specialty_training');
        
        share_gestion_autocomplete_code_label('extranet', 'ref_diplome', 
                'finalite_formation_code', 1, 'finalite_formation_label', 1, 'finalite_formation');
    });
    
    
})(jQuery);


var ID_CQPICQPM_RADIO = '#edit-type-qualification-1';
var ID_RNCP_RADIO = '#edit-type-qualification-2';
var ID_CLASSIF_RECONNUE_RADIO = '#edit-type-qualification-3'; 
var ID_CQPICQPM_DIV = '#edit-num-cqpi-cqpm';
        
function manageAutocomplete() {
    jQuery("#edit-libelle").change(function() {
        jQuery("input[name='id_libelle']" ).val('');
    });
    jQuery("#edit-libelle").autocomplete({
        source: '/autocomplete/get-intitule-formation',
        dataType: 'json',
        minLength : 2,
        search: function(event, ui) { 
            jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function( event, ui ) {
            jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            jQuery("#edit-libelle" ).val( jQuery.trim(ui.item.data.libelle));
            jQuery("input[name='id_libelle']" ).val(jQuery.trim(ui.item.data.id));
            return false;
        }
    });
}

function manageModalQuitter() {
    // gestion de la modale de validation
    jQuery('#edit-quit').click(function() {
        jQuery("#modalquit").modal("show");
    });
}

function modifyAnnualDistribution() {
    AnneeDebut = 0;
    AnneeFin = 0;
    // controle des dates "Date de début de la formation" et "Date de l'examen"
    var dtRegex = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
    
    var dated = jQuery('#edit-training-start').val();
    if(dtRegex.test(dated)) {
        var tab= (jQuery('#edit-training-start').val()).split("/");
        datedebut = new Date(tab[2] + '-' + tab[1] + '-' + tab[0]);
        AnneeDebut = datedebut.getUTCFullYear();
    };

    var datef = jQuery('#edit-date-exam').val();
    if(dtRegex.test(datef)) {
        var tab= (jQuery('#edit-date-exam').val()).split("/");
        datefin = new Date(tab[2] + '-' + tab[1] + '-' + tab[0]);
        AnneeFin = datefin.getUTCFullYear();
    };
    
    if( (AnneeDebut != 0) && (!isNaN(AnneeDebut))) {
        // Libellé des dates répartitions
        jQuery("[for='edit-year1']").text(AnneeDebut);
        jQuery("[for='edit-year2']").text(AnneeDebut + 1);
        jQuery("[for='edit-year3']").text(AnneeDebut + 2);
    }

    if((AnneeDebut != 0) && (!isNaN(AnneeDebut)) && (AnneeFin != 0) && (!isNaN(AnneeFin))) {
        // Affichage des textfileds
        var AnneeDebutP1 = AnneeDebut + 1;

        // Annee + 2
        if(AnneeDebutP1 >= AnneeFin) {
            jQuery('.form-item-year3').hide();
            jQuery('#edit-year3').val('');
        }
        else {
            jQuery('.form-item-year3').show();
        }
        // ANnee + 1
        if(AnneeDebut >= AnneeFin) {
            jQuery('.form-item-year1').hide();
            jQuery('#edit-year1').val('');
            jQuery('.form-item-year2').hide();
            jQuery('#edit-year2').val('');
            jQuery('#edit-annual-distribution').hide();
        }
        else {
            jQuery('.form-item-year1').show();
            jQuery('.form-item-year2').show();
            jQuery('#edit-annual-distribution').show();
        }
    }
    else {
        jQuery('#edit-annual-distribution').hide();
        jQuery('#edit-year1').val('');
        jQuery('#edit-year2').val('');
        jQuery('#edit-year3').val('');
    }
    
};

function manageModalInternalTraining() {
    // Affichage de la modal de formation interne 
    jQuery('#edit-internal-training').change(function() {
        if (jQuery('#edit-internal-training').is(':checked')) {
            jQuery("#modalinternaltraining").modal("show");
        }
    });
    
    // Quitter la modal
    jQuery('#internal_training_quit_modal').click(function() {
        jQuery("#modalinternaltraining").modal("hide");
    });
    
};

function gestTooltips() {

    jQuery('#total_duration_info').tooltip({
        placement : 'top'
    });
    
    jQuery('#duration_main_learning_info').tooltip({
        placement : 'top'
    });
    
    jQuery('#accompanying_actions_info').tooltip({
        placement : 'top'
    }); 
    
};

function gestDatepicker() {
    // le datepicker
    // ATTENTION : le format du datepicker est renouvelé lors de son appel
    // pour le calcul de la durée de formation, sinon retour au format par défaut.
    jQuery('.datePicker').datepicker({
        format: 'dd/mm/yyyy',
        language: 'fr',
        orientation: 'right',
        showOnFocus: false
    }).on('changeDate', function(e) {
        // jQuery(this).datepicker('hide');
        modifyAnnualDistribution();
    });
};


// Modifier la valeur de type de qualication
function setTypeQualificaton (type_qualification) {
    // Gestion du type de qualification
    divParent = jQuery('.form-item-type-qualification > label.option:contains("' + type_qualification + '")').parent();
    divParent.find('input').prop('checked', true);
    
    if(jQuery(ID_CLASSIF_RECONNUE_RADIO).prop('checked') && jQuery('.form-item-internal-training').length != 0) {
            jQuery("#modalinternaltraining").modal("show");
            jQuery("#edit-internal-training").prop('checked', true);
    }
    showCQPICQPM();
}

function gestTypeQualificaton () {
    // Gestion du type de qualification
    jQuery('#edit-type-qualification').prop('checked', true);
    if (jQuery('.form-item-internal-training').length != 0) {
        if(jQuery(ID_CLASSIF_RECONNUE_RADIO).prop('checked')) {
            jQuery("#edit-internal-training").prop('checked', true);
            jQuery("#modalinternaltraining").modal("show");
        } else {
            jQuery("#edit-internal-training").prop('checked', false);
        }
    }
    showCQPICQPM();
}

function showCQPICQPM() {
        // Affichage de N° CQPI/CQPM
    if (jQuery(ID_CQPICQPM_RADIO).prop('checked') || jQuery(ID_CLASSIF_RECONNUE_RADIO).prop('checked')) {
        jQuery(ID_CQPICQPM_DIV).show();
    }
    else {
        jQuery(ID_CQPICQPM_DIV).hide();
    }
}
function manageFormationRecurrentes() {
    // Gestion de la liste de formation récurrentes
    jQuery('.list-group-item').click(function() {
        
        var element = jQuery(this);
        populateFormation(element);
        
    });
}

//remplir formation avec les donnees des formations recurrente choisie
function populateFormation(element) {
    //on prend l'objet de formation reccurente choisi
    if(!element.hasClass('last-check')) {
    
        element.parent().children().removeClass('last-check');
        element.addClass('last-check');
        
        jQuery('#edit-num-cqpi-cqpm').val(element.data('num-cqpi'));
        jQuery('#edit-libelle').val(element.data('libelle'));
        jQuery('#edit-total-duration').val(element.data('duree-totale-heure'));
        jQuery('#edit-duration-main-learning').val(element.data('duree-ens-gen-heure'));
        jQuery('#edit-accompanying-actions').val(element.data('duree-acc-heure'));
        setSpecialite(element.data('specialite'));
        set_finalite_formation(element.data('finalite-formation'));
        jQuery('#edit-year1').val(element.data('repartition-1'));
        jQuery('#edit-year2').val(element.data('repartition-2'));
        jQuery('#edit-year3').val(element.data('repartition-3'));
        setTypeQualificaton(element.data('type-qualification'));
        
        modifyAnnualDistribution();
    }
}

function setFinaliteFormation(finalite_formation) {
    //prendre list de labels de type de qualification
    var labels = jQuery("#edit-type-qualification").find('label');
    for (var i in labels) {
        var html = jQuery(labels[i]).html();
        //retrouver le label de finalite formation choisi
        if (html == finalite_formation) {
            //prendre l'input correspondant
            var input = jQuery(labels[i]).parent().find('input');
            jQuery(input).prop("checked", true);
            
            if (jQuery(input).attr('id') == jQuery(ID_CLASSIF_RECONNUE_RADIO).attr('id')) {
                jQuery('#edit-internal-training').prop('checked', true);
            }

            showCQPICQPM();
            return false;
        }
    }
}

function setSpecialite(specialite) {
    jQuery('#edit-specialty-training option:contains("' + specialite + '")').attr("selected",true);
    return true;
}

function set_finalite_formation(finalite_formation) {
    jQuery('#edit-finalite-formation option:contains("' + finalite_formation + '")').attr("selected",true);
    return true;
}


function setRepartitionInfo(repartition) {
    if(jQuery(ID_CQPICQPM_DIV).is(':hidden')) {
        return false;
    }
        
    //construit un array des annes a repartir depuis ce qui sont visible
    var years = [];
    for (var i=1; i<4; i++) {
        var label = "[for='edit-year" + i + "']";
        if(jQuery(label).is(':visible')) {
            years.push(jQuery(label).text());
        }
    }
    
    if(years.length == 0) {
        return false;
    }
    
    //rempli les inputs correspondant avec les infos de repartition
    for (var i in repartition) {       
        if(!repartition[i].hasOwnProperty('annee') || !repartition[i].hasOwnProperty('repartition_heure')) {
            continue;
        }
        var position = years.indexOf(repartition[i].annee);
        if (position == -1) {
            continue;
        }
        jQuery('#edit-year' + (position +1)).val(repartition[i].repartition_heure);
    }
}

//convert date to the for,at of dd/mm/YYYY
function convertDate(dateToFormat) {
    if (!dateToFormat) {
        return null;
    }
    var data = new Date(dateToFormat); 
    var date = (data.getDate() < 10 ) ? "0" + data.getDate() : data.getDate();
    var month = (data.getMonth() + 1 < 10 ) ? "0" + (data.getMonth()+1) : data.getMonth() + 1;
    return date + '/' + month + '/' + data.getFullYear();
}

/**
 * Rempli automatiquement le champs #edit-libelle selon le QCP saisi
 */
function autoSettingIntituleFormationByQCP() {
    jQuery('#edit-num-cqpi-cqpm').keyup(function() {
        if (jQuery('#edit-num-cqpi-cqpm').val().length > 2) {
            cqp = jQuery('#edit-num-cqpi-cqpm').val();
        jQuery.ajax({
            type: 'GET',
            url: '/dgf/demande/formation/ajax/get-intitule-from-cqp/',
            data: {cqp: cqp},
            dataType: 'text',
            error : function(request, status, error) {
                console.log(status);
                console.log(error);
            },
            success: function(data, status, request) {
                var libelle = jQuery.parseJSON(data);
                jQuery('#edit-libelle').val(libelle);
            },
        });
        }
    });
}