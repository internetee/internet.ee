<!DOCTYPE html>
<!-- front_page_rgr.tpl -->
<html class="front-page front-page-rgr {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
</head>

<body>
{% include "header" rgr_portal: true %}
<main class="page-content" role="main" data-search-indexing-allowed="true">
    <div class="page-hero">
        {% include 'front-page-slider' %}
    </div>
    <div class="info-blocks">
        <article class="block block--text">
            <div class="icon">
                <i class="fas fa-file-alt"></i>
            </div>
            {% contentblock name="domain_regulations_block" publish_default_content="true" %}
                <h2>Domeenireeglite viimased muudatused</h2>
                <p>Viimased muudatused tehti 20/09/17. Loe edasi, millised muutused tehti.</p>
                <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        <article class="block block--text">
            <div class="icon">
                <i class="fas fa-user-plus"></i>
            </div>
            {% contentblock name="portal_login_block" publish_default_content="true" %}
                <h2>Logi sisse, et teha registripidaja toiminguid</h2>
                <p>Registripidaja töölaual saad domeenide, krediidiga ja kontaktidega seostuvaid toiminguid teha.</p>
                <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        <article class="block block--text">
            <div class="icon">
                <i class="fas fa-certificate"></i>
            </div>
            {% contentblock name="registrant_cert_block" publish_default_content="true" %}
                <h2>Registripidajate sertifitseerimine</h2>
                <p>Uued registripidajad peavad end sertifitseerima ja olemasolevad peavad tegema kordustesti.</p>
                <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
    </div>
    {% include "front-page-posts" %}
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% editorjsblock %}
    <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
    <script>
        var pageData = new Edicy.CustomData({
            type: 'page',
            id: '{{ page.id }}'
        });

    </script>
{% endeditorjsblock %}
<script>site.initFrontPage();</script>
{% include "footer-scripts" %}
</body>
</html>
