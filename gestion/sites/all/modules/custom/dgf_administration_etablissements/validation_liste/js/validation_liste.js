(function($){
    jQuery(document).ready(function($) {
        $("a.delete").click(function() {
            var id = $(this).data('id');
            var nom = $(this).data('nom');
            $("#delete-modal .user-nom").html(nom);
            $("#delete-modal").modal('show');
            $("#delete-modal .modalValid").attr("data-url", $(this).attr('href'));
            return false;
        });

        $("#delete-modal #modal-delete-valid").click(function() {
            var url = $(this).data('url');
            window.location.assign(url);
        });

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
})(jQuery)