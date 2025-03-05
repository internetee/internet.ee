<!DOCTYPE html>

<!-- common_page_with_custom_form.tpl -->

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

        <div class="customForm js-customForm">

            {% content %}

        </div>

      </div>

    </div>

  </article>

</main>

{% include "footer" %}

{% include "site-javascripts" %}

<script src="{{ javascripts_path }}/custom-form.js"></script>

</body>

</html>