<!DOCTYPE html>
<!-- page__jobs_element.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
    <article class="article--detail" data-search-indexing-allowed="false">
        <header class="article--header"
                {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        {% if element.model_name == "Kiirlingid" %}
            <div class="article--content">
                <div class="article--body u-content-styles">
                    <h2>
                        {% if editmode %}
                            {% editable element.title %}
                        {% else %}
                            {{ element.title }}
                        {% endif %}
                    </h2>
                    {% if editmode %}
                        <h3>Tekst</h3>
                        {% editable element.text %}
                    {% else %}
                        {{ element.text }}
                    {% endif %}
                    {% if editmode %}
                        <h3>Pilt</h3>
                        {% editable element.image %}
                    {% else %}
                        {{ element.image }}
                    {% endif %}
                    {% if editmode %}
                        <h3>Link</h3>
                        {% editable element.link %}
                    {% endif %}
                    {% if editmode %}
                        <h3>Avaldatud</h3>
                        {% editable element.visible %}
                    {% endif %}
                </div>
            </div>
        {% endif %}
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>