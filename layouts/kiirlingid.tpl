<!DOCTYPE html>
<!-- page__jobs.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
    <article class="page--detail" data-search-indexing-allowed="false">
        <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <nav class="quick-nav">
            {% for item in elements %}
                {% if item.visible == true and item.model_name == "Kiirlingid" %}
                    <div class="item">
                        <a href="{{ item.url }}"
                           {% if item.image != '' %}style="background-image: url({{ item.image }})"{% endif %}>
                            <div class="item--content">
                                <h3>{{ item.title }}</h3>
                                <p>{{ item.text }}</p>
                            </div>
                        </a>
                    </div>
                {% endif %}
            {% endfor %}
            {% if editmode %}
                <div class="item">
                    <div class="add">
                        {% addbutton element_type="Kiirlingid" %}
                    </div>
                </div>
            {% endif %}
        </nav>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>