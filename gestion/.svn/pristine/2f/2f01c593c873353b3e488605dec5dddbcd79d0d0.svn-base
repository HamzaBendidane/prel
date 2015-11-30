(function($){
    jQuery(document).ready(function($) {
        displayList();
        manageAddPopup();
        manageEditPopup();
        manageDeletePopup();
        manageClosePopup();
        errorModal();
    });
})(jQuery)

function errorModal() {
    if (jQuery("#popup-add input").hasClass("error")) {
        jQuery("#popup-add").modal('show');
    }
    if (jQuery("#popup-edit input").hasClass("error")) {
        jQuery("#popup-edit").modal('show');
    }
}

function displayList() {
    var referentiel_selected = jQuery("#edit-select-referentiel").val();
    if (referentiel_selected) {
        refreshTable();
    }
    jQuery("#edit-select-referentiel").change(function() {
        var referentiel_selected = jQuery(this).val();
        if (referentiel_selected != 0) {
            refreshTable();
        } else {
            jQuery("#table-container").html('');
            alert('Veuillez sélectionner un référentiel');
        }
    });
}

function manageAddPopup() {
    jQuery("body").on('click', '.edit-add-button', function() {
        if (jQuery("#edit-ref").val() != 0) {
            var element_name = jQuery("#edit-select-referentiel option:selected").text().toLowerCase();
            
            if (jQuery("#edit-select-referentiel").val() != 'ref_justificatif') {
                jQuery(".form-item-is-mandatory-add").hide();
                jQuery(".form-item-nature-demande-add").hide();
            } else {
                jQuery(".form-item-is-mandatory-add").show();
                jQuery(".form-item-nature-demande-add").show();
            }
            
            if (jQuery("#edit-select-referentiel").val() != 'ref_nature_demande'
                && jQuery("#edit-select-referentiel").val() != 'ref_nature_formation') {
                jQuery(".form-item-code-add").show();
            } else {
                jQuery(".form-item-code-add").hide();
            }
            
            jQuery("#popup-add").modal('show');
        }
        
        return false;
    });
}
function manageEditPopup() {
    jQuery("body").on('click', '.edit-edit-button', function() {
        if (jQuery("#edit-ref").val() != 0) {
            var element_name = jQuery("#edit-select-referentiel option:selected").text().toLowerCase();
            
            var id_referentiel = jQuery(this).data('id');
            jQuery("input[name='id_rerentiel_edit']").val(id_referentiel);
            
            if (jQuery("#edit-select-referentiel").val() != 'ref_justificatif') {
                jQuery(".form-item-is-mandatory-edit").hide();
                jQuery(".form-item-nature-demande-edit").hide();
            } else {
                var id_nature_demande = jQuery(this).data('id-nature-demande');
                var is_mandatory = jQuery(this).data('is-mandatory');
                jQuery("#edit-nature-demande-edit").val(id_nature_demande);

                if (is_mandatory) {
                    jQuery("#edit-is-mandatory-edit").prop('checked', true);
                } else {
                    jQuery("#edit-is-mandatory-edit").prop('checked', false);
                }
                jQuery(".form-item-is-mandatory-edit").show();
                jQuery(".form-item-nature-demande-edit").show();
            }
            
            if (jQuery("#edit-select-referentiel").val() != 'ref_nature_demande'
                && jQuery("#edit-select-referentiel").val() != 'ref_nature_formation') {
                var code = jQuery(this).data('code');
                jQuery("#edit-code-edit").val(code);
                jQuery(".form-item-code-edit").show();
            } else {
                jQuery(".form-item-code-edit").hide();
            }
            
            var label = jQuery(this).data('label');
            jQuery("#edit-label-edit").val(label);
            
            jQuery("#popup-edit").modal('show');
        }
        
        return false;
    });
}

function manageDeletePopup() {
    jQuery("body").on('click', '.edit-delete-button', function() {
        if (jQuery("#edit-ref").val() != 0) {
            var referentiel_name = jQuery("#edit-select-referentiel option:selected").text().toLowerCase();
            
            var id_referentiel = jQuery(this).data('id');
            jQuery("input[name='id_rerentiel']").val(id_referentiel);
            var element_name = jQuery(this).data('element-name');
            
            jQuery("#popup-delete .element-name").html(element_name);
            jQuery("#popup-delete .referentiel-name").html(referentiel_name);
            
            jQuery("#popup-delete").modal('show');
        }
        
        return false;
    });
}

function manageClosePopup() {
    jQuery(".cancel-button").click(function() {
        jQuery(".modal.in").modal('hide');
        
        return false;
    });
}

function refreshTable(page, sort, order, referentiel_selected) { //, siret, corporateName, responsibleName
    if(!page) page = 0;
    if(!sort) sort = '';
    if(!order) order = '';
    if(!referentiel_selected) referentiel_selected = '';

    if (jQuery('#edit-select-referentiel').val != 0) referentiel_selected = jQuery('#edit-select-referentiel').val();

    if (referentiel_selected != 0) {
        jQuery.ajax({
            cache: false,
            type: 'POST',
            url: '/opcaim-admin/parametres/pager',
            data: {page: page, sort: sort, order: order, referentiel_selected: referentiel_selected},
            dataType: 'text',
            error: function(request, status, error) {
                jQuery("#loading").hide();
                alert(status);
            },
            beforeSend: function(jqXHR, settings) {
                jQuery("#loading").show();
            },
            complete: function(jqXHR, settings) {
                jQuery("#loading").hide();
            },
            success: function(data, status, request) {
                var html = data;

                jQuery('#table-container').html(html);
                
                jQuery('#table-container th a')
                    .add('#table-container .pager-item a')
                    .add('#table-container .pager-first a')
                    .add('#table-container .pager-previous a')
                    .add('#table-container .pager-next a')
                    .add('#table-container .pager-last a')
                        .click(function(el, a, b, c) {
                            var url = jQuery.url(el.currentTarget.getAttribute('href'));
                            refreshTable(
                                url.param('page'), url.param('sort'), url.param('order'),
                                url.param('referentiel_selected')
                            );
    
                            return (false);
                        });
                jQuery(".sticky-enabled").css('min-width', '100%');
            }
        });
    }
}