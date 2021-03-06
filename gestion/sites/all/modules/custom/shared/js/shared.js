// Fonctions génériques JS
(function ($) {
  // JS AUTOCOMPLETE	
  function shared_autocomplete(ElementId) {
    this.autocomplete({
      source: '/autocomplete/siret',
      dataType: 'json',
      minLength : 3,
      search: function(event, ui) {
      	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
      },
      response: function(event, ui) {
      	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
      },
      select: function( event, ui ) {
      	$(ElementId).val( ui.item.label );
        //  On préremplie les champs
        //  rue = ui.item.data.rue;
        //  nomRue = rue.replace(/\d+/g, '');
        // complementRue = ui.item.data.complement_de_rue.replace(/\d+/g, '');
        $("#edit-companyraisonsociale").val( ui.item.data.raison_sociale);
        // Adresse entreprises
//        $( "#edit-companyadressestreetnumber" ).val( ui.item.data.numero_de_rue);
        $( "#edit-companyadressestreetname" ).val(ui.item.data.rue.replace(/\d+/g, ''));
        $( "#edit-companyadressestreetnamemore" ).val( ui.item.data.complement_de_rue.replace(/\d+/g, ''));
        $( "#edit-companyadressetown" ).val( ui.item.data.ville);
        $( "#edit-companycodepostal" ).val( ui.item.data.code_postal);
        $( "#edit-companytelephone" ).val( ui.item.data.telephone_principal );
        $( "#edit-codenaf" ).val( ui.item.data.id_naf );
        $( "#edit-codenace" ).val( ui.item.data.id_nace);
      	return false;
      }
    });
  }
    Drupal.behaviors.DisableInputEnter = {
        attach: function(context, settings) {
            $('body', context).once('disable-input-enter', function() {
                $(this).keypress(function(e) {
                    if (e.keyCode == 13) {
                        e.preventDefault();
                       // alert ($('.modal').hasClass('in'));
                        if(!$('.modal').hasClass('in')) {

                            $('#edit-next').click();
                            $('#edit-filter').click();
                            $('#edit-save-add').click();
                            $('#edit-send').click();
                            $('#edit-submit').click();
                            $('#edit-ajouter').click();
                            $('#edit-modifier').click();
                            $('#modifier-mon-compte').click();
                            $('#edit-transmettre').click();
                        }}
                });
            });
        }
    }
  //Remove error class on radio click
  $(".form-type-radio").click(function() {
    $(this).closest(".form-type-radios").find(".form-radio").removeClass("error");
  });
  
}(jQuery));

// Appel l'autocompletion
function shared_body_call_autocomplete($id, $source, $minLength) {
jQuery('body').on('click', $id, function() {
	jQuery($id).autocomplete({
              source: $source,
              dataType: 'json',
              minLength : $minLength,
              search: function(event, ui) {
              	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
              },
              response: function(event, ui) {
              	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
              },
        });
 });
}

/**
 * Affichage le spinner pour les autocomplete
 * 
 * @param objet input bouton pour lequel le spinner est présent
 */
function shared_show_spinner(input) {
	input.parent().children('.field-suffix').children('.spinner').addClass( "active" );
}

/**
 * Cacher le spinner pour les autocomplete
 * 
 * @param objet input bouton pour lequel le spinner est présent
 */
function shared_hide_spinner(input) {
	input.parent().children('.field-suffix').children('.spinner').removeClass( "active" );
}

/**
 * Gestion de la sortie du champ de saisie en cas d'autocomplete
 * 
 * @param objet input bouton pour lequel le spinner est présent
 */
function shared_blur_autocomplete_field(input) {
	input.blur(function() {
		shared_hide_spinner(input);
	});
}

/**
 * Gestion de l'autocomplete sur les villes et les codes postaux
 * 
 * @param string name_input _code_postal nom du input code postal
 * @param string name_input_ville nom du input ville
 */
function share_gestion_autocomplete_code_postal_ville(name_input_code_postal, name_input_ville) {
	share_autocomplete_code_postal(name_input_code_postal, name_input_ville);
	share_autocomplete_ville(name_input_ville, name_input_code_postal);
}

/**
 * Autocomplete sur les codes postaux
 * 
 * @param string name_input_code_postal nom du input code postal
 * @param string name_input_ville nom du input ville
 * 
*/
function share_autocomplete_code_postal(name_input_code_postal, name_input_ville) {
	var input_code_postal = jQuery('input[name="' + name_input_code_postal + '"]');
	var input_ville = jQuery('input[name="' + name_input_ville + '"]');
	
	shared_blur_autocomplete_field(input_code_postal);
	input_code_postal.autocomplete({
		source: function( request, response ) {
			jQuery.ajax({
				url: '/autocomplete/code-postal',
				type : 'GET',
				dataType: "json",
				data: {
					term: request.term
				},
				success: function( data ) {
					shared_hide_spinner(input_code_postal);
					if(data.length == 1) {
						input_code_postal.val(jQuery.trim(data[0]['data'].code_postal));
						input_ville.val(jQuery.trim(data[0]['data'].ville));
						
						response(false);
					}
					else {
						response( data );
					}
				}
			});
		},
        minLength : 2,
        search: function(event, ui) {
        	shared_show_spinner(input_code_postal);
        },
        select: function( event, ui ) {
        	input_code_postal.val(jQuery.trim(ui.item.data.code_postal));
        	input_ville.val(jQuery.trim(ui.item.data.ville));
        }
    });
    
}

/**
 * Autocomplete sur les villes
 * 
 * @param string name_input _code_postal nom du input code postal
 * @param string name_input_ville nom du input ville
*/

