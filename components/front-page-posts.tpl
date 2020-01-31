<section class="section posts-container">
  {% if page.language_code == 'et' %}
    {% assign blogUrl = "eis/uudised" %}
  {% endif %}
  
  {% if page.language_code == 'en' %}
    {% assign blogUrl = "eif/news" %}
  {% endif %}
  
  {% if page.language_code == 'ru' %}
    {% assign blogUrl = "eesti-interneti-sihtasutus/novosti" %}
  {% endif %}
  
  
  <header class="section--header">
    <h2>{% content single="plaintext" name="blog_posts_block" xpage="true" placeholder="Uudiseid, sündmused ja blogi" %}</h2>
    {% blogcontext blogUrl %}
      <div class="section--actions">
        <a href="{{ blog.page.path }}" class="btn btn-view-more"><span>{{ label_view_all }}</span><i class="fas fa-arrow-right"></i></a>
      </div>
    {% endblogcontext %}
  </header>
  <div class="articles--list">
    {% for article in site.latest_3_articles %}
      {% unless article.page.node_id == 2089647 %}
        <article class="article article--teaser">
          <a href="{{ article.url }}" class="article--image{% unless article.image %} u-has-placeholder{% endunless %}">
            {% if article.image %}
              <img src="{{ article.image.for-width-1024.schemeless_url }}" alt="{{ article.title }}">
            {% endif %}
          </a>
          <div class="article--content">
            <header>
              {% if article.data.type or article.data.topic %}
                <div class="article--data">
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
              <h3><a href="{{ article.url }}">{{ article.title }}</a></h3>
            </header>
            <p>{{ article.excerpt }}</p>
            <footer>
              <p class="article--date"><i class="fas fa-pencil-alt"></i>{{ article.created_at | date: "%d.%m.%y" }}</p>
              <p class="article--author">{{ article.author.name }}</p>
            </footer>
          </div>
        </article>
      {% endunless %}
    {% endfor %}
  </div>
</section>