(function ($) {
    jQuery(document).ready(function($) {
       
        $(".justif-select").click(function() {
            
            $('.justif-select').removeClass("select");
            $(this).addClass("select");
            $("input[name='id_ref_file']").val($(this).attr("id"));
        });
        
        $('.edit-file-to-upload').bind('change', function() {
            if ( window.FileReader && window.File && window.FileList && window.Blob ) {
                var limit = 5 * 1024 * 1024;
                if (this.files[0].size > limit) {
                    $(this).addClass('error');
                    $("#limit-size").css('color', '#E57B18');
                    $("#edit-join-file").prop('disabled', true);
                } else {
                    $(this).removeClass('error');
                    $("#limit-size").css('color', '#196681');
                    $(".edit-join-file").prop('disabled', false);
                }
            }
        });
        
        
    
    });
// FIN JS  
})(jQuery);
