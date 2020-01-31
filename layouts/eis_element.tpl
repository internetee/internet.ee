<!DOCTYPE html>
<!-- page__about_element.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}" data-search-indexing-allowed="false">
  <head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
  </head>

  <body>
    {% include "cookie-modal" %}
    {% include "header" %}
    <main class="page-content" role="main">
        <article class="article--detail">
          <header class="article--header" style="background-image:url({{ page.image.schemeless_url }})">
            <div class="u-container">
              <h1>{% contentblock name="about-page-title" single="plaintext" escape="false" xpage="true" %}EIS tegeleb .ee tippdomeeni haldusega{% endcontentblock %}</h1>
              <p>{{ page.description }}</p>
            </div>
          </header>
          <div class="article--content">
            <div class="article--body u-content-styles">
                {% if element.model_name == "Kontaktid" %}
                {% editable element.pilt target_width="200" %}
                    <h3>Nimi</h3>
                    <p>{% editable element.title %}</p>
                    <h3>Amet</h3>
                    <p>{% editable element.amet %}</p>
                    <h3>Email</h3>
                    <p>{% editable element.email %}</p>
                    <h3>Telefon</h3>
                    <p>{% editable element.telefon %}</p>
                {% endif %}
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
            </div>
          </div>
        </article>
    </main>
  {% include "footer" %}
  {% include "site-javascripts" %}
  </body>
</html>