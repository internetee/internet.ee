<!DOCTYPE html>
<!-- page__default.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>
<body>
{% include "cookie-modal" %}
{% include "header" %}
<main class="page-content" role="main">
    <article class="article--detail" data-search-indexing-allowed="false">
        <header class="article--header"
                {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="article--content">
            <div class="article--body u-content-styles">
                {% if element.model_name == "Slide" %}
                    <h2>{% editable element.title %}</h2>
                    <h3>Pilt</h3>
                    {% editable element.image %}
                    <h3>Tekst</h3>
                    {% editable element.body %}
                    <h3>Nähtavus</h3>
                    {% editable element.visible %}
                {% endif %}
                {% if element.model_name == "Registrant" %}
                    <h2>{% editable element.title %}</h2>
                    <h3>identification_methods</h3>
                    {% editable element.identification_methods %}
                    <h3>dnssec</h3>
                    {% editable element.dnssec %}
                    <h3>ep</h3>
                    {% editable element.ep %}
                    <h3>short_url</h3>
                    {% editable element.short_url %}
                    <h3>customer_service</h3>
                    {% editable element.customer_service %}
                    <h3>website</h3>
                    {% editable element.website %}
                    <h3>phone</h3>
                    {% editable element.phone %}
                    <h3>email</h3>
                    {% editable element.email %}
                    <h3>languages</h3>
                    {% editable element.languages %}
                    <h3>Logo</h3>
                    {% editable element.logo %}
                {% endif %}
                {% if element.model_name == "Sotsiaalmeedia" %}
                    <h2>{% editable element.title %}</h2>
                    <h3>Link</h3>
                    {% editable element.link %}
                    <h3>Ikoon</h3>
                    {% editable element.icon %}
                    <p>Ikoonid: <a href="https://fontawesome.com/icons">https://fontawesome.com/icons</a></p>
                    <p>Brandide ikoonid kirjutada kujul: fab fa-facebook</p>
                    <p>Regular ikoonid kirjutada kujul: far fa-compass</p>
                    <p>Solid ikoonid kirjutada kujul: fas fa-rss-square</p>
                {% endif %}
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
</body>
</html>