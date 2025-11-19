<!DOCTYPE html>
<!-- blog_news_detail.tpl -->
<html class="blog-page blog-article-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
  <article class="article--detail">
    <header class="article--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
      <div class="u-container">
        <h1>{{ page.title }}</h1>
          {% if page.description != "" %}
            <p>{{ page.description }}</p>
          {% endif %}
      </div>
      <a href="/{{ blog.page.path }}" class="btn btn-back"><span><i class="fas fa-arrow-left"></i>{{ label_back }}</span></a>
    </header>
      {% include "blog-article-template" with "article_page" %}
  </article>
  <section class="section">
    <header class="section--header">
      <h2>{% content single="plaintext" name="more_posts_block" xpage="true" placeholder="Veel uudiseid, sündmusi ja blogipostitusi" %}</h2>
      <div class="section--actions">
        <a href="/{{ blog.page.path }}" class="btn btn-view-more"><span>{{ label_view_all }}</span><i class="fas fa-arrow-right"></i></a>
      </div>
    </header>
    <div class="articles--list">
        {% assign articlesCount = 1 %}
        {% for item in blog.latest_4_articles %}
            {% if article.id != item.id and articlesCount < 4 %}
                {% assign articlesCount = articlesCount | plus: 1 %}
                {% include "blog-article-single" with item %}
            {% endif %}
        {% endfor %}
    </div>
  </section>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
      var pageData = new Edicy.CustomData({
          type: 'article',
          id: '{{ article.id }}'
      });
      site.initArticlePage();
  </script>
{% endeditorjsblock %}
{% include "footer-scripts" %}
</body>
</html>