{% case page.language_code %}
{% when "et" %}
	{% assign article_types = "Uudised,Sündmus" %}
{% else %}
	{% assign article_types = "News,Event" %}
{% endcase %}
{% assign articleTypes = article_types | split: ',' | sort_natural %}
