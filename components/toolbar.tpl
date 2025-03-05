{% include "top-menu-translations" %}
<div class="c-toolbar js-toolbar">
    <div class="c-toolbar__grid">
        <div class="c-toolbar__nav">
            <ul class="s-toolbar-nav">
                <li class="is-active">
                    <a href="https://internet.ee">{{ public_portal }}</a>
                    <span class="o-arrow js-submenu-toggle"></span>
                    <ul class="submenu">
                        {% for item in site.visible_menuitems %}
                        <li>
                            {% menulink item %}
                            {% if item.visible_children.size > 0 %}
                            <span class="o-arrow o-arrow--visible-on-desktop js-submenu-toggle"></span>
                            <ul class="submenu">
                                {% for child in item.visible_children %}
                                <li>
                                    {% menulink child %}
                                </li>
                                {% endfor %}
                            </ul>
                            {% endif %}
                        </li>
                        {% endfor %}
                        <li class="c-toolbar__search js-search-toolbar">

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="https://auction.internet.ee/">{{auction_env}}</a>
                </li>
                <li>
                    <a href="{{registrar_portal_link}}">{{registrar_portal}}</a>
                </li>
                <li>
                    <a href="{{registrant_portal_link}}">{{registrant_portal}}</a>
                </li>
                <li>
                    <a href="https://eidb.internet.ee/">{{ee_id}}</a>
                </li>
            </ul>
        </div>
        <div class="c-toolbar__socials">
            {% include "socials" %}
        </div>
        <div class="c-toolbar__lang">

        </div>
    </div>
</div>
<div class="desktop-menu">
    <ul class="submenu">
        {% for item in site.visible_menuitems %}
        {% if item.translated? %}
        <li>
            {% menulink item %}
            {% if item.visible_children.size > 0 %}
            <span class="o-arrow o-arrow--visible-on-desktop js-submenu-toggle"></span>
            <ul class="submenu">
                {% for child in item.visible_children %}
                <li>
                    {% menulink child %}
                </li>
                {% endfor %}
            </ul>
            {% endif %}
        </li>
        {% endif %}
        {% endfor %}
        {% if editmode %}
        <ul class="menu menu-horizontal menu-cms">
            {% if site.hidden_menuitems.size > 0 %}
            <li>{% menubtn site.hidden_menuitems %}</li>
            {% endif %}

            <li {{ edy_intro_add_page }}>{% menuadd %}</li>
        </ul>
        {% endif %}
    </ul>
    <div class="c-toolbar__search js-search-toolbar">
        {% include "search-form" %}
    </div>
</div>