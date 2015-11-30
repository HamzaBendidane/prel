(function($){
    jQuery(document).ready(function($) {

        share_gestion_autocomplete_code_label('referentiel', 'v_conventions_collectives', 'collective_convention_code', 1, 
                'collective_convention_libelle', 1, 'collective_convention');

        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#etape-cerfa").show();

        var dob = $("#edit-birthday").val();
        if (dob.length == 10) {
            var age = get_age(dob);
            $("#edit-age").val(age);
        }

             $("#edit-plus-26-ans").toggle($("#edit-pole-emploi-number").val() == '' && parseInt($("#edit-age").val()) >= 26 && ($("#edit-last-status").val() == '11' || $("#edit-last-status").val() == '10'));                toggle_pole_emploi_fields();

        var now = new Date();

        jQuery('.datePicker').datepicker({
            format: 'dd/mm/yyyy',
            language: 'fr',
            endDate: new Date(),
            orientation: 'right',
            showOnFocus: false,
            defaultViewDate: {
                year: now.getFullYear() - 18,
                month: now.getMonth(),
                day: now.getDate()
            }
        }).on('changeDate', function(e) {
           // $(this).datepicker('hide');
            var dob = $("#edit-birthday").val();
            if (dob.length == 10) {
                var age = get_age(dob);
                $("#edit-age").val(age);
            }
        });

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
            minLength : 3,
            search: function(event, ui) {
                jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
            },
            response : function(event, ui) {
                jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
            select: function( event, ui ) {
                $("#edit-lastname" ).val($.trim(ui.item.data.nom));
                $("#edit-firstname" ).val($.trim(ui.item.data.prenom));
                $("#edit-birthday" ).val(ui.item.data.date_de_naissance);
                $("#edit-age" ).val(get_age(ui.item.data.date_de_naissance));
                $("input[name='id_salarie']").val($.trim(ui.item.data.id));

                if (ui.item.data.id_civilite && $.trim(ui.item.data.id_civilite) == 'Mme') {
                    $("#edit-man-woman-mme").prop("checked", true);
                } else {
                    $("#edit-man-woman-m").prop("checked", true);
                }

                if (ui.item.data.est_travailleur_handicape && $.trim(ui.item.data.est_travailleur_handicape) == '1') {
                    $("#edit-handicapped-worker-1").prop("checked", true);
                } else {
                    $("#edit-handicapped-worker-0").prop("checked", true);
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
        
        $("#edit-pole-emploi-number").change(function() {
        	$("#edit-plus-26-ans").toggle($("#edit-pole-emploi-number").val() == '' && parseInt($("#edit-age").val()) >= 26 && ($("#edit-last-status-code").val() == '9' || $("#edit-last-status-code").val() == '10'));        });

        $("#edit-last-status-code").change(function() {
        	$("#edit-plus-26-ans").toggle($("#edit-pole-emploi-number").val() == '' && parseInt($("#edit-age").val()) >= 26 && ($("#edit-last-status-code").val() == '9' || $("#edit-last-status-code").val() == '10'));
        });
        // gestion de la modale de validation
        $('#edit-quit').click(function() {
            $("#modalquit").modal("show");
        });

        //tooltip
        $('#juridique_info').tooltip({
            placement : 'top'
        });
        $('#highest_level_tooltip').tooltip({
            placement : 'top'
        });

        // Autocompletion
        autocompleteEtablissement();
        
        // Gestion des champs codes postaux et villes
        share_gestion_autocomplete_code_postal_ville("zip_code","city");
        
        share_gestion_autocomplete_code_label('extranet', 'ref_diplome', 
        		'highest_level_code', 1, 'highest_level_label', 1, 'highest_level');

        share_gestion_autocomplete_code_label('extranet', 'ref_derniere_situation', 
        		'last_status_code', 1, 'last_status_label', 1, 'last_status');

        share_gestion_autocomplete_code_label('extranet', 'ref_beneficiaire_minimas_sociaux', 
        		'social_beneficiary_code', 1, 'social_beneficiary_label', 1, 'social_beneficiary');

        $("#edit-last-status-code").focusout(function(){
            toggle_pole_emploi_fields();
        });
        $("#edit-last-status-label").focusout(function(){
            toggle_pole_emploi_fields();
        });
    });

    

    function toggle_pole_emploi_fields() {
    	$(".form-item-pole-emploi-number, .form-item-since-month").toggle($("#edit-last-status-code").val() == 11 || $("#edit-last-status-code").val() == 10);
    }

    function get_age(born) {
        var now = new Date();
        var birthdate = born.split("/");
        var born = new Date(birthdate[2], birthdate[1]-1, birthdate[0]);
        var birthday = new Date(now.getFullYear(), born.getMonth(), born.getDate());
        var age;
        if (now >= birthday) {
          age = now.getFullYear() - born.getFullYear();
        } else {
          age = now.getFullYear() - born.getFullYear() - 1;
        }

             $("#edit-plus-26-ans").toggle($("#edit-pole-emploi-number").val() == '' && parseInt($("#edit-age").val()) >= 26 && ($("#edit-last-status").val() == '11'|| $("#edit-last-status").val() == '10'));        return age;
        return age;    }

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
            	if(ui.content.length == 0) {
            		$("input[name='etablishment']").val('');
            	}
            },
            select: function( event, ui ) {
            	$("input[name='etablishment']").val($.trim(ui.item.data.id));
                if (ui.item.data.libelle) {
                    $("#edit-collective-convention-libelle").val($.trim(ui.item.data.libelle));
                }
                if (ui.item.data.code) {
                	$("#edit-collective-convention-code").val($.trim(ui.item.data.code));
                }
                if (ui.item.data.id_convention_collective) {
                	$("input[name='collective_convention']").val($.trim(ui.item.data.id_convention_collective));
                }
            }
        });
    }    

})(jQuery)