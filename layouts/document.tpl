<!DOCTYPE html>
<!-- page_help-detail.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">

<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
    {% include "header" %}
    <main class="page-content" role="main">
        <article class="article--detail" data-search-indexing-allowed="true">
            <header class="article--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
                <div class="u-container">
                    <h1>{{ page.title }}</h1>
                    {% if page.description != '' %}
                        <p>{{ page.description }}</p>
                    {% endif %}
                </div>
            </header>
            <div class="article--content">
                <div class="article--body">
                    <div class="u-content-styles s-element-form">
                        <div>
                            <label>Document Name</label>
                            {% editable element.title %}
                        </div>
                        <div>
                            <label>Description</label>
                            {% editable element.description %}
                        </div>
                        <div>
                            <label>Document Size</label>
                            {% editable element.filesize %}
                        </div>
                        <div>
                            <label>File (URL)</label>
                            {% editable element.file %}
                        </div>
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
