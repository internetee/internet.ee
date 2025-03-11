{% if site.search.enabled %}
<script src="{{ javascripts_path }}/voog-main.js"></script>
<script src="{{ javascripts_path }}/new-main.js"></script>

<script>
	window.pageLanguage = '{{ page.language_code }}';
</script>
{% endif %}