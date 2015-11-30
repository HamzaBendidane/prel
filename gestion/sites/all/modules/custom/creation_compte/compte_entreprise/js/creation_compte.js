// We define a function that takes one parameter named $.
(function ($){
    jQuery("input").keydown(function(event){
        if(event.keyCode == 13) {
          return false;
        }
    });
    jQuery( "#edit-back" ).click(function() {
    	document.location.href='/login' ;
    });
    
    var htmlEntrepriseInfos = $("#creation-compte-entreprise-form .company-infos-0").html();
    var i = $("input[name='company[nb_siret]']").val();
    
    // Cache les autres sirets par défaut
    $('#edit-company-ajout-siret').hide();
    manageAutocomplete('edit-company-siret-0');
    // Gestion des champs codes postaux et villes
    share_gestion_autocomplete_code_postal_ville("company[code_postal][0]","company[ville][0]");
    
    share_gestion_autocomplete_code_label('referentiel', 'naces', 
      		"company[code_nace][0]", 1, "company[libelle_nace][0]", 1, "company[id_nace][0]");
    
    share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', 
  		  "company[code_filiere][0]", 1, "company[libelle_filiere][0]", 1, "company[id_filiere][0]");
    
    share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', 
  		  "company[code_filiere2][0]", 1, "company[libelle_filiere2][0]", 1, "company[id_filiere2][0]");
    
    
    if ($("#edit-company-demande-multi-siret").prop("checked")) {
        $('#edit-company-ajout-siret').show(); 
    }
    
    // Bouton selectionner demande multiple
    $(document).on("click", "#edit-company-demande-multi-siret", function(e) {
        $('#edit-company-ajout-siret').show(); 
        if (!$(this).is(':checked')) {
            $('#edit-company-ajout-siret').hide();
            $("#autreSiret").html('');
            
            for (var i = 1; i < $("input[name='company[nb_siret]']").val(); i++) {
                $(".company-infos-" + i).remove();
                $("#edit-company hr").remove();
            }
            $("input[name='company[nb_siret]']").val(1);
            i = 1;
        }
    }); 
  
  // Bouton Ajouter Siret
  $(document).on("click", "#edit-company-ajout-siret", function(e) {
      i = $("input[name='company[nb_siret]']").val();
      e.preventDefault();
      $('#autreSiret').append('<div class="company-infos company-infos-' + i + '">' + htmlEntrepriseInfos + '</div>');
      $('#autreSiret .company-infos-'+i+' .form-item').each(function() {
          var elementClass = $(this).attr('class');
          var newElementClass = elementClass.substr(0, elementClass.length - 1) + i;
          $(this).removeClass(elementClass).addClass(newElementClass);
      });
      $('#autreSiret .company-infos-'+i+' label').each(function() {
          var elementFor = $(this).attr('for');
          var newElementFor = elementFor.substr(0, elementFor.length - 1) + i;
          $(this).attr('for', newElementFor);
      });
      $('#autreSiret .company-infos-'+i+' input').each(function() {
          var elementId = $(this).attr('id');
    	  if (elementId != undefined) {
    		  var newElementId = elementId.substr(0, elementId.length - 1) + i;
    		  $(this).attr('id', newElementId);
    	  }
          var elementName = $(this).attr('name');
          var newElementName = elementName.substr(0, elementName.length - 2) + i + ']';
          $(this).attr('name', newElementName);
          $(this).val('');
      });
      $('#autreSiret .company-infos-'+i+' select').each(function() {
          var elementId = $(this).attr('id');
          var newElementId = elementId.substr(0, elementId.length - 1) + i;
          $(this).attr('id', newElementId);
          var elementName = $(this).attr('name');
          var newElementName = elementName.substr(0, elementName.length - 2) + i + ']';
          $(this).attr('name', newElementName);
          $(this).val('0');
      });
      manageAutocomplete('edit-company-siret-'+i);
      
      share_gestion_autocomplete_code_postal_ville("company[code_postal]["+ i +"]","company[ville]["+ i +"]");
      
      share_gestion_autocomplete_code_label('referentiel', 'naces', 
      		"company[code_nace]["+ i +"]", 1, "company[libelle_nace]["+ i +"]", 1, "company[id_nace]["+ i +"]");
      
      share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', 
    		  "company[code_filiere]["+ i +"]", 1, "company[libelle_filiere]["+ i +"]", 1, "company[filiere]["+ i +"]");
      
      share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', 
    		  "company[code_filiere2]["+ i +"]", 1, "company[libelle_filiere2]["+ i +"]", 1, "company[filiere2]["+ i +"]");
      
      i++;
      $("input[name='company[nb_siret]']").val(i);
  });
}(jQuery));

