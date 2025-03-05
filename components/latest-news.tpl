<section class="c-news posts-container">
    <div class="o-container">
        {% if page.language_code == 'et' %}
        {% assign blogUrl = "eis/uudised" %}
        {% endif %}

        {% if page.language_code == 'en' %}
        {% assign blogUrl = "eif/news" %}
        {% endif %}

        {% if page.language_code == 'ru' %}
        {% assign blogUrl = "eesti-interneti-sihtasutus/novosti" %}
        {% endif %}


        <header class="c-news__header">
            <h2 class="c-news__title u-h2">{% content single="plaintext" name="blog_posts_block" xpage="true" placeholder="Uudiseid, sündmused ja blogi" %}</h2>
            {% blogcontext blogUrl %}
            <div class="c-news__actions">
                <a href="{{ blog.page.path }}" class="c-btn c-btn--ghost"><span>{{ label_view_all }}</span>
                </a>
            </div>
            {% endblogcontext %}
        </header>
        <div class="c-news__items o-grid o-grid--three-col">
            {% for article in site.latest_3_articles %}
            {% unless article.page.node_id == 2089647 %}
            <article class="c-news__item article--teaser">
                <a href="{{ article.url }}"
                   class="c-news__item__img {% unless article.image %} u-has-placeholder{% endunless %}">
                    {% if article.image %}
                    <img src="{{ article.image.for-width-1024.schemeless_url }}" alt="{{ article.title }}">
                    {% endif %}
                </a>
                <div class="c-news__item__content">
                    <header>
                        {% if article.data.type or article.data.topic %}
                        <div class="c-news__item__meta">
                            {% assign articleType = article.data.type | strip %}
                            {% assign articleTopic = article.data.topic | strip %}
                            {% if articleType != '' %}
                            <p class="item article--type">{{ article.data.type }}</p>
                            {% endif %}
                            {% if articleTopic != '' %}
                            <p class="item article--topic">{{ article.data.topic }}</p>
                            {% endif %}
                        </div>
                        {% endif %}
                        <h3 class="c-news__item__title u-h3"><a href="{{ article.url }}">{{ article.title }}</a></h3>
                    </header>
                    <div class="c-news__item__excerpt u-t-sm">{{ article.excerpt }}</div>
                    <footer class="c-news__item__footer">
                        <div class="article--date u-t-sm"><svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M12.6987 1.30334C12.0771 0.682998 11.2348 0.334595 10.3567 0.334595C9.47854 0.334595 8.63625 0.682998 8.01469 1.30334L6.76803 2.55067L1.15469 8.16401C1.05291 8.26591 0.98694 8.39808 0.966693 8.54067L0.342693 12.9053C0.329124 12.9999 0.336047 13.0963 0.362993 13.188C0.389939 13.2797 0.436278 13.3645 0.49887 13.4367C0.561461 13.5089 0.638843 13.5668 0.72577 13.6065C0.812697 13.6462 0.907138 13.6667 1.00269 13.6667C1.03437 13.6667 1.06601 13.6645 1.09736 13.66L5.46269 13.0367C5.6053 13.016 5.73741 12.9498 5.83936 12.848L12.6994 5.98801C13.3206 5.36677 13.6695 4.52421 13.6695 3.64567C13.6695 2.76714 13.3199 1.92458 12.6987 1.30334ZM5.05403 11.748L1.78869 12.2147L2.25536 8.94934L7.23936 3.96467L10.038 6.76401L5.05403 11.748ZM11.756 5.04534L10.9807 5.82134L8.18136 3.02201L8.95736 2.24601C9.33437 1.88615 9.83551 1.68537 10.3567 1.68537C10.8779 1.68537 11.379 1.88615 11.756 2.24601C12.1273 2.61732 12.3359 3.12091 12.3359 3.64601C12.3359 4.1711 12.1273 4.67469 11.756 5.04601V5.04534Z" fill="#212224"/>
                            </svg>
                            {{ article.created_at | date: "%d.%m.%y" }}</div>
                        <div class="article--author u-t-sm">{{ article.author.name }}</div>
                    </footer>
                </div>
            </article>
            {% endunless %}
            {% endfor %}
        </div>
    </div>
</section>