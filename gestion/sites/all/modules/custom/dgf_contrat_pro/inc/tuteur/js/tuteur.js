(function($){
    jQuery(document).ready(function($) {
        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#etape-cerfa").show();
        
        $("#vaBeneficierFormation").hide();
        jQuery('.datePicker').datepicker({
            format: 'dd/mm/yyyy',
            language: 'fr',
            orientation: 'right',
            showOnFocus: false,
        }).on('changeDate', function(e) {
          //  $(this).datepicker('hide');
        });
        if ($("input[name='modal']").val() == 'certification_tuteur') {
            if($("input[class='form-text error']").length == 0){
                $("#modal-certification-tuteur").modal("show");
            };
        }
        
        if ($("input[name='modal']").val() == 'message_information_final') {
            $("#modal-message-information-final").modal("show");
        }
       
        // gestion de la modale de validation
        $('#edit-quit').click(function() {
            $("#modalquit").modal("show");
        });
        
        $("#edit-modal-annuler").click(function() {
            $("#modal-certification-tuteur").modal("hide");
            return false;
        });

         $('#va_beneficier_info').tooltip({
             placement : 'bottom'
         });
         
         $( "#edit-beneficier-1" ).click(function() {
             $("#vaBeneficierFormation").show();
         });
         
        $( "#edit-beneficier-0" ).click(function() {
             $("#vaBeneficierFormation").hide();
             $("#edit-date-formation").val('');
             $("#edit-duree-formation").val('');
             $("#edit-nom-organisme").val('');
        });
        
        if ($( "#edit-beneficier-1" ).is(":checked")) {
            $("#vaBeneficierFormation").show();
        }
        
     // Autocompletion du champ siret
        $('#edit-lastname').autocomplete({
            source : function(requete, reponse){ // les deux arguments représentent les données nécessaires au plugin
                $.ajax({
                    url : '/autocomplete/get-salarie-from-name', // on appelle le script JSON
                    dataType : 'json', // on spécifie bien que le type de données est en JSON
                    data : {
                        term : $("#edit-lastname" ).val(), // on donne la chaîne de caractère tapée dans le champ de recherche
                        etablissement :  $("#edit-etablishment").length ? $("#edit-etablishment").val() : $("input[name='etablishment']" ).val()
                    },
                    success : function(donnee){
                        jQuery('#edit-lastname').parent().children('.field-suffix').children('.spinner').removeClass( "active" );
                        return reponse( donnee);
                    }
                });
            },
            
            search: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
            },
            open: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
            change: function( event, ui ) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
            minLength : 3,
            select: function( event, ui ) {
                $("#edit-lastname" ).val($.trim(ui.item.data.nom));
                $("#edit-firstname" ).val($.trim(ui.item.data.prenom));
                $("#edit-birthday" ).val(ui.item.data.date_de_naissance);
                $("input[name='id_salarie']").val($.trim(ui.item.data.id));
                
                if (ui.item.data.id_niveau_de_formation_actuel) {
                    $("#edit-dernier-diplome").val($.trim(ui.item.data.id_niveau_de_formation_actuel));
                }

                
//                // TODO : données à ne pas remplir :
//                $("#edit-highest-level").val();
//                $("#edit-social-beneficiary").val();
//                $("#edit-last-status").val();
//                $("#edit-pole-emploi-number").val();
//                $("#edit-since-month").val();
//                $("#edit-pension-fund").val();
//                $("#edit-contingency-fund").val();
//                $("#edit-info-juridique").val();
//                
//                // TODO : données manquantes dans le référentiel :
//                $("#edit-address" ).val();
//                $("#edit-zip-code" ).val();
//                $("#edit-city" ).val();
//                $("#edit-phone-number").val();
//                $("#edit-email").val();
                
                return false;
            }
        });
        
        if ($(".form-item-dateFormation input").hasClass("error")
                || $(".form-item-dureeFormation input").hasClass("error")
                || $(".form-item-nomOrganisme input").hasClass("error")) {
            $("#vaBeneficierFormation").show();
        }
        
        //Autocompletion
        autocompleteEtablissement();
        
        share_gestion_autocomplete_code_label('extranet', 'ref_diplome', 
        		'dernier_diplome_code', 1, 'dernier_diplome_label', 1, 'dernier_diplome');
        
    });
    
  //Autocomplete Etablissement
    function autocompleteEtablissement() {
    	
    	$("#edit-tout-etablissement.autocomplete-siret").autocomplete({
            source: '/autocomplete/entreprise-by-siret-or-raison-social',
            dataType: 'json',
            minLength : 3,
            search: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
            },
            response: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
            select: function( event, ui ) {
            	$("input[name='etablishment']").val($.trim(ui.item.data.id));
            }
        });
    	
    }
    
})(jQuery)