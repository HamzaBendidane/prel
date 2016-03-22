
$(document).ready(function(){/* affix the navbar after scroll below header */

    (function($){
        $(document).ready(function(){
            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
                event.preventDefault();
                event.stopPropagation();
                $(this).parent().siblings().removeClass('open');
                $(this).parent().toggleClass('open');
            });
        });
    })(jQuery);
    /* google maps */
    google.maps.visualRefresh = true;

    var map;
    function initialize() {
        var geocoder = new google.maps.Geocoder();
        var address = $('#map-input').text(); /* change the map-input to your address */
        var mapOptions = {
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            scrollwheel: false
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
        var cars = ['70 avenue Gabriel Péri 91370','54 rue Boucicaut 92260' ,'11 passage des Halles 45300','43 rue Amiral Gourdon ','15 rue Pierre Lebrun 45170','45 rue Jean Jaurè 45400'];
	for (i = 0; i < cars.length; i++) {
            if (geocoder) {
                geocoder.geocode( { 'address': cars[i]}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
                            map.setCenter(results[0].geometry.location);

                            var marker = new google.maps.Marker({
                                position: results[0].geometry.location,
                                map: map,
                                title:"dddddddd"
                            });

                        } else {
                            alert("No results found");
                        }
                    }
                });
            }
        }

    }
    google.maps.event.addDomListener(window, 'load', initialize);

    /* end google maps */




});
