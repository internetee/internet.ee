<!DOCTYPE html>
<!-- blog_procurements.tpl -->
<html class="blog-page blog-procurements-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    {{ blog.rss_link }}
  </head>
  <body>
    {% include "cookie-modal" %}
    {% include "header" %}
    <div class="site-container">
      <main class="page-content" role="main">
        <section class="page--detail" data-search-indexing-allowed="true">
          <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
              <h1>{{ page.title }} {% addbutton %}</h1>
              {% if page.description != "" %}
                <p>{{ page.description }}</p>
              {% endif %}
            </div>
          </header>
          <div class="articles--list" data-search-indexing-allowed="false">
            {% for item in blog.articles %}
              {% include "blog-article-single" with item %}
            {% endfor %}
          </div>
        </section>
      </main>
    </div>
    {% include "footer" %}
    {% include "site-javascripts" %}
  </body>
</html>