(function($){
    jQuery(document).ready(function(jQuery) {
        $("#etape-cerfa").attr('src', $("input[name='cerfa-step']").val());
        $("#etape-cerfa").show();
        manageAutocomplete();
        manageNewContactModal();
        displayErrorFields();
        disableSubmitByHittingEnter();
        checkIfContactGotMailAndFunction();
        manageFinalModal();
        eraseFieldsVal();
        share_gestion_autocomplete_code_postal_ville('zip_code', 'city');
        
        $('#edit-popup-contact').hide();
    });
})(jQuery);

function displayErrorFields() {
    if (jQuery("input[name='id_dgf_organisme_formation']").val()) {
        showExistOf();
    } else {
        showNewOf();
    }
}

function showNewOf() {
    jQuery("#edit-contact").hide();
    jQuery("#print-info-generale").hide();
    jQuery("#view-info-generale").hide();
    jQuery("#edit-info-generale").show();
    jQuery("#edit-new-contact").show();
}

function showExistOf() {
    jQuery("#edit-contact").show();
    jQuery("#print-info-generale").show();
    jQuery("#view-info-generale").show();
    jQuery("#edit-info-generale").hide();
    jQuery("#edit-new-contact").hide();
}

function completeContact(idOF) {
    jQuery.ajax({
        type: 'GET',
        url: '/dgf/demande/organisme-formation/ajax/get-contact-from-of',
        data: {id_organisme_formation: idOF},
        dataType: 'text',
        error: function(request, status, error) {
           // alert(status);
        },
        success: function(data, status, request) {
            var dataJson = jQuery.parseJSON(data);
            jQuery("#edit-select-contact").html('<option value="0"> Veuillez choisir dans la liste.</option>');
            jQuery.each(dataJson, function(k, contactObject) {
                var name = contactObject.civilite + ' ' + contactObject.prenom + ' ' + contactObject.nom;
                name += contactObject.email ? ' (' + contactObject.email + ')' : '';
                if (contactObject.est_contact_principal == '1') {
                    jQuery("#edit-select-contact").append('<option value="' + contactObject.id + '" selected="selected">' + name + '</option>');
                } else {
                    jQuery("#edit-select-contact").append('<option value="' + contactObject.id + '">' + name + '</option>');
                }
            });
        }
    });
}
function myTrim(value) {
    if (value== null) return '';

    return jQuery.trim(value);
}
function manageAutocomplete() {
    jQuery('#edit-siret-number').autocomplete({
        source: '/dgf/demande/organisme-formation/autocomplete/siret',
        dataType: 'json',
        minLength : 3,
        search: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function (event, ui) {
            populateOFFields(ui);
        },
    });

    jQuery('#edit-activity-number').autocomplete({
        source: '/dgf/demande/organisme-formation/autocomplete/activity-number',
        dataType: 'json',
        minLength : 3,
        search: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function (event, ui) {
            populateOFFields(ui);
        },
    });

    jQuery('#edit-corporate-name').autocomplete({
        source: '/dgf/demande/organisme-formation/autocomplete/corporate-name',
        dataType: 'json',
        minLength : 3,
        search: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function (event, ui) {
            populateOFFields(ui);
        },
    });
}

// Block le submit en cas de coût vide
function blockNextSubmit() {
	var cout = jQuery('#edit-pedagogical-cost').val().length;
	var evaluation = jQuery('#edit-eval-pre-formative').val().length;
	var of = jQuery('#edit-certification-passing, #edit-eval-pre-formative, #edit-pedagogical-cost').val().length;
	
    jQuery(document).on("click","#edit-next",function(e) {
		if ( of == 0  ){
			e.preventDefault();
		   
		}
	});
}

