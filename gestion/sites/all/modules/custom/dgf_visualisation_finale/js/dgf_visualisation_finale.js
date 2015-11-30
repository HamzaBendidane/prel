(function($){
    jQuery(document).ready(function($) {
        var page = $("#page").val();
        showOnglet(page);
       
        $('.synthese').click(function() {
            showOnglet('synthese');
            return false;
        });

        $('.justificatif').click(function() {
            showOnglet('pieces');
            return false;
        });

        $('.justificatif_paiement').click(function() {
            showOnglet('justifs');
            return false;
        });
        
        $('#edit-next').click(function(e) {
            e.preventDefault();
            showNextOnglet();
            return false;
        });
        
        $('#edit-back').click(function(e) {
            e.preventDefault();
            showPreviousOnglet();
            return false;
        });
        
        $('#edit-quit').click(function(e) {
            window.location.href = '/suivi/demande';
            return false;
        });
    });
})(jQuery)

function showOnglet(onglet) {
	if (onglet == 'justifs') {
        jQuery(".onglet").removeClass('active');
        jQuery("#justificatif-paiement-onglet").addClass('active');
        jQuery("#justificatif_paiement").show();
        jQuery("#edit-next").hide();
        jQuery("#edit-back").show();
        jQuery('#synthese').hide();
        jQuery('#justificatif').hide();
    } else if (onglet == 'pieces') {
        jQuery(".onglet").removeClass('active');
        jQuery("#justificatif-onglet").addClass('active');
        jQuery('#justificatif').show();
        jQuery("#edit-back").show();
        jQuery("#edit-next").show();
        jQuery('#synthese').hide();
        jQuery("#justificatif_paiement").hide();
    } else {
    	jQuery(".onglet").removeClass('active');
        jQuery("#synthese-onglet").addClass('active');
        jQuery("#edit-back").hide();
        jQuery("#edit-next").show();
        jQuery('#synthese').show();
        jQuery('#justificatif').hide();
        jQuery("#justificatif_paiement").hide();
    }
}

function showNextOnglet() {
    var currentOnglet = getCurrentOnglet();
    if (currentOnglet == "#synthese") {
        jQuery("#page").val('pieces');
        showOnglet('pieces');
        return false;
    }
    if (currentOnglet == "#justificatif") {
        jQuery("#page").val('justifs');
        showOnglet('justifs');
        return false;
    }
    if (currentOnglet == "#justificatif_paiement") {
        $("#page").val('justifs');
        return false;
    }
}

function showPreviousOnglet() {
    var currentOnglet = getCurrentOnglet();
    if (currentOnglet == "#synthese") {
        jQuery("#page").val('synthese');
        return false;
    }
    if (currentOnglet == "#justificatif") {
        jQuery("#page").val('synthese');
        showOnglet('synthese');
        return false;
    }
    if (currentOnglet == "#justificatif_paiement") {
        jQuery("#page").val('pieces');
        showOnglet('pieces');
        return false;
    }
}

function getCurrentOnglet() {
    if (jQuery("#justificatif_paiement").is(':visible')) {
        return "#justificatif_paiement";
    }
    
    if (jQuery("#justificatif").is(':visible')) {
        return "#justificatif";
    }
    
    if (jQuery("#synthese").is(':visible')) {
        return "#synthese";
    }
}