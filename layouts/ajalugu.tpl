<!DOCTYPE html>
<!-- ajalugu.tpl -->
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
        <div class="page--content">
            <div class="page--sidebar">
                <nav class="anchor-block">
                  <ul>
                    
                    {% grouped element_years by year in elements %}
                      {% for year in element_years reversed %}
                      {% assign isFirst = forloop.first %}
                        <li class="anchor-block__item u-no-flex">
                          {% for element in year %}
                            {% assign yearAnchor = element.year | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' %}
                            {% if forloop.first %}
                              <a class="has-icon{% if isFirst %} u-active{% endif %}" href="#year-{{ yearAnchor }}"><i class="fas fa-angle-down"></i><span>{{ element.year }}</span></a>
                              <ul{% if isFirst %} style="display: block"{% endif %}>
                              {% grouped element_sections by section in year %}
                                {% for section in element_sections %}
                                  <li class="anchor-block__item u-no-flex">
                                    {% for item in section %}
                                      {% if forloop.first %}
                                        <a class="has-icon" href="#year-{{ yearAnchor }}_{{ item.section | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}"><i class="fas fa-angle-down"></i><span>{{ item.section }}</span></a>
                                        <ul>
                                      {% endif %}
                                      <li class="anchor-block__item u-no-flex">
                                        <a class="has-icon" href="#year-{{ yearAnchor }}_{{ item.title | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}"><span>{{ item.title }}</span></a>
                                      </li>
                                      {% if forloop.last %}
                                        </ul>
                                      {% endif %}
                                    {% endfor %}
                                  </li>
                                {% endfor %}
                              {% endgrouped %}
                            {% endif %}
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
                    {% addbutton element_type="Ajalugu" %}
                {% endif %}
                {% grouped element_years by year in elements %}
                    {% for year in element_years reversed %}
                      {% for element in year %}
                          {% assign yearAnchor = element.year | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' %}
                          {% if forloop.first %}
                              <div class="u-content-styles">
                                  <span></span>
                                  <h2 id="year-{{ yearAnchor }}">
                                    {{ element.year }}
                                  </h2>
                              </div>
                              <div class="accordion">
                              {% grouped element_sections by section in year %}
                                {% for section in element_sections %}
                                  {% for item in section %}
                                    {% if forloop.first %}
                                      <div class="u-content-styles">
                                          <h3 id="year-{{ yearAnchor }}_{{ item.section | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s' | replace: 'ž','z' | replace: '(','_' | replace: ')','_' }}">
                                            {{ item.section }}
                                          </h3>
                                      </div>
                                    {% endif %}
                                    {% assign anchor = item.title | strip | replace:' ','_' | replace: ',','_' | replace: '?','_' | replace: '.','_' | replace: 'ö','o' | replace: 'ä','a' | replace: 'ü','u' | replace: 'õ','o' | replace: 'š','s'| replace: 'ž','z' | replace: '(','_' | replace: ')','_' %}
                                    <article class="accordion__item" id="year-{{ yearAnchor }}_{{ anchor }}">
                                      <header class="accordion__item__head">
                                          <h3>
                                              <{% if editmode %}span{% else %}a href="#{{ anchor }}"{% endif %} class="title" data-accordion-item="#year-{{ yearAnchor }}_{{ anchor }}">
                                                <span class="label">{% editable item.title %}</span>
                                              </{% if editmode %}span{% else %}a{% endif %}>
                                          </h3>
                                      </header>
                                      <div class="accordion__item__body u-content-styles">
                                          {% editable item.body %}
                                      </div>
                                    </article>
                                  {% endfor %}
                                {% endfor %}
                              {% endgrouped %}
                          {% endif %}
                          {% if forloop.last %}
                              </div>
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