{% comment %}FACEBOOK OPEN GRAPH META TAGS{% endcomment%}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% comment %}Open Graph basics{% endcomment %}
{% if site.data.fb_admin %}
  <meta property="fb:admins" content="{{ site.data.fb_admin }}">
{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:"/" }}{% else %}{{ page.url | remove_first:"/" }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% comment %}Open Graph image{% endcomment %}
{% if article and article.image %}
  <meta property="og:image" content="{{ article.image }}">
{% elsif page.image %}
  <meta property="og:image" content="{{ page.image }}">
{% elsif site.root_item.image %}
  <meta property="og:image" content="{{ site.root_item.image }}">
{% endif %}

