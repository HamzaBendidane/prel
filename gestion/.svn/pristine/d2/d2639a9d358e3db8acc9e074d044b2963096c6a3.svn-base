(function($){
    jQuery(document).ready(function($) {
        $(".form-username").focus();
        
        $("#forgot-password-link").click(function() {
            $("#forgot-password").modal();
        });
        
        $('#LoginForgotPasswordForm').on('submit', function(e) {
            e.preventDefault(); 
            var $this = $(this); 
                $.ajax({
                    url: $this.attr('action'), 
                    type: $this.attr('method'), 
                    data: $this.serialize(), 
                    dataType: 'json', 
                    success: function(json) {
                        if(json.reponse === 'ok') {
                            document.location.href='/login' ;
                        } else {
                            $(".error_modal").html(json.reponse);
                        }
                    }
                });
            
        });
    });
})(jQuery)