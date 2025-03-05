<!DOCTYPE html>
<!-- faq_item.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}" data-search-indexing-allowed="false">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>
<body>
{% include "header" %}
<main class="page-content" role="main">
  <article class="page--detail">
    <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
      <div class="u-container">
        <h1>{{ page.title }}</h1>
          {% if page.description != "" %}
            <p>{{ page.description }}</p>
          {% endif %}
      </div>
    </header>
    <div class="page--content">
      <div class="page--body">
        <div class="u-content-styles">
          <h2>{% editable element.title %}</h2>
            {% editable element.body %}
            {% if editmode %}
              <p><strong>Anchor name </strong>(optional):<br>
                  {% editable element.anchor %}
              </p>
              <p><strong>Section:</strong><br>
                  {% editable element.section %}
              </p>
            {% endif %}
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