function share_autocomplete_ville(name_input_ville, name_input_code_postal) {
	var input_code_postal = jQuery('input[name="' + name_input_code_postal + '"]');
	var input_ville = jQuery('input[name="' + name_input_ville + '"]');
	
	shared_blur_autocomplete_field(input_ville);
	input_ville.autocomplete({
    	source: function( request, response ) {
			jQuery.ajax({
				url: '/autocomplete/ville',
				type : 'GET',
				dataType: "json",
				data: {
					term: request.term,
				},
				success: function( data ) {
					shared_hide_spinner(input_ville);
					if(data.length == 1) {
						input_code_postal.val(jQuery.trim(data[0]['data'].code_postal));
						input_ville.val(jQuery.trim(data[0]['data'].ville));
						
						response(false);
					}
					else {
						response( data );
					}
				}
			});
		},
        minLength : 3,
        search: function(event, ui) {
        	shared_show_spinner(input_ville);
        },
        select: function( event, ui ) {
        	input_code_postal.val(jQuery.trim(ui.item.data.code_postal));
        	input_ville.val(jQuery.trim(ui.item.data.ville));
        }
    });
}




/**
 * Gestion de l'autocomplete sur les champs "codes" et "labels"
 *
 * @param string referentiel nom du référentiel
 * @param string table nom de la table contenant les champs code et label
 * @param string name_input_code nom du input code
 * @param int min_length_code nombre de caractères avant l'autocomplétion du code
 * @param string name_input_label nom du input label
 * @param int min_length_label nombre de caractères avant l'autocomplétion du label
 * @param string name_input_id nom du input caché contenant id correspondant
 */
function share_gestion_autocomplete_code_label(referentiel, table, name_input_code, min_length_code, name_input_label, min_length_label, name_input_id) {
	share_autocomplete_code(referentiel, table, name_input_code, name_input_label, name_input_id, min_length_code);
	share_autocomplete_label(referentiel, table, name_input_label, name_input_code, name_input_id, min_length_label);
}

/**
 * Autocomplete sur les codes
 * 
 * @param string referentiel nom du référentiel
 * @param string table nom de la table contenant les champs code et label
 * @param string name_input_code nom du input code
 * @param string name_input_label nom du input label
 * @param string name_input_id nom du input caché contenant id correspondant
 * @param int min_length_code nombre de caractères avant l'autocomplétion du code
 * 
 */
function share_autocomplete_code(referentiel, table, name_input_code, name_input_label, name_input_id, min_length) {
	var input_code = jQuery('input[name="' + name_input_code + '"]');
	var input_label = jQuery('input[name="' + name_input_label + '"]');
	var input_id = jQuery('input[name="' + name_input_id + '"]');
	
	shared_blur_autocomplete_field(input_code);
	
	input_code.focusout(function() {
		if(input_code.val() == '') {
			input_label.val('');
			input_id.val('');
		}
	});
	
	input_label.focusout(function() {
		if(input_label.val() == '') {
			input_code.val('');
			input_id.val('');
		}
	});
	
	input_code.autocomplete({
		source: function( request, response ) {
			jQuery.ajax({
				url: '/autocomplete/code-label',
				type : 'GET',
				dataType: "json",
				data: {
					term: request.term,
					referentiel : referentiel,
					table : table,
					code: input_code.val(),
					label: '',
				},
				success: function( data ) {
					shared_hide_spinner(input_code);
					if(data.length == 1) {
						input_label.val(data[0]['data'].libelle);
						input_code.val(data[0]['data'].code);
						input_id.val(data[0]['data'].id);
						
						response(false);
					}
					else {
						if(data.length == 0){
							input_id.val('');
							input_label.val('');
							response(false);
						}
						else {
							response( data );
						}
					}
				}
			});
		},
        minLength : 1,
        search: function(event, ui) {
        	shared_show_spinner(input_code);
        },
        select: function( event, ui ) {
        	input_code.val(ui.item.data.code);
        	input_label.val(ui.item.data.libelle);
        	input_id.val(ui.item.data.id);
        }
    });
    
}

/**
 * Autocomplete sur les labels
 * 
 * @param string referentiel nom du référentiel
 * @param string table nom de la table contenant les champs code et label
 * @param string name_input_label nom du input label
 * @param string name_input_code nom du input code
 * @param string name_input_id nom du input caché contenant id correspondant
 * @param int min_length_code nombre de caractères avant l'autocomplétion du code
 */
function share_autocomplete_label(referentiel, table, name_input_label, name_input_code, name_input_id, min_length) {
	var input_code = jQuery('input[name="' + name_input_code + '"]');
	var input_label = jQuery('input[name="' + name_input_label + '"]');
	var input_id = jQuery('input[name="' + name_input_id + '"]');
	
	shared_blur_autocomplete_field(input_label);
	
	input_label.autocomplete({
    	source: function( request, response ) {
			jQuery.ajax({
				url: '/autocomplete/code-label',
				type : 'GET',
				dataType: "json",
				data: {
					term: request.term,
					referentiel : referentiel,
					table : table,
					code : '',
					label : input_label.val(),
				},
				success: function( data ) {
					shared_hide_spinner(input_label);
					if(data.length == 1) {
						input_label.val(data[0]['data'].libelle);
						input_code.val(data[0]['data'].code);
						input_id.val(data[0]['data'].id);
						
						response(false);
					}
					else {
						if(data.length == 0){
							input_id.val('');
							input_code.val('');
							response(false);
						}
						else {
							response( data );
						}
					}
				}
			});
		},
        minLength : 3,
        search: function(event, ui) {
        	shared_show_spinner(input_label);
        },
        select: function( event, ui ) {
        	input_code.val(ui.item.data.code);
        	input_label.val(ui.item.data.libelle);
        	input_id.val(ui.item.data.id);
        }
    });
}

