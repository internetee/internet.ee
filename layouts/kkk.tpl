<!DOCTYPE html>
<!-- faq.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>
<body>
{% include "cookie-modal" %}
{% include "header" %}
<main class="page-content" role="main">
    <article class="page--detail" data-search-indexing-allowed="true">
        <header class="page--header"
                {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="page--content">
            <div class="page--sidebar">
                <nav class="anchor-block">
                    <ul>
                        {% grouped sections by section in elements %}
                            {% for section in sections %}
                                <li class="anchor-block__item u-no-flex">
                                    {% for element in section %}
                                        {% if forloop.first %}
                                            <a href="#{{ element.section | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}">{{ element.section }}</a>
                                            <ul>
                                        {% endif %}
                                        <li class="anchor-block__item u-no-flex">
                                            <a href="#{{ element.title | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}">{{ element.title }}</a>
                                        </li>
                                        {% if forloop.last %}
                                            </ul>
                                        {% endif %}
                                    {% endfor %}
                                </li>
                            {% endfor %}
                        {% endgrouped %}
                    </ul>
                </nav>
            </div>
            <div class="page--body">
                <div class="u-content-styles">
                    {% content name="faq-content" %}
                </div>
                {% if editmode %}
                    {% addbutton element_type="FAQ" %}
                {% endif %}
                {% grouped sections by section in elements %}
                    {% for section in sections %}
                        {% for element in section %}
                            {% if element.model_name == "FAQ" %}
                                {% assign anchor = element.title | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s'| replace: 'ž','z' | replace: '(','_' | replace: ')','_' %}
                                {% if forloop.first %}
                                    <div class="accordion" id="{{ element.section | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}">
                                    <div class="u-content-styles">
                                        <span></span>
                                        <h2>{{ element.section }}</h2>
                                    </div>
                                {% endif %}
                                <article class="accordion__item" id="{{ anchor }}">
                                    <header class="accordion__item__head">
                                        <h3>
                                            <{% if editmode %}span{% else %}a href="#{{ anchor }}"{% endif %} class="title"
                                                                                                              data-accordion-item="#{{ anchor }}">
                                              <span class="label">{% editable element.title %}</span>
                                            </{% if editmode %}span{% else %}a{% endif %}>
                                        </h3>
                                    </header>
                                    <div class="accordion__item__body u-content-styles">
                                        {% editable element.body %}
                                    </div>
                                </article>
                                {% if forloop.last %}
                                    </div>
                                {% endif %}
                            {% endif %}
                        {% endfor %}
                    {% endfor %}
                {% endgrouped %}
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
</body>
</html>