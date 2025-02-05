{% if page.language_code == 'et' %}
    {% assign domainSearchUrl = "/domeenid/kuidas-registreerida-ee-domeeni" %}
    {% assign domain_search_label = "Otsi domeeni" %}
{% endif %}

{% if page.language_code == 'en' %}
    {% assign domainSearchUrl = "/domains/how-to-register-a-ee-domain-name" %}
    {% assign domain_search_label = "Search for domain" %}
{% endif %}

{% if page.language_code == 'ru' %}
    {% assign domainSearchUrl = "/domeny/kak-zaregistrirovat-domen-ee" %}
    {% assign domain_search_label = "Поиск домена" %}
{% endif %}

<form class="search-block" action="{{ domainSearchUrl }}?domain=" method="post" id="domain-search">
    <div class="form-item type-search">
        <input type="text" name="domain" class="inline-label" id="search" value="" placeholder="{{ domain_search_label }}" autocomplete="off">
        <button class="btn btn--primary" type="submit" aria-label="{{ label_search }}">
            <i class="fas fa-arrow-right"></i>
            <i class="fas fa-spinner fa-spin"></i>
        </button>
    </div>
</form>