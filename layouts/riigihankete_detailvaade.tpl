<!DOCTYPE html>
<!-- blog_procurements_detail.tpl -->
<html class="blog-page blog-article-page {% if editmode %}editmode{% else %}public{% endif %}"
      lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "cookie-modal" %}
{% include "header" %}
<div class="site-container">
    <main class="page-content" role="main">
        <article class="article--detail" data-search-indexing-allowed="true">
            <header class="article--header"
                    {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
                <div class="u-container">
                    <h1>{{ page.title }}</h1>
                    {% if page.description != "" %}
                        <p>{{ page.description }}</p>
                    {% endif %}
                </div>
                <a href="/{{ blog.page.path }}" class="btn btn-back"><span><i class="fas fa-arrow-left"></i>{{ label_back }}</span></a>
            </header>
            {% include "blog-article-template" with="procurement_page" %}
        </article>
        <section class="section">
            <header class="section--header">
                <h2>{% content name="procurements_block_title" placeholder="Veel riigihankeid" single="plaintext" xpage="true" %}</h2>
                <div class="section--actions">
                    <a href="/{{ blog.page.path }}" class="btn btn-view-more"><span>{{ label_view_all }}</span><i class="fas fa-arrow-right"></i></a>
                </div>
            </header>
            <div class="articles--list">
                {% for article in blog.latest_3_articles %}
                    {% include "blog-article-single" with article %}
                {% endfor %}
            </div>
        </section>
    </main>
</div>
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

</body>
</html>