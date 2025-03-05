{% if editmode or site.has_many_languages? %}
<div class="c-dropdown">
    <span class="c-dropdown__label" onclick="this.parentNode.classList.toggle('is-open')">
        <span class="c-dropdown__label__lang">
            {% for language in site.languages %}
                {% if language.selected? %}
                    {{ language.title }}
                {% endif %}
            {% endfor %}
        </span>
        <svg width="10" height="7" viewBox="0 0 10 7" fill="white" xmlns="http://www.w3.org/2000/svg">
        <path d="M4.50581 5.82828L0.505807 1.82828C0.232439 1.55491 0.232439 1.11169 0.505807 0.838326C0.779174 0.564959 1.22239 0.564959 1.49576 0.838326L5.00078 4.34335L8.50581 0.838326C8.77917 0.564959 9.22239 0.564959 9.49576 0.838326C9.76912 1.11169 9.76912 1.55491 9.49576 1.82828L5.49576 5.82828C5.22239 6.10164 4.77917 6.10164 4.50581 5.82828Z" />
        </svg>
    </span>

    <ul class="c-dropdown__list s-dropdown-list">
        {% for language in site.languages %}
        <li{% if language.selected? %} class="active"{% endif %}>
            <a href="{{ language.url }}"{% if language.selected? %} class="active"{% endif %}>{{ language.title }}</a>
        </li>
        {% endfor %}
        {% if editmode %}
        <li>{%languageadd%}</li>
        {% endif %}
    </ul>
</div>
{% endif %}