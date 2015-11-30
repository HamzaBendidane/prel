(function($){
    jQuery(document).ready(function($) {
        jQuery('#edit-siret').autocomplete({
            source: '/autocomplete/entreprise',
            dataType: 'json',
            minLength : 3,
            search: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').addClass( "active" );
            },
            response: function(event, ui) {
            	jQuery('#' + event.target.id).parent().children('.field-suffix').children('.spinner').removeClass( "active" );
            },
        });
    });
    // Gestion des champs codes postaux et villes
    share_gestion_autocomplete_code_postal_ville("zip_code","city");
    
    share_gestion_autocomplete_code_label('referentiel', 'naces', "code_nace", 1, "libelle_nace", 1, "id_nace");
    
    share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', "code_filiere", 1, "libelle_filiere", 1, "id_filiere");
    
    share_gestion_autocomplete_code_label('referentiel', 'secteurs_activite', "code_filiere2", 1, "libelle_filiere2", 1, "id_filiere2");
    
})(jQuery)