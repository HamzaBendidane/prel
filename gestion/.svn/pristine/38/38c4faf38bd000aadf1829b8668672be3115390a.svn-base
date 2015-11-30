(function($) {
    jQuery(document).ready(function($) {
      /**
       * Returns the version of Internet Explorer or a -1
       * (indicating the use of another browser).
       */
      function getInternetExplorerVersion()
      {
          var rv = -1; // Return value assumes failure.

          if (navigator.appName == 'Microsoft Internet Explorer')
          {
              var ua = navigator.userAgent;
              var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
              if (re.exec(ua) != null)
                  rv = parseFloat( RegExp.$1 );
          }

          return rv;
      }
      
      var ver = getInternetExplorerVersion();

      if ( ver > -1 )
      {
          if ( ver < 8.0 ) {
            $('.required label:first-child').append('<span class="iea-required">*</span>');
          }
      }
    });
})(jQuery);
