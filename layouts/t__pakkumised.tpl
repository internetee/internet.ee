<!DOCTYPE html>
<!-- t__pakkumised.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "cookie-modal" %}
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
        {% if elements.size < 1 %}
            <div class="page--content">
                <div class="page--body">
                    <div class="u-content-styles">
                        {% contentblock name="job-offers-content" xpage="true" %}
                            <p>Hetkel aktiivseid tööpakkumisi ei ole</p>
                        {% endcontentblock %}
                    </div>
                </div>
            </div>
            {% if editmode %}
                <div class="job-offers--list">
                    <div class="item">
                        <div class="item--content add">
                            <div>
                                <div class="image">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                {% addbutton page_id=page.id element_type="Tööpakkumised" %}
                            </div>
                        </div>
                    </div>
                </div>
            {% endif %}
        {% endif %}
        {% for item in elements %}
            {% if forloop.first %}
                <div class="job-offers--list">
                {% if editmode %}
                    <div class="item">
                        <div class="item--content add">
                            <div>
                                <div class="image">
                                    <i class="fas fa-user-plus"></i>
                                </div>
                                {% addbutton page_id=page.id element_type="Tööpakkumised" %}
                            </div>
                        </div>
                    </div>
                {% endif %}
            {% endif %}
            {% if item.visible == true and item.model_name == "Tööpakkumised" %}
                <article class="item">
                    <a href="{{ item.url }}" class="item--content">
                        {% if contact.icon != '' %}
                            <div class="image">
                                <i class="fas {{ item.ikoon }}"></i>
                            </div>
                        {% else %}
                            <div class="image">
                                <i class="fas fa-user"></i>
                            </div>
                        {% endif %}
                        <h3>{{ item.title }}</h3>
                        <p>{{ item.excerpt }}</p>
                    </a>
                    {% if editmode %}
                        <a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a>
                    {% endif %}
                </article>
            {% endif %}
            {% if forloop.last %}
                </div>
            {% endif %}
        {% endfor %}
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
</body>
</html>