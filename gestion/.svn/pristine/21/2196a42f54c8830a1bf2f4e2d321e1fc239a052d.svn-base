(function($){
    jQuery(document).ready(function($) {
        $(".form-item-raison-retrait-autre").hide();
        
        $("input[name='raison_retrait']").change(function() {
            if ($("#edit-raison-retrait-3").prop("checked")) {
                $(".form-item-raison-retrait-autre").show();
            } else {
                $(".form-item-raison-retrait-autre").hide();
            }
        });
        
        $(".new-siret").click(function() {
            $("#new-siret-modal").modal('show');
            $("#new-siret-modal .modalValid").attr("data-url", $(this).attr('href'));
            return false;
        });
        
        $("#new-siret-modal #modal-new-siret-valid").click(function() {
            var url = $(this).data('url');
            var id_etab = 0;
            var validation = 'false';
            if ($("#edit-tout-etablissement").hasClass('autocomplete-siret')) {
                id_etab = $("input[name='id_etablissement']").val();
                validation = 'true';
            } else {
                id_etab = $("#edit-tout-etablissement").val();
            }
            if (id_etab != 0) {
                window.location.assign(url+'/'+id_etab + '/' + validation);
            } else {
                alert('Veuillez sélectionner un établissement');
            }
        });
        
        $("#edit-tout-etablissement.autocomplete-siret").autocomplete({
            source: '/autocomplete/entreprise-all-by-siret-or-raison-social',
            dataType: 'json',
            minLength : 3,
            search: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
            },
            response: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
            select: function( event, ui ) {
                $("input[name='id_etablissement']").val($.trim(ui.item.data.id));
            }
        });
        
        $(".retirer-mon-compte").click(function() {
            $("#retirer-siret-modal").modal('show');
            $("#retirer-siret-modal .modalValid").attr("data-url", $(this).attr('href'));
            return false;
        });
        
        $("#retirer-siret-modal #modal-retirer-siret-valid").click(function() {
            var url = $(this).data('url');
            var raison_retrait = $("input[name='raison_retrait']:checked").val();
            var raison_retrait_label_autre = $("#edit-raison-retrait-autre").val();
            
            if (raison_retrait != undefined) {
                window.location.assign(url + '/' + raison_retrait + '/' + raison_retrait_label_autre);
            } else {
                alert('Veuillez sélectionner une raison');
            }
        });
    });
})(jQuery)