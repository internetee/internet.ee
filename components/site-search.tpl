{% if site.search.enabled %}
    {% if page.language_code == 'et' %}
        {% assign searchUrl = '/abi-ja-info?keys=' %}
    {% endif %}
    {% if page.language_code == 'en' %}
        {% assign searchUrl = '/help-and-info?keys=' %}
    {% endif %}
    {% if page.language_code == 'ru' %}
        {% assign searchUrl = '/pomosh-i-informaciya?keys=' %}
    {% endif %}
  <div class="site-search">
    <form class="search-form js-search-form" action="{{ searchUrl }}" method="get">
        <i class="fas fa-search"></i>
        <input class="search-input" name="keys" placeholder="{{ search_placeholder }}" type="search">
        <button type="submit" class="btn btn-submit" aria-label="{{ label_search }}"><i class="fas fa-arrow-right"></i></button>
    </form>
  </div>
{% endif %}