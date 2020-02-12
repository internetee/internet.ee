<aside class="site-sidebar blog-sidebar">
  <div class="sidebar-tabs">
    <a href="#latest_news" class="sidebar-tab current left">{{ news_latest }}</a>
    <a href="#archive" class="sidebar-tab right">{{ news_archive }}</a>
  </div>
  <div class="sidebar-wrap">
    <div class="sidebar-body">
      <div class="sidebar-inner left-content">{% include "latest-news" %}</div>
      <div class="sidebar-inner right-content" style="display: none;"><ul class="text-list years"></ul></div>
    </div>
  </div>
  {% include 'sidebar-search' %}
</aside>
