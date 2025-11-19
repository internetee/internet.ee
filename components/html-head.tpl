{% comment %}IE SETTINGS{% endcomment %}

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->



{% comment %}META INFO{% endcomment %}

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">

<meta name="format-detection" content="telephone=no">

<meta name="google-site-verification" content="BtQ7EdEtivXyVhmUdC-5LUVf64NgsZ21c8VdGRUg3Fo" />



{% comment %}FAV ICON{% endcomment %}

<link rel="apple-touch-icon" sizes="180x180" href="{{ assets_path }}/apple-touch-icon.png?v=2">

<link rel="icon" type="image/png" sizes="32x32" href="{{ images_path }}/favicon-32x32.png?v=2">

<link rel="icon" type="image/png" sizes="16x16" href="{{ images_path }}/favicon-16x16.png?v=2">

<link rel="manifest" href="{{ assets_path }}/site.webmanifest">

<link rel="mask-icon" href="{{ assets_path }}/safari-pinned-tab.svg" color="#009de1">

<meta name="msapplication-TileColor" content="#ffffff">

<meta name="msapplication-TileImage" content="{{ images_path }}/mstile-144x144.png?v=2">

<meta name="theme-color" content="#ffffff">

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}

<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" integrity="sha512-3n19xznO0ubPpSwYCRRBgHh63DrV+bdZfHK52b1esvId4GsfwStQNPJFjeQos2h3JwCmZl0/LgLxSKMAI55hgw==" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

{% unless editmode %}
<!-- ClickDesk Live Chat Service for websites -->
<script type='text/javascript'>
  var _glc =_glc || []; _glc.push('all_ag9zfmNsaWNrZGVza2NoYXRyEgsSBXVzZXJzGICAiIOzkIUKDA');
  var glcpath = (('https:' == document.location.protocol) ? 'https://my.clickdesk.com/clickdesk-ui/browser/' :
          'http://my.clickdesk.com/clickdesk-ui/browser/');
  var glcp = (('https:' == document.location.protocol) ? 'https://' : 'http://');
  var glcspt = document.createElement('script'); glcspt.type = 'text/javascript';
  glcspt.async = true; glcspt.src = glcpath + 'livechat-cloud-new.js';
  var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(glcspt, s);
</script>
<!-- End of ClickDesk -->
{% endunless %}

{% comment %}STYLESHEETS{% endcomment %}

{% stylesheet_link "fontawesome-all.min.css" %}

{% stylesheet_link "main.css?v=1.2" %}

{% stylesheet_link "styles.css" %}

{% stylesheet_link "cookie.css" %}







{% if editmode %}

  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">

{% endif %}



{% comment %}SITE TITLE{% endcomment %}

{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}

<title>{{ page_title }}</title>



{% comment %}MISC{% endcomment %}

{% include "open-graph" %}

{% include "site-translations" %}

{% if blog %}{{ blog.rss_link }}{% endif %}

{{ site.stats_header }}

