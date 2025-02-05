<div class="domain-search">
  <div class="domain-search-container">
    {% include 'domain-search-form' %}
    <div class="domain-stats">
        <div class="all">{{ domain_stats_total }}: <span></span>.</div>
        <div class="today">{{ domain_stats_today }}: <span></span>.</div>
        <div class="domain-stats-link">
            {% if editmode %}
                <input type="text" name="statistics_link" value="{{ page.data.statisticsLink }}" placeholder="Sisesta statistika link">
                <a href="{{ page.data.statisticsLink }}" class="btn btn-view-more"><span>{{ domain_stats_statistics }}</span><i class="fas fa-arrow-right"></i></a>
            {% else %}
                <a href="{{ page.data.statisticsLink }}" class="btn btn-view-more"><span>{{ domain_stats_statistics }}</span><i class="fas fa-arrow-right"></i></a>
            {% endif %}
        </div>
    </div>
  </div>
</div>