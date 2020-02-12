<!DOCTYPE html>
<!-- forum_topic.tpl -->
<html class="common-page forum {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body>
    {% include "cookie-modal" %}
    {% include "header" %}
    <div class="background-image">&nbsp;</div>
    <div class="site-container">
      {% include "site-header" %}

      <main class="page-content" role="main">
        <section class="content-inner content-area" data-search-indexing-allowed="true">
          <a class="back-link" href="{{ page.url }}">{{ back_to_forum }}</a>
          <a href="#" class="print" onclick="print();"></a>
          <article class="blog-article">
            <header>
              <time class="article-date" datetime="{{ article.created_at | date: "%Y-%m-%d" }}">{{ article.created_at | date: "%d.%m.%Y" }}</time>
              <h2>{% editable article.title %}</h2>
            </header>
            <section data-search-indexing-allowed="true">
              <div class="article-excerpt content-area">
                {% editable article.excerpt %}
              </div>
              <div class="article-body content-area">
                {% editable article.body %}
              </div>
            </section>
            {% if article.comments_count > 0 %}
              <div class="article-comments">
                <h3>{{ comments }}</h3>
                {% for comment in article.comments %}
                  <div class="comment">
                    <div class="comment-author"><strong>{{ comment.author }}</strong><span class="comment-date">{{ comment.created_at  | date: "%Y-%m-%d %H:%M"}}</span>{% removebutton %}</div>
                    <div class="comment-body"><p>{{ comment.body }}</p></div>
                  </div>
                {% endfor %}
              </div>
            {% endif %}
            {% unless editmode %}
              <div class="article-commentform">
                <h3>{{ new_comment }}</h3>
                {% commentform %}
                  <div class="form_area">
                    <div class="form_fields">
                      <div class="form_field{% if comment_name_error %} form_field_with_errors{% endif %}">
                        {% if comment_name_error %}
                          <label class="form_field_error" for="comment-form-name">{{ "comment_author_blank" | lc }}</label>
                        {% else %}
                          <label for="comment-form-name">{{ "name" | lc }}</label>
                        {% endif %}
                        <input id="comment-form-name" class="form_field_textfield form_field_size_small" name="comment[author]" value="{{ comment.author }}">
                      </div>

                      <div class="form_field{% if comment_email_error %} form_field_with_errors{% endif %}">
                        {% if comment_email_error %}
                          <label class="form_field_error" for="comment-form-name">{{ "comment_email_blank" | lc }}</label>
                        {% else %}
                          <label for="comment-form-name">{{ "email" | lc }}</label>
                        {% endif %}
                        <input id="comment-form-email" class="form_field_textfield form_field_size_small" name="comment[author_email]" value="{{ comment.author_email }}">
                      </div>

                      <div class="form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
                        {% if comment_body_error %}
                          <label class="form_field_error" for="comment-form-name">{{ "comment_body_blank" | lc }}</label>
                        {% else %}
                          <label for="comment-form-name">{{ "comment" | lc }}</label>
                        {% endif %}
                        <textarea id="comment-form-body" class="form_field_textarea form_field_size_medium" name="comment[body]" rows="4">{{ comment.body }}</textarea>
                      </div>
                    </div>

                    <div class="form_submit">
                      <input type="submit" value="Saada">
                    </div>
                  </div>
                {% endcommentform %}
              </div>
            {% endunless %}
          </article>
        </section>
      </main>

    </div>
  <div class="header-anchor" style="display: none;">
    <a href="#">Tagasi üles</a>
  </div>
  {% include "footer" %}
  {% include "site-javascripts" %}
  <script>site.initCommonPage();</script>
  </body>
</html>



