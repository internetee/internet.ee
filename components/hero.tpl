<section class="c-hero">
    {% if editmode %}
    <button class="hero_banner_bg" data-bg="{{ page.data.hero_banner_bg | json | escape }}"></button>
    {% endif %}
    <div class="o-container">
        <div class="c-hero__content js-hero-banner" style="background-image: url({{page.data.hero_banner_bg.image}})">
            {% include 'hero-logo' %}
            <h1 class="c-hero__content__title">{% content name="hero_title" %}</h1>
            <div class="c-hero__content__desc">{% content name="hero_desc" %}</div>
            <div class="c-hero__content__action">{% content name="hero_action" %}</div>
        </div>
        <div class="c-hero__search">
            <div class="c-hero__search__grid">
                <div class="c-hero__search__form">
                    {% include "domain-search-new" %}
                </div>
                <div class="c-hero__search__info">
                    <div class="domain-search">
                        <div class="domain-search-container">
                            <div class="domain-stats">
                                <div class="all">{{ domain_stats_total }}: <span style="font-weight: bold;"></span>.</div>
                                <div class="today">{{ domain_stats_today }}: <span style="font-weight: bold;"></span>.</div>
                            </div>
                        </div>
                    </div>
                    <div class="c-hero__search_content">
                        {% content name="hero_domain_info" %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>