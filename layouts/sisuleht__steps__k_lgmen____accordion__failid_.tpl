<!DOCTYPE html>
<!-- page_domain.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>
<body class="page-domain">
{% include "header" %}
<main class="page-content" role="main">
    <article class="article--detail" data-search-indexing-allowed="true">
        <header class="article--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != '' %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        {% include 'steps-block' %}
        <div class="article--content">
            <div class="article--sidebar">
                {% include "accordion-anchors" %}
            </div>
            <div class="article--body">
                <div class="u-content-styles">
                    {% content %}
                </div>
                {% assign accordion_classes = "accordion--alt" %}
                {% include "accordion" %}
                <div class="u-content-styles">
                    <div class="columns">
                        <div class="col file-col">
                            {% content name="file-block" %}
                        </div>
                        <div class="col file-col">
                            {% content name="file-block2" %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>