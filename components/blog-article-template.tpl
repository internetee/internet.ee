<div class="article--content">
    <div class="article--body u-content-styles">
        <h2>{% editable article.title %}</h2>
        <div class="article--summary">
            {% editable article.excerpt %}
        </div>
        {% if article.image %}
        <div class="article--image">
            <img src="{{ article.image.for-width-1024.schemeless_url }}" alt="{{ article.title }}">
        </div>
        {% endif %}
        {% editable article.body %}
        <div class="columns">
            <div class="col">
                {% if editmode %}
                <h2>Galerii</h2>
                {% endif %}
                {% content name="gallery_block" bind="Article" %}
            </div>
        </div>
        <div class="columns">
            <div class="col file-col">
                {% content name="files" %}
            </div>
        </div>
    </div>
    <div class="article--sidebar">
        <footer class="article--meta">
            {% if editmode %}
                <div class="author--image" class="cover-image editable-cover-image"
                     data-image="{{ article.data.author_image.url }}">

                </div>
            {% else %}
                <div class="author--image">
                    {% if article.data.author_image.url %}
                        <img src="{{ article.data.author_image.url }}" alt="{{ article.author.name }}">
                    {% else %}
                        <i class="fas fa-user"></i>
                    {% endif %}
                </div>
            {% endif %}
            <p class="article--author">
                {{ article.author.name }}
            </p>
            <p class="article--date"><i class="fas fa-pencil-alt"></i>{{ article.created_at | date: "%d.%m.%Y" }}</p>
            <div class="article--data">
                {% if editmode %}
                    <div class="item article--type">
                        <input type="text" name="article[type]" placeholder="Kirjuta sisu tüüp siia" value="{{ article.data.type }}"/>
                    </div>
                {% else %}
                    {% if article.data.type.size > 1 %}
                        <a href="{{ article.page.url }}?type={{ article.data.type }}" class="item article--type">{{ article.data.type }}</a>
                    {% endif %}
                {% endif %}
                {% if editmode %}
                    <div class="item article--topic">
                        <input type="text" name="article[topic]" placeholder="Kirjuta teema siia" value="{{ article.data.topic }}"/>
                    </div>
                {% else %}
                    {% if article.data.topic.size > 1 %}
                        <a href="{{ article.page.url }}?topic={{ article.data.topic }}" class="item article--topic">{{ article.data.topic }}</a>
                    {% endif %}
                {% endif %}
                {% for tag in article.tag_names limit: 1 %}
                    {% for tagname in article.tag_names %}
                        <a href="{{ article.page.url }}?tag={{ tagname }}" class="item article--type">{{ tagname }}</a>
                    {% endfor %}
                {% endfor %}
            </div>
            {% if editmode %}
                <div class="article-tags" style="margin-top:35px;margin-left:0;">
                    {% editable article.tags %}
                </div>
            {% endif %}
        </footer>
    </div>
</div>
{% if blog-article-template == "article_page" %}
    <section class="section article--comments">
        <div class="comments">
            {% if article.comments_count > 0 %}
                <header class="section--header">
                    <h2>{{ comments }}</h2>
                </header>
                <div class="comments--list">
                    {% for comment in article.comments %}
                        <article class="comment">
                            <div class="comment-author"><strong>{{ comment.author }}</strong><span
                                        class="comment-date">{{ comment.created_at  | date: "%d.%m.%Y" }}</span>{% removebutton %}
                            </div>
                            <div class="comment-body"><p>{{ comment.body }}</p></div>
                        </article>
                    {% endfor %}
                </div>
            {% else %}
                <header class="section--header">
                    <h2>{{ comments }}</h2>
                </header>
            {% endif %}
            {% unless editmode %}
                <div class="article-commentform u-content-styles">
                    {% commentform %}
                        <div class="form_area">
                            <div class="form_fields">
                                <div class="form_field{% if comment_name_error %} form_field_with_errors{% endif %}">
                                    {% if comment_name_error %}
                                        <label class="form_field_error"
                                               for="comment-form-name">{{ "comment_author_blank" | lc }}</label>
                                    {% else %}
                                        <label for="comment-form-name">{{ "name" | lc }}</label>
                                    {% endif %}
                                    <input id="comment-form-name" class="form_field_textfield form_field_size_small"
                                           name="comment[author]" value="{{ comment.author }}">
                                </div>
                                <div class="form_field{% if comment_email_error %} form_field_with_errors{% endif %}">
                                    {% if comment_email_error %}
                                        <label class="form_field_error"
                                               for="comment-form-name">{{ "comment_email_blank" | lc }}</label>
                                    {% else %}
                                        <label for="comment-form-name">{{ "email" | lc }}</label>
                                    {% endif %}
                                    <input id="comment-form-email" class="form_field_textfield form_field_size_small"
                                           name="comment[author_email]" value="{{ comment.author_email }}">
                                </div>
                                <div class="form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
                                    {% if comment_body_error %}
                                        <label class="form_field_error"
                                               for="comment-form-name">{{ "comment_body_blank" | lc }}</label>
                                    {% else %}
                                        <label for="comment-form-name">{{ "comment" | lc }}</label>
                                    {% endif %}
                                    <textarea id="comment-form-body" class="form_field_textarea form_field_size_medium"
                                              name="comment[body]" rows="4">{{ comment.body }}</textarea>
                                </div>
                                <div class="form_field">
                                    <div class="g-recaptcha"></div>
                                </div>
                            </div>
                            <div class="form_submit">
                                <input type="submit" value="{{ 'submit_comment' | lc }}">
                            </div>
                        </div>
                    {% endcommentform %}
                </div>
            {% endunless %}
        </div>
    </section>
{% endif %}
<style>
    .edy-img-drop-area {
        height: 100px;
        background: no-repeat 0 0 / auto 100px;
        margin-bottom: 20px;
    }

    .edy-img-drop-area.active {
        border: 0;
    }

    .editable-cover-image {
        cursor: move;
        border: 1px dashed #ccc;
    }

    .edy-img-drop-area-placeholder {
        padding: 113px 5px;
    }

    .edy-img-drop-area-positionable.over {
        background-color: rgba(0, 0, 0, .2);
    }
</style>

{% editorjsblock %}
    <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
    <script>
        (function ($) {
            var pictureDropArea = new Edicy.ImgDropArea($('.author--image'), {
                positionable: true,

                change: function (data) {
                    Edicy.articles.currentArticle.setData({
                        'author_image': data
                    });
                }
            });
        })(Edicy.jQuery);
    </script>
{% endeditorjsblock %}