{% if page.language_code == 'et' %}
    {% assign domainSearchUrl = "/domeenid/kuidas-registreerida-ee-domeeni" %}
{% endif %}

{% if page.language_code == 'en' %}
    {% assign domainSearchUrl = "/domains/how-to-register-a-ee-domain-name" %}
{% endif %}

{% if page.language_code == 'ru' %}
    {% assign domainSearchUrl = "/domeny/kak-zaregistrirovat-domen-ee" %}
{% endif %}

<form class="search-block" action="{{ domainSearchUrl }}?domain=" method="post" id="domain-search">
    <div class="form-item type-search">
        <input type="text" name="domain" class="inline-label" id="searchw" value="" placeholder="{{ domain_search }}" autocomplete="off">
        <button class="btn btn--primary" type="submit" aria-label="{{ label_search }}">
            <i class="fas fa-arrow-right"></i>
            <i class="fas fa-spinner fa-spin"></i>
        </button>
    </div>
</form>