function populateOFFields(ui) {
    if (ui.item.data.siret) {
        jQuery("#edit-siret-number").val(jQuery.trim(ui.item.data.siret));
    } else {
        jQuery("#edit-siret-number").val('');
    }
    if (ui.item.data.numero_de_declaration_existence) {
        jQuery("#edit-activity-number").val(jQuery.trim(ui.item.data.numero_de_declaration_existence));
    } else {
        jQuery("#edit-activity-number").val('');
    }
    if (ui.item.data.raison_sociale) {
        jQuery("#edit-corporate-name").val(jQuery.trim(ui.item.data.raison_sociale));
    } else {
        jQuery("#edit-corporate-name").val('');
    }
    jQuery("input[name='id_ref_organisme_formation']").val(jQuery.trim(ui.item.data.id));

    jQuery("#print-info-generale").css("display",'')
    jQuery("#orga-info").html(
    					'<div class="row">'+ 
    						'<div class="col-md-10 adresse">' +
	    						'<label>Adresse </label> ' + myTrim(ui.item.data.rue) + ' ' +
	                            myTrim(ui.item.data.complement_de_rue) + ' '+
	                            myTrim(ui.item.data.complement_de_rue_2) + ' '+
	                            myTrim(ui.item.data.code_postal) + ' '+
	                            myTrim(ui.item.data.ville) + 
                            '</div>' +
                            '<div class="col-md-10 adresse">' +
                            	"<label>Téléphone </label>" + myTrim(ui.item.data.telephone_principal) + 
                            '</div>' +
                            '<div class="col-md-10 adresse">' +
                            	"<label>Courriel </label>" + myTrim(ui.item.data.email) + 
                            '</div>' +
                            '<div class="col-md-10 adresse">' +
                            	"<label>Numéro de TVA </label>" + myTrim(ui.item.data.tva_intracommunautaire) +
                            '</div>' +
        				'</div>' 
    );
    showExistOf();
    
    completeContact(jQuery.trim(ui.item.data.id));
}

function eraseFieldsVal() {
    jQuery('#edit-siret-number').keyup(function(e){
        actionEraseFiels(e)
    });
}

function actionEraseFiels(e) {
    var key = e.which || e.keyCode;

    if(key == 46 || key == 8) {
        jQuery("input[name='id_ref_organisme_formation']").val('');
        // on réinitialu=ise les chamsp de la partie 1
        if (jQuery('#edit-siret-number').is(':focus')) {
            showNewOf();
            jQuery("#edit-activity-number").val('');
            jQuery("#edit-corporate-name").val('');
            jQuery("#edit-select-contact").html('');
        }
        if (jQuery('#edit-activity-number').is(':focus')) {
            showNewOf();
            jQuery("#edit-siret-number").val('');
            jQuery("#edit-corporate-name").val('');
            jQuery("#edit-select-contact").html('');
        }
        if (jQuery('#edit-corporate-name').is(':focus')) {
            showNewOf();
            jQuery("#edit-activity-number").val('');
            jQuery("#edit-siret-number").val('');
            jQuery("#edit-select-contact").html('');
        }
    }
}

function manageNewContactModal() {
    jQuery("#edit-add").click(function() {
        jQuery("#new-contact-modal").modal('show');
        return false;
    });
    
    jQuery("#edit-modal-save").click(function() {
        if (!checkErrorModalContact()) {
            jQuery("#new-contact-modal").modal('hide');
            populateSelectContactFromModal();
        }
        return false;
    });
}

function disableSubmitByHittingEnter() {
    jQuery("input").keydown(function(event){
        if(event.keyCode == 13) {
          return false;
        }
    });
}

function checkIfContactGotMailAndFunction() {
    jQuery('#edit-select-contact').change(function(){
        if (jQuery('#edit-direct-payment-1').is(':checked')) {
            var contact = jQuery('#edit-select-contact option:selected').val();
            if (contact == 0) {
                return;
            }
            jQuery.ajax({
               type: 'GET',
               url: '/dgf/ajax/organisme-formation/check-contact-of-infos',
               data: {contact: contact},
               dataType: 'text',
                error: function(request, status, error, data) {
                    alert(error);
                },
                success: function(data, status, request) {
                    var dataJson = jQuery.parseJSON(data);
                    if (dataJson.email == "" || dataJson.id_fonction == "") {
                        jQuery("#complete-contact-modal #edit-complete-contact-fonction").val(dataJson.id_fonction);
                        jQuery("#complete-contact-modal #edit-complete-contact-mail").val(dataJson.email);
                        jQuery("#complete-contact-modal").modal('show');
                    }
                }
            });
        }
    });
}

function validateEmail($email) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return emailReg.test( $email );
}

function validateTel($tel) {
    var telReg = /^[0-9]{10}$/;
    return telReg.test( $tel );
  }

