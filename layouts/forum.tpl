<!DOCTYPE html>
<!-- forum.tpl -->
<html class="common-page forum {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body>
    {% include "header" %}
    <div class="background-image">&nbsp;</div>
    <div class="site-container">
      {% include "site-header" %}

      <main class="page-content" role="main">
        <section class="content-inner content-area" data-search-indexing-allowed="true">
          <a href="#" class="print" onclick="print();"></a>
          <div class="grid">
            {% for article in articles  %}
              <a href="{{ article.url }}" class="grid-item">
                <span class="center-text">
                  <span class="article-title">{{ article.title }} <span class="comments-count">[{{ article.comments_count }}]</span></span>
                  <span class="comments-time">{% if article.comments_count > 0 %}{{ last_comment_at }}: {{ article.comments.last.created_at | date: "%d.%m.%y, %H:%M" }}{% else %}{{ no_comments }}{% endif %}</span>
                </span>
              </a>
            {% endfor %}
          </div>
          {% addbutton %}
        </section>
      </main>

    </div>
  <div class="header-anchor" style="display: none;">
    <a href="#">Tagasi üles</a>
  </div>
  {% include "footer" %}
  {% include "site-javascripts" %}
  <script>site.initCommonPage();</script>
  {% include "footer-scripts" %}
</body>
</html>



