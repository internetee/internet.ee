<!DOCTYPE html>
<!-- dictionary.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
    <article class="page--detail" data-search-indexing-allowed="true">
        <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="page--content">
            <div class="page--body u-content-styles">
                {% assign sortedByTitle = elements | sort: "title" %}
              {% if elements.size < 1 %}
                {% if editmode %}
                  {% addbutton page_id=page.page_id element_type="Sõnaraamat" %}
                {% endif %}
              {% endif %}
                {% for item in sortedByTitle %}
                    {% if forloop.first %}
                        {% if editmode %}
                            {% addbutton page_id=item.page_id element_type=item.model_name %}
                        {% endif %}
                    {% endif %}
                    {% if item.visible == true and item.model_name == "Sõnaraamat" %}
                        <h2>{{ item.title }}</h2>
                        <p>{{ item.text }}</p>
                        {% if editmode %}
                            <p><a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>Muuda</span></a></p>
                        {% endif %}
                        {% if forloop.last %}
                            {% if editmode %}
                                {% addbutton page_id=item.page_id element_type=item.model_name %}
                            {% endif %}
                        {% endif %}
                    {% endif %}
                {% endfor %}
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>