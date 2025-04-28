<!DOCTYPE html>
<!-- page__about.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
    <article class="about-page article--detail" data-search-indexing-allowed="true">
        <header class="article--header" style="background-image:url({{ page.image.schemeless_url }})">
            <div class="u-container">
                <h1>{% contentblock name="about-page-title" single="plaintext" escape="false" xpage="true" %}EIS tegeleb .ee tippdomeeni haldusega{% endcontentblock %}</h1>
                <p>{{ page.description }}</p>
            </div>
        </header>
        <section class="page-section contacts">
            <header class="section--header">
                <h2>{% content name="contacts_title" single="plaintext" placeholder="Võta meiega ühendust" %}</h2>
            </header>
            <div class="contacts--list">
                {% for contact in elements %}
                    {% if forloop.first and editmode %}
                        <div class="item">
                            <div class="item--content add">
                                {% addbutton element_type="Kontaktid" %}
                            </div>
                        </div>
                    {% endif %}
                    {% if contact.visible == true and contact.model_name == "Kontaktid" %}
                        <article class="item">
                            <div class="item--content">
                                {% if contact.pilt != '' %}
                                    <div class="image">
                                        <img src="{{ contact.pilt }}" alt="{{ contact.title }}">
                                    </div>
                                {% endif %}
                                <h3>{{ contact.title }}</h3>
                                <p class="occupation">{{ contact.amet }}</p>
                                <p><a href="mailto:{{ contact.email }}">{{ contact.email }}</a></p>
                                <p>{{ contact.telefon }}</p>
                                {% if editmode %}
                                    <p><a href="{{ contact.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a></p>
                                {% endif %}
                            </div>
                        </article>
                    {% endif %}
                {% endfor %}
            </div>
        </section>
        <section class="eis-location">
            <div class="eis-contacts">
                {% contentblock name="eis-contacts" publish_default_content="true" %}
                    <h3>Eesti Interneti Sihtasutus</h3>
                    <p><strong>Registrikood:</strong> 90010019</p>
                    <p><strong>Aadress:</strong> Paldiski mnt 80, 10617 Tallinn</p><br>
                    <p><strong>Telefon:</strong> 727 1000</p>
                    <p><strong>E-post:</strong> info@internet.ee</p>
                    <p><strong>a/a</strong> LHV 000000000000000000</p>
                    <p><strong>KMKR:</strong> EE000000000</p>
                {% endcontentblock %}
            </div>
            <div class="map-wrapper-full" id="location-map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1014.6028115588656!2d24.68455042590353!3d59.42964507277099!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46929468aa294d6b%3A0x365e4384bab01dea!2sPaldiski%20mnt%2080%2C%2010617%20Tallinn%2C%20Estonia!5e0!3m2!1sen!2sru!4v1712388227377!5m2!1sen!2sru" width="2000" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
        <nav class="quick-nav">
            {% elementscontext edicy_model="Kiirlingid" %}
                {% if editmode %}
                    <div class="item">
                        <div class="item--content add">
                            {% addbutton page_id=page.id element_type="Kiirlingid" %}
                        </div>
                    </div>
                {% endif %}
                {% for item in elements %}
                    {% if item.visible == true and item.model_name == "Kiirlingid" %}
                        <div class="item">
                            <a href="{{ item.link }}" {% if item.image != '' %}style="background-image: url({{ item.image }})"{% endif %} class="item--content">
                                <h3>{{ item.title }}</h3>
                                <p>{{ item.text }}</p>
                            </a>
                            {% if editmode %}
                                <a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a>
                            {% endif %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endelementscontext %}
        </nav>
        <section class="page-section job-offers">
            <header class="section--header">
                <h2>{% content name="job_offers_title" single="plaintext" placeholder="Tööpakkumised" %}</h2>
            </header>
            {% elementscontext edicy_model="Tööpakkumised" %}
                {% if elements.size < 1 %}
                    <div class="page--content">
                        <div class="page--body">
                            <div class="u-content-styles">
                                {% contentblock name="job-offers-content" xpage="true" %}
                                    <p>Hetkel aktiivseid tööpakkumisi ei ole</p>
                                {% endcontentblock %}
                            </div>
                            <br>
                            <br>
                        </div>
                    </div>
                    {% if editmode %}
                        <div class="job-offers--list">
                            <div class="item">
                                <div class="item--content add">
                                    <div>
                                        <div class="image">
                                            <i class="fas fa-user-plus"></i>
                                        </div>
                                        {% addbutton page_id=page.id element_type="Tööpakkumised" %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
                {% for item in elements %}
                    {% if forloop.first %}
                        <div class="job-offers--list">
                        {% if editmode %}
                            <div class="item">
                                <div class="item--content add">
                                    {% addbutton page_id=page.id element_type=item.model_name %}
                                </div>
                            </div>
                        {% endif %}
                    {% endif %}
                    {% if item.visible == true and item.model_name == "Tööpakkumised" %}
                        <article class="item">
                            <a href="{{ item.url }}" class="item--content">
                                {% if contact.icon != '' %}
                                    <div class="image">
                                        <i class="fas {{ item.ikoon }}"></i>
                                    </div>
                                {% else %}
                                    <div class="image">
                                        <i class="fas fa-user"></i>
                                    </div>
                                {% endif %}
                                <h3>{{ item.title }}</h3>
                                <p>{{ item.excerpt }}</p>
                            </a>
                            {% if editmode %}
                                <a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a>
                            {% endif %}
                        </article>
                    {% endif %}
                    {% if forloop.last %}
                        </div>
                    {% endif %}
                {% endfor %}
            {% endelementscontext %}
        </section>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% include "footer-scripts" %}
</body>
</html>