function checkErrorModalContact() {
    var error = false;
    jQuery("#new-contact-modal .messages-inline").remove();
    jQuery("#new-contact-modal .error").removeClass('error');
    jQuery("#new-contact-modal .error").removeClass('errorCustomSelect');
    if (jQuery('input[name=modal_contact_title]:checked').length == 0) {
        jQuery(".form-item-modal-contact-title .form-select").addClass('errorCustomSelect');
        jQuery("#new-contact-modal .form-item-modal-contact-title:first").append('<div class="messages-inline">Le champ Civilité est obligatoire.</div>');
        error = true;
    }
    if (jQuery("#edit-modal-contact-lastname").val() == '') {
        jQuery("#edit-modal-contact-lastname").addClass('error');
        jQuery(".form-item-modal-contact-lastname").append('<div class="messages-inline">Le champ Nom est obligatoire.</div>');
        error = true;
    }
    if (jQuery("#edit-modal-contact-firstname").val() == '') {
        jQuery("#edit-modal-contact-firstname").addClass('error');
        jQuery(".form-item-modal-contact-firstname").append('<div class="messages-inline">Le champ Prénom est obligatoire.</div>');
        error = true;
    }
    if (jQuery("#edit-modal-contact-fonction").val() == 0) {
        jQuery(".form-item-modal-contact-fonction .form-select").addClass('errorCustomSelect');
        jQuery(".form-item-modal-contact-fonction").append('<div class="messages-inline">Le champ Fonction est obligatoire.</div>');
        error = true;
    }
    if (jQuery("#edit-modal-contact-phone").val() == '' && jQuery("#edit-modal-contact-mail").val() == '') {
        jQuery("#edit-modal-contact-mail").addClass('error');
        jQuery("#edit-modal-contact-phone").addClass('error');
        jQuery(".form-item-modal-contact-phone").append('<div class="messages-inline">Veuillez renseigner obligatoirement un numéro de téléphone ou une adresse courriel.</div>');
        error = true;
    }
    
    if (jQuery("#edit-modal-contact-mail").val() != '' && !validateEmail(jQuery("#edit-modal-contact-mail").val())) {
        jQuery("#edit-modal-contact-mail").addClass('error');
        jQuery("#edit-modal-contact-phone").addClass('error');
        jQuery(".form-item-modal-contact-mail").append('<div class="messages-inline">Le champ Courriel est invalide.</div>');
        error = true;
    }
    if (jQuery("#edit-modal-contact-phone").val() != '' && !validateTel(jQuery("#edit-modal-contact-phone").val())) {
        jQuery("#edit-modal-contact-phone").addClass('error');
        jQuery(".form-item-modal-contact-phone").append('<div class="messages-inline">Le champ Téléphone est invalide.</div>');
        error = true;
    }
    
    return error;
}

function populateSelectContactFromModal() {
    var title = jQuery("input[name=modal_contact_title]:checked").val();
    var titleLabel = jQuery("#edit-modal-contact-title option:selected").text();
    var firstname = jQuery("#edit-modal-contact-firstname").val();
    var lastname = jQuery("#edit-modal-contact-lastname").val();
    var email = jQuery("#edit-modal-contact-mail").val();
    var fonction = jQuery("#edit-modal-contact-fonction").val();
    var telephone = jQuery("#edit-modal-contact-phone").val();
    var trimfonction = jQuery.trim(fonction);
    var siret_organisme_formation = jQuery("#edit-siret-number").val();
    var id = '';
    // Sauvegarde AJAX
    jQuery.ajax({
        url: "/dgf/ajax/sauver/contact",
        type: 'POST',
        dataType: 'text',
        data: {
            title:title,
            firstname:firstname,
            lastname:lastname,
            email:email,
            fonction:trimfonction,
            phone:telephone,
            siretorganismeformation : siret_organisme_formation
        },
        success: function(data) {
            id = data;
            jQuery("#edit-select-contact").val('');
            jQuery("#edit-select-contact").append('<option value=' + id + ' selected="selected">' + titleLabel + ' ' + firstname + ' ' + lastname + ' (' + email + ')</option>');
            
        },
        error: function () {
        }
        });
}


function manageFinalModal() {
    jQuery('#edit-quit').click(function() {
        jQuery("#modalquit").modal("show");
    });

    jQuery('.modalQuit').click(function() {
    	jQuery('#modalquit').modal('hide');
//    	return false;
    });

}
