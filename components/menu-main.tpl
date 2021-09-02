<nav class="menu-main js-menu-main">
    <ul class="menu">
        {% unless site.root_item.hidden? %}
            <li{% if site.root_item.selected? %} class="selected current"{% endif %}>
                <a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
            </li>
        {% endunless %}
        {% if page.node_id == 2133844 or page.parent.node_id == 2133844 or page.parent.parent.node_id == 2133844 %}
            {% for item in site.visible_menuitems %}
                {% if item.page.node_id == 2133844 %}
                    {% for subitem in item.visible_children %}
                        <li class="{% if subitem.selected? %}selected{% endif %}">
                            <a href="{{ subitem.url }}" class="{% unless subitem.translated? %}untranslated{% endunless %}">{{ subitem.title }}</a>
                            {% if subitem.children? %}
                                <button type="button" class="btn btn--submenu-toggle" data-submenu-toggle><i class="fas fa-angle-down"></i></button>
                                <ul class="submenu {% if forloop.index > 3 %}invert{% endif %}">
                                    {% for subsubitem in subitem.visible_children %}
                                        <li class="{% if subsubitem.selected? %}current{% endif %}">
                                            <a href="{{ subsubitem.url }}" class="{% unless subsubitem.translated? %}untranslated{% endunless %}">{{ subsubitem.title }}</a>
                                        </li>
                                    {% endfor %}
                                </ul>
                            {% endif %}
                        </li>
                    {% endfor %}
                {% endif %}
            {% endfor %}
        {% else %}
            {% for item in site.visible_menuitems %}
                {% unless item.page.node_id == 2133844 or item.page.node_id == 2142515 or item.page.node_id == 2223713 or item.page.node_id == 2684256 or item.translated? == false %}
                    <li class="{% if item.selected? %}selected{% endif %}">
                        <a href="{{ item.url }}" class="{% unless item.translated? %}untranslated{% endunless %}">{{ item.title }}</a>
                        {% if item.children? %}
                            <button type="button" class="btn btn--submenu-toggle" data-submenu-toggle><i class="fas fa-angle-down"></i></button>
                            <ul class="submenu {% if forloop.index > 3 %}invert{% endif %}">
                                {% for subitem in item.visible_children %}
                                    <li class="{% if subitem.selected? %}current{% endif %}">
                                        <a href="{{ subitem.url }}" class="{% if subitem.translated? == false %}untranslated{% endif %}">{{ subitem.title }}</a>
                                    </li>
                                {% endfor %}
                            </ul>
                        {% endif %}
                    </li>
                {% endunless %}
            {% endfor %}
        {% endif %}
        {% if site.hidden_menuitems.size > 0 %}
            <li>{% menubtn site.hidden_menuitems %}</li>
        {% endif %}

        <li>{% menuadd %}</li>
    </ul>
</nav>
