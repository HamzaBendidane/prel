(function($){
    jQuery(document).ready(function($) {
    	manageMessageContratPro();
    	$('#edit-rappel-contrat-pro').hide(); // Cache le message de rappel 
        $("#etape-cerfa").removeAttr("style");
    	$(".form-item-nature-formation").hide();
    	$("input[type=radio][name=nature_demande]").change(function() {
          $(".form-item-nature-formation, .radio-separator").toggle($(this).val() == '2');
        });
        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#cerfa_image").hide();
        $("#etape-cerfa").hide(); // Cache le cerfa

        // On l'affiche au click de contrat pro.
        // $('#edit-nature-demande-1').on( "click", function() {
        	 // $('#edit-rappel-contrat-pro').show();
        // });

		// Affichage par défaut selon la nature demande enregistrée
        if ($("#edit-nature-demande-1").is('checked')) {
        	$("#etape-cerfa").show();
			$('#edit-rappel-contrat-pro').show();
        }
    });
})(jQuery);

/**
 * Gère l'affichage du message relatif au choix "contrat de professionnalisation"
 */
function manageMessageContratPro() {
	jQuery('input[type="radio"]').click(function() {
	       if(jQuery(this).attr('id') == 'edit-nature-demande-1') {
	    	   jQuery("#cerfa_image").show();
	    	   jQuery("#etape-cerfa").show();
	    	   jQuery('#edit-rappel-contrat-pro').show();
	       }
	       else {
	    	   jQuery('#edit-rappel-contrat-pro').hide();
	    	   jQuery("#etape-cerfa").hide(); // Cache lors des autres selections
	    	   jQuery("#cerfa_image").hide();
	       }
     });
}