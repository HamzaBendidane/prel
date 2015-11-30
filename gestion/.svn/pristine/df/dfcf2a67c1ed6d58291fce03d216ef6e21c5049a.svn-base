(function($){
    jQuery(document).ready(function($) {
    	manageDuplicateModal();
        if ($("input[name='modal']").val() === 'fin_saisie') {
            $("#modal-fin-saisie").modal({
                'show': true,
                'backdrop': false,
                'keyboard': false,
            });
        }
        $('#edit-voir-cerfa').click(function(e){
           e.stopPropagation();
           num_demande = $('.num_demande').text();
           siret = $('.num_siret').text();
           uri_cerfa = document.location.origin + '/sites/default/files/opcaim/demande/cerfa/cerfa_'+ siret + '-' +  num_demande + '.pdf';
           // Redirection vers le bon cerfa
           window.open(uri_cerfa);
           return false;
        });
    });
})(jQuery);

function manageDuplicateModal() {
	var url ='';
    jQuery('#edit-duplicate-demande').click(function(e) {
    	e.stopPropagation();
        url = jQuery(this).data('url');
        e.stopPropagation();
        url_demande = document.location.origin + url;
        window.location.replace(url_demande);
        return false;
    });
}