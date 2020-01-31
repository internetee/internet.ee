<!DOCTYPE html>
<!-- front_page.tpl -->
<html class="front-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
</head>

<body>
{% include "cookie-modal" %}
{% include "header" %}
<main class="page-content" role="main" data-search-indexing-allowed="true">
    <div class="page-hero">
        {% include 'front-page-slider' %}
    </div>
    {% include "domain-search" %}
    <div class="info-blocks">
        {% comment %}
        <article class="block block--domain-auctions">
            <h2>{{ label_domain_auctions }}</h2>
            <ul>
                <li><a href=""><strong>lumememm.ee</strong><span><i class="far fa-clock"></i><strong>4</strong>h&nbsp;<strong>23</strong>m</span></a>
                </li>
                <li><a href=""><strong>kinnisvara.ee</strong><span><i class="far fa-clock"></i><strong>4</strong>h&nbsp;<strong>23</strong>m</span></a>
                </li>
                <li><a href=""><strong>ostankohe.ee</strong><span><i class="far fa-clock"></i><strong>4</strong>h&nbsp;<strong>23</strong>m</span></a>
                </li>
                <li><a href=""><strong>mati872.ee</strong><span><i class="far fa-clock"></i><strong>4</strong>h&nbsp;<strong>23</strong>m</span></a>
                </li>
                <li><a href=""><strong>vanaema.ee</strong><span><i class="far fa-clock"></i><strong>4</strong>h&nbsp;<strong>23</strong>m</span></a>
                </li>
            </ul>
            <footer>
                <p><strong>22</strong> {{ label_more_domains }}</p>
                <a href="" class="btn btn-view-more"><span>Vaata kõiki</span><i class="fas fa-arrow-right"></i></a>
            </footer>
        </article>
        {% endcomment %}
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/spider.svg" alt="rod">
            </div>
            {% contentblock name="help_block" publish_default_content="true" %}
                <h2>Abi ja info</h2>
                <p>Eesti Interneti SA tegeleb .ee tippdomeeni haldusega. Loe veel meie kohta.</p>
                <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/fish.svg" alt="fish">
            </div>
            {% contentblock name="about_block" publish_default_content="true" %}
                <h2>Mis on Eesti Interneti SA?</h2>
                <p>Eesti Interneti SA tegeleb .ee tippdomeeni haldusega. Loe veel meie kohta.</p>
                <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/spider.svg" alt="spider">
            </div>
            {% contentblock name="registrant_block" publish_default_content="true" %}
                <h2>Registripidajatele</h2>
                <p>Soovid saada registripidajaks või sul tehnilisi küsimusi seoses registripidamisega?</p>
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
</body>
</html>
