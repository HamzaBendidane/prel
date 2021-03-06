(function($) {
    jQuery(document).ready(function($) {
    	// Le popover de l'alerte des notifications
    	gestPopoverAlerteNotifications();
    	
    	// Gestion des notifications de l'alertes
    	gestionNotificationsAlerte();
    });
})(jQuery);


function gestPopoverAlerteNotifications() {
   
    jQuery('#alerte-notifications').popover({
        placement : 'bottom',
        html : 'true',
        container: 'body'
        	
    });
    
};

function gestionNotificationsAlerte() {
	jQuery('#alerte-notifications').click(function() {
		// MAJ des top "non lu" des notifications
		jQuery.ajax({
			url : '/notiflu/notifications-all', // on appelle le script
			dataType : 'html', // on spécifie bien que le type de données

			success : function(result){
			}
		});
		// Masquer les notifications qui étaient affichées
		jQuery('.alerte-nb-notifications').hide();
		jQuery('.bloc-nb-notifications').hide();
	});
};



//jQuery(function(){
//	jQuery('#edit-siret-number').click(function() {
//		jQuery(this).toggleClass('active');
//    });
//});
