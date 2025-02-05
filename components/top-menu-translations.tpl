{% for language in site.languages %}
    {% if language.selected? %}
        {% assign current_language = language.code %}
    {% endif %}
{% endfor %}

{% if current_language == "et" %}
    {% assign public_portal = "Avalik portaal" %}
    {% assign auction_env = "Oksjonikeskkond" %}
    {% assign registrar_portal = "Registripidaja portaal" %}
    {% assign registrar_portal_link = "https://registrar.internet.ee/et/" %}
    {% assign registrant_portal = "Registreerija portaal" %}
    {% assign registrant_portal_link = "https://registrant.internet.ee/et/" %}
    {% assign ee_id = "eeID" %}
{% endif %}

{% if current_language == "en" %}
    {% assign public_portal = "Public portal" %}
    {% assign auction_env = "Auction environment" %}
    {% assign registrar_portal = "Registrar's Portal" %}
    {% assign registrar_portal_link = "https://registrar.internet.ee/en/" %}
    {% assign registrant_portal = "Registrant Portal" %}
    {% assign registrant_portal_link = "https://registrant.internet.ee/en/" %}
    {% assign ee_id = "eeID" %}
{% endif %}

{% if current_language == "ru" %}
    {% assign public_portal = "Публичный портал" %}
    {% assign auction_env = "Аукционная среда" %}
    {% assign registrar_portal = "Портал регистратора" %}
    {% assign registrar_portal_link = "https://registrar.internet.ee/et/login" %}
    {% assign registrant_portal = "Регистрационный портал" %}
    {% assign registrant_portal_link = "https://registrant.internet.ee/ru/login" %}
    {% assign ee_id = "eeID" %}
{% endif %}

{% if current_language == "lt" %}
{% assign public_portal = "Viešasis portalas" %}
{% assign auction_env = "Aukciono aplinka" %}
{% assign registrar_portal = "Registratoriaus portalas" %}
{% assign registrant_portal = "Registruotojų portalas" %}
{% assign ee_id = "eeID" %}
{% endif %}