<!DOCTYPE html>
<!-- iconblocks.tpl -->
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
        <div class="info-blocks">
            {% for item in elements %}
                {% if item.visible == true and item.model_name == "Ikooniplokid" and item.page_id == page.id %}
                    <article class="block block--text">
                        <div class="icon">
                            <i class="fas {{ item.icon }}"></i>
                        </div>
                        {% if editmode %}
                            Ikoon:
                            {% editable item.icon %}
                        {% endif %}
                        <h2>{% editable item.title %}</h2>
                        {% editable item.text %}
                        {% if editmode %}
                            <p><a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a></p>
                        {% endif %}
                    </article>
                {% endif %}
            {% endfor %}
            {% if editmode %}
                <article class="block block--text">
                    <div class="add">
                        {% addbutton page_id=page.id element_type=item.model_name %}
                    </div>
                </article>
            {% endif %}
        </div>
    </article>
</main>

{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>