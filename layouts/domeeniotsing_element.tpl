<!DOCTYPE html>
<!-- page_domain_element.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}" data-search-indexing-allowed="false">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>
  <body class="page-domain">
    <div class="site-container">
    {% include "cookie-modal" %}
    {% include "header" %}
      <main class="page-content" role="main">
          {% include 'pagehead' %}
        <section class="content-inner content-area">
         <div class="article-content">
              <h1>{{element_added}}</h1>
         </div>
        </section>
      </main>
  {% include "footer" %}
    </div>
  {% include "site-javascripts" %}
  <script>
    var url = window.location.href;
    if(url.slice(-1) == '/'){
     url = url.substring(0,url.lastIndexOf("/"));
    }
    url = url.substring(0,url.lastIndexOf("/"));
    window.location.href = url;
  </script>
  </body>
</html>