(function($){
    $(document).ready(function($) {
        manageNumberEtablishmentModal();
        manageNumberInternModal()
        manageJustifModal();
        manageDeleteModal();
        manageExportExcel();
        manageDuplicateModal();
        
        autocompleteNameSalarie();
        autocompleteEtablissement();
    });
})(jQuery)

function manageNumberEtablishmentModal() {
    jQuery('body').on('click', '.action-etablishment-nb', function() {
        id = jQuery(this).data('id');
        jQuery.ajax({
            cache: false,
            type: 'GET',
            url: '/get/suivi/demande/liste-etablissement/' + id,
            dataType: 'text',
            error: function(request, status, error) {
                alert(status);
            },
            success: function(data, status, request) {
                var dataJson = jQuery.parseJSON(data);
                body = '';
                jQuery.each(dataJson, function(k, etablishment) {
                    body += '<div class="lineEtablishment"><span class="textEtablishment">';
                    body += etablishment.t_raison_sociale + ' (' + etablishment.t_siret + ')</span></div>';
                });
                jQuery('#modal-etablishment-body').html(body);
            }
        });
    });
}

function manageNumberInternModal() {
    jQuery('body').on('click', '.action-intern-nb', function() {
        id = jQuery(this).data('id');
        jQuery.ajax({
            cache: false,
            type: 'GET',
            url: '/get/suivi/demande/liste-participant/' + id,
            dataType: 'text',
            error: function(request, status, error) {
                alert(status);
            },
            success: function(data, status, request) {
                var dataJson = jQuery.parseJSON(data);
                body = '';
                jQuery.each(dataJson, function(k, intern) {
                    body += '<div class="lineIntern"><span class="textIntern">' + intern.t_salarie + '</span></div>'
                });
                jQuery('#modal-intern-body').html(body);
            }
        });
    });
}

function manageJustifModal() {
    jQuery('body').on('click', '.action-doc', function() {
        id = jQuery(this).data('id');
        jQuery.ajax({
            cache: false,
            type: 'GET',
            url: '/get/suivi/demande/justificatifs/' + id,
            dataType: 'text',
            error: function(request, status, error) {
                alert(status);
            },
            success: function(data, status, request) {
                var dataJson = jQuery.parseJSON(data);
                body = '';
                jQuery.each(dataJson, function(k, justif) {
                    body += '<div class="lineJustif"><h5 class="labelJustif">'+justif.t_nom_ref_fichier +'</h5><span class="textJustif">' + justif.t_nom_fichier + justif.t_extension_fichier + '</span></div>'
                });
                jQuery('#modal-justif-body').html(body);
            }
        });
    });
}

function manageDeleteModal() {

    jQuery("a.action-delete").click(function() {
        var id = jQuery(this).data('id');
        var nom = jQuery(this).data('nom');
        jQuery("#delete-modal .user-nom").html(nom);
        jQuery("#delete-modal").modal('show');
        jQuery("#delete-modal .modalValid").attr("data-url", jQuery(this).attr('href'));
        return false;
    });

    jQuery("#delete-modal #modal-delete-valid").click(function() {
        var url = jQuery(this).data('url');
        window.location.assign(url);
    });
}

function manageDuplicateModal() {
	var url ='';
    jQuery('body').on('click', '.action-duplicate', function() {
        url = jQuery(this).data('url');
    });
    jQuery('body').on('click', '#modal-duplicate-valid', function() {
    	window.location.assign(url);
    });
}

function manageExportExcel() {
    jQuery('body').on('click', '.export-xls', function() {

        jQuery.ajax({
              cache: false,
              type: 'GET',
              url: '/export/suivi/demande',
              dataType: 'text',
              error: function(request, status, error) {
                  alert(status);
              },
              success: function(data, status, request) {
                  // TODO
              }
          });
    });
}

function autocompleteNameSalarie() {
    jQuery("#edit-worker-name").autocomplete({
        source: '/autocomplete/salarie',
        dataType: 'json',
        minLength : 3,
        search: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function(event, ui) {
            jQuery("#edit-worker-name").val(jQuery.trim(ui.item.data.nom) + ' ' + jQuery.trim(ui.item.data.prenom));
            return false;
        }
    });
}

function autocompleteEtablissement() {
	
	jQuery("#edit-tout-etablissement.autocomplete-siret").autocomplete({
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
        	jQuery("input[name='etablishment']").val(jQuery.trim(ui.item.data.id));
        }
    });
}

