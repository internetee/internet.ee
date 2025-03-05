<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4IfPnDh504dpjKGa__j-nx831yzNwu3I"></script>
<script src="{{ javascripts_path }}/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
{% sitejs_include %}

<script src="{{ javascripts_path }}/cookie.min.js"></script>

{% if editmode %}
{% include "voog-tools" %}
{% endif %}

{% if editmode %}
<script type="text/javascript">
  window.edy = window.edy || [];
  edy.push(['texteditorStyles', {name: 'Form title', tagname:'h3', classname: 'formTitle'}]);
</script>
{% endif %}

<script>
  jQuery(document).ready(function($) {
    function cookieNote (selector) {
      var $note = $(selector);
      var $closeButton = $note.find('[data-note-close]');
      // if cookie then show
      if (!$.cookie("cookie_note_closed")) {
        $note.show();
      }

      $closeButton.on('click', function(e) {
        e.preventDefault();
        $note.hide();
        $.cookie("cookie_note_closed", "true", { expires: 30, path: '/' });
        // set cookie
      });
    }

    if ($('.js-cookieNote')) {
      cookieNote('.js-cookieNote');
    }
  });
</script>
{% include "cookie-consent" %}
{{ site.analytics }}