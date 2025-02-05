<!DOCTYPE html>
<!-- statistics.tpl -->
<html class="common-page statistics-page {% if editmode %}editmode{% else %}public{% endif %}"
      lang="{{ page.language_code }}">
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
                {% if page.description != "" %}
                <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="article--content">
            <div class="article--body u-content-styles">
                <div class="chart-container">
                    <div class="accordion accordion-stats">
                        <article class="accordion__item" id="chart-total">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-total">
                                                {% contentblock name="accordion-title-1" publish_default_content="true" single="plaintext" %}
                                                    Registreeritud domeenide arv
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-total" data-accordion-item="#chart-total">
                                        {% contentblock name="accordion-title-1" publish_default_content="true" single="plaintext" %}
                                        Registreeritud domeenide arv
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="content-tabs">
                                    <div class="content-tabs--nav">
                                        {% if editmode %}
                                        <span class="item u-active">
                                                    {% contentblock name="tab-link-1" publish_default_content="true" single="plaintext" %}
                                                        Registreeritud domeenide arv
                                                    {% endcontentblock %}
                                                </span>
                                        {% else %}
                                        <a href="#tab-1" class="item u-active">
                                            {% contentblock name="tab-link-1" publish_default_content="true" single="plaintext" %}
                                            Registreeritud domeenide arv
                                            {% endcontentblock %}
                                        </a>
                                        {% endif %}
                                        {% if editmode %}
                                        <span class="item">
                                                    {% contentblock name="tab-link-2" publish_default_content="true" single="plaintext" %}
                                                        Domeenid välisriikidest
                                                    {% endcontentblock %}
                                                </span>
                                        {% else %}
                                        <a href="#tab-1" class="item">
                                            {% contentblock name="tab-link-2" publish_default_content="true" single="plaintext" %}
                                            Domeenid välisriikidest
                                            {% endcontentblock %}
                                        </a>
                                        {% endif %}
                                    </div>
                                    <div class="content-tabs--items">
                                        <div class="content-tabs--item u-active">
                                            <div class="chart-item" id="total-chart"></div>
                                        </div>
                                        <div class="content-tabs--item">
                                            <div class="chart-item" id="countrychart"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-1" publish_default_content="true" %}
                                    <p>Nullam quis risus eget urna mollis ornare vel eu leo. Morbi leo risus, porta
                                        ac
                                        consectetur ac, vestibulum at eros. Maecenas sed diam eget risus varius
                                        blandit sit amet
                                        non magna. Praesent commodo cursus magna, vel scelerisque nisl consectetur
                                        et. Morbi leo
                                        risus, porta ac consectetur ac, vestibulum at eros. Fusce dapibus, tellus ac
                                        cursus
                                        commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet
                                        risus.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-mix">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-mix">
                                                {% contentblock name="accordion-title-2" publish_default_content="true" single="plaintext" %}
                                                    Registreeringud, pikendamised, kustutamised
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-mix" data-accordion-item="#chart-mix">
                                        {% contentblock name="accordion-title-2" publish_default_content="true" single="plaintext" %}
                                        Registreeringud, pikendamised, kustutamised
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="mixchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-2" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-idn">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-idn">
                                                {% contentblock name="accordion-title-3" publish_default_content="true" single="plaintext" %}
                                                    Täpitähtedega domeenid (koguarv)
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-idn" data-accordion-item="#chart-idn">
                                        {% contentblock name="accordion-title-3" publish_default_content="true" single="plaintext" %}
                                        Täpitähtedega domeenid (koguarv)
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="idnchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-3" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-dns">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-dns">
                                                {% contentblock name="accordion-title-4" publish_default_content="true" single="plaintext" %}
                                                    DNSSEC domeenid (koguarv)
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-dns" data-accordion-item="#chart-dns">
                                        {% contentblock name="accordion-title-4" publish_default_content="true" single="plaintext" %}
                                        DNSSEC domeenid (koguarv)
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="dnssecchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-4" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-sex">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-sex">
                                                {% contentblock name="accordion-title-5" publish_default_content="true" single="plaintext" %}
                                                    Füüsilistest isikutest domeeniregistreerijate sugu
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-sex" data-accordion-item="#chart-sex">
                                        {% contentblock name="accordion-title-5" publish_default_content="true" single="plaintext" %}
                                        Füüsilistest isikutest domeeniregistreerijate sugu
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="sexchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-5" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-text">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-text">
                                                {% contentblock name="accordion-title-6" publish_default_content="true" single="plaintext" %}
                                                    Registreerijatele kuuluvate domeenide arv
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-text" data-accordion-item="#chart-text">
                                        {% contentblock name="accordion-title-6" publish_default_content="true" single="plaintext" %}
                                        Registreerijatele kuuluvate domeenide arv
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="textchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-6" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-org">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-org">
                                                {% contentblock name="accordion-title-7" publish_default_content="true" single="plaintext" %}
                                                    Eesti juriidilisest isikust registreerijate jaotuse tüübiline koosseis
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-org" data-accordion-item="#chart-org">
                                        {% contentblock name="accordion-title-7" publish_default_content="true" single="plaintext" %}
                                        Eesti juriidilisest isikust registreerijate jaotuse tüübiline koosseis
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="orgchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-7" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                        <article class="accordion__item" id="chart-renew">
                            <header class="accordion__item__head">
                                <h2>
                                    {% if editmode %}
                                    <span class="title" data-accordion-item="#chart-renew">
                                                {% contentblock name="accordion-title-8" publish_default_content="true" single="plaintext" %}
                                                    Pikendamiste ja registreerimiste graafik registreerimise perioodi pikkuse järgi
                                                {% endcontentblock %}
                                            </span>
                                    {% else %}
                                    <a class="title" href="#chart-renew" data-accordion-item="#chart-renew">
                                        {% contentblock name="accordion-title-8" publish_default_content="true" single="plaintext" %}
                                        Täpitähtedega domeenid (koguarv)
                                        {% endcontentblock %}
                                    </a>
                                    {% endif %}
                                </h2>
                            </header>
                            <div class="accordion__item__body u-content-styles">
                                <div class="chart-item" id="renewchart"></div>
                                <div class="content-block">
                                    {% contentblock name="accordion-body-8" publish_default_content="true" %}
                                    <p>Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non
                                        commodo luctus,
                                        nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                                    {% endcontentblock %}
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
<script src="{{ javascripts_path }}/charts.js"></script>
<script src="{{ javascripts_path }}/main.min.js"></script>
</body>
</html>