function manageAutocomplete(elementId) {
    jQuery("#"+elementId).autocomplete({
        source: '/autocomplete/entreprise-all',
        dataType: 'json',
        minLength : 3,
        search: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
        },
        response: function(event, ui) {
        	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
        },
        select: function( event, ui ) {
            var elementNumber = elementId.substr(elementId.length - 1);
            var siret = ui.item.data.siret ? jQuery.trim(ui.item.data.siret) : null;
            var raison_sociale = ui.item.data.raison_sociale ? jQuery.trim(ui.item.data.raison_sociale) : null;
            var adresse = ui.item.data.rue ? jQuery.trim(ui.item.data.rue) : null;
            var complement_adresse = ui.item.data.complement_de_rue ? jQuery.trim(ui.item.data.complement_de_rue) : null;
            var complement_adresse_2 = ui.item.data.complement_de_rue_2 ? jQuery.trim(ui.item.data.complement_de_rue_2) : null;
            var ville = ui.item.data.ville ? jQuery.trim(ui.item.data.ville) : null;
            var code_postal = ui.item.data.code_postal ? jQuery.trim(ui.item.data.code_postal) : null;
            var telephone = ui.item.data.telephone_principal ? jQuery.trim(ui.item.data.telephone_principal) : null;
			var code_nace = ui.item.data.id_nace ? jQuery.trim(ui.item.data.id_nace) : null;
			jQuery( "#edit-company-siret-"+elementNumber).val(siret);
            var id_nace = ui.item.data.id_nace ? jQuery.trim(ui.item.data.id_nace) : null;
            var code_nace = ui.item.data.code_nace ? jQuery.trim(ui.item.data.code_nace) : null;
            var libelle_nace = ui.item.data.libelle_nace ? jQuery.trim(ui.item.data.libelle_nace) : null;
            var id_secteur_activite1 = ui.item.data.id_secteur_activite ? jQuery.trim(ui.item.data.id_secteur_activite) : null;
            var code_secteur_activite1 = ui.item.data.code_secteur_activite1 ? jQuery.trim(ui.item.data.code_secteur_activite1) : null;
            var libelle_secteur_activite1 = ui.item.data.libelle_secteur_activite1 ? jQuery.trim(ui.item.data.libelle_secteur_activite1) : null;
            
            jQuery( "#edit-company-siret-"+elementNumber).val(siret);
            //  On préremplie les champs
            jQuery("#edit-company-raison-sociale-"+elementNumber).val(raison_sociale);
            jQuery( "#edit-company-adresse-"+elementNumber).val(adresse);
            jQuery( "#edit-company-complement-adresse-"+elementNumber).val(complement_adresse);
            jQuery( "#edit-company-complement-adresse-2-"+elementNumber).val(complement_adresse_2);
            jQuery( "#edit-company-ville-"+elementNumber).val(ville);
            jQuery( "#edit-company-code-postal-"+elementNumber).val(code_postal);
            jQuery( "#edit-company-telephone-"+elementNumber).val(telephone);
            if (id_nace != null) {
            	jQuery('input[name="company[id_nace]['+elementNumber+']"]').val(id_nace);
                jQuery( "#edit-company-code-nace-"+elementNumber).val(code_nace);
                jQuery( "#edit-company-libelle-nace-"+elementNumber).val(libelle_nace);
            }
            if(id_secteur_activite1 != null) {
            	jQuery('input[name="company[id_filiere]['+elementNumber+']"]').val(id_secteur_activite1);
                jQuery( "#edit-company-code-filiere-"+elementNumber).val(code_secteur_activite1);
                jQuery( "#edit-company-libelle-filiere-"+elementNumber).val(libelle_secteur_activite1);
            }
            
            return false;
        }
    });
}