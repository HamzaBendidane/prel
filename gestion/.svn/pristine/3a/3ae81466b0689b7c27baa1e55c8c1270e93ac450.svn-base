(function($){
    jQuery(document).ready(function($) {
        $("#edit-refuser").click(function() {
            $("#refuser-modal").modal('show');
            $("#refuser-modal #modal-refuser-valid").attr("data-url", $(this).data('href'));
            return false;
        });
        
        $("#refuser-modal #modal-refuser-valid").click(function() {
            var url = $(this).data('url');
            window.location.assign(url);
        });
        
        $(".new-siret").click(function() {
            $("#new-siret-modal").modal('show');
            $("#new-siret-modal .modalValid").attr("data-url", $(this).attr('href'));
            return false;
        });
        
        $("#new-siret-modal #modal-new-siret-valid").click(function() {
            var url = $(this).data('url');
            var id_etab = $("#edit-tout-etablissement").val();
            if (id_etab != 0) {
                window.location.assign(url+'/'+id_etab);
            } else {
                alert('Veuillez sélectionner un établissement');
            }
        });
    });
})(jQuery)