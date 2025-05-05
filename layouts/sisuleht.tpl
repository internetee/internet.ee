<!DOCTYPE html>
<!-- page__default.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  <script src="//www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
  <script type="text/javascript">
      var onloadCallback = function () {
        if (document.querySelector(".form_area")) {
          var captchaElem = document.createElement("div");
          captchaElem.classList.add('g-recaptcha');
          captchaElem.setAttribute('id', 'form-recaptcha');
          var form = document.querySelector(".form_area");
          var elem = document.querySelector(".form_submit");
          form.insertBefore(captchaElem, elem);
          window.captchaID = grecaptcha.render('form-recaptcha', {
            'sitekey': '6Ld-ARETAAAAAPN1pcTy9oYsUrbKm9_c9VDMvl6X'
          });
        }
      };
  </script>
</head>
<body>
{% include "header" %}
<main class="page-content" role="main">
  <article class="page--detail" data-search-indexing-allowed="true">
    <header class="page--header" {% if page.image? %}style="background-image: url({{ assets_path }}/hero.png)"{% endif %}>
      <div class="u-container">
        <h1>{{ page.title }}</h1>
        {% if page.description != "" %}
          <p>{{ page.description }}</p>
        {% endif %}
      </div>
    </header>
    <div class="anchors js-anchors">
      <div class="keywords-list">
      
      </div>
    </div>
    <div class="page--content">
      <div class="page--body u-content-styles">
        {% content %}
        <div class="columns">
          <div class="col file-col file-col-with-icon">
            {% content name="files" %}
          </div>
          <div class="col file-col file-col-with-icon">
            {% content name="files2" %}
          </div>
          {% include "document-selector" %}
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