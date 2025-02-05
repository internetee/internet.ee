<!DOCTYPE html>
<!-- page__jobs_element.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
    <article class="article--detail">
        <header class="article--header"
                {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        {% if element.model_name == "Tööpakkumised" %}
            <div class="article--content u-content-styles" data-search-indexing-allowed="true">
                <h2>
                    {% if editmode %}
                        {% editable element.title %}
                    {% else %}
                        {{ element.title }}
                    {% endif %}
                </h2>
                <div class="article--summary">
                    <p>
                        {% if editmode %}
                            {% editable element.excerpt %}
                        {% else %}
                            {{ element.excerpt }}
                        {% endif %}
                    </p>
                </div>
                {% if editmode %}
                    {% editable element.tekst %}
                {% else %}
                    {{ element.tekst }}
                {% endif %}
                {% if editmode %}
                    <h3>Ikoon</h3>
                    {% editable element.ikoon %}
                {% else %}
                    {{ element.ikoon }}
                {% endif %}
                {% if editmode %}
                    <h3>Avaldatud</h3>
                    {% editable element.visible %}
                {% endif %}

            </div>
        {% endif %}
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>