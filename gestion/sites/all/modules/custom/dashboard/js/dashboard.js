(function($) {
    jQuery(document).ready(function($) {
        // Les tooltips
        gestTooltips();
    });
    
    
})(jQuery);


function gestTooltips() {

    jQuery('.bloc-nb-notifications').tooltip({
        placement : 'top',
        html : 'true'
    });
};