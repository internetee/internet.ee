    <footer class="site-footer">
        <div class="footer-top">
            <a class="footer-logo" href="{{ site.root_item.url }}">
                <img src="{{ assets_path }}/eis-logo-white.svg" alt="{{ page.site_title }}">
            </a>
            <div class="footer-contacts">
                <div class="address">
                    {% xcontent name="bottom-contact" %}
                </div>
                <ul class="quickinfo">
                    <li><i class="fas fa-envelope"></i><a href="mailto:info@internet.ee">info@internet.ee</a></li>
                    <li><i class="fas fa-phone"></i>727 1000</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <nav class="menu-footer">
                <div class="column">
                    {% xcontent name="footer-links-1" %}
                </div>
                <div class="column">
                    {% xcontent name="footer-links-2" %}
                </div>
                <div class="column">
                    {% xcontent name="footer-links-3" %}
                </div>
            </nav>
            <nav class="menu-social">
                <h3>{{ menu_social_title }}</h3>
                {% elementscontext edicy_model="Sotsiaalmeedia" %}
                <ul>
                {% for item in elements %}
                    <li>
                        <a href="{{ item.link }}" title="{{ item.title }}">
                            <i class="{{ item.icon }}"></i>
                        </a>
                        {% if editmode %}
                            <a href="{{ item.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a>
                        {% endif %}
                    </li>
                {% endfor %}
                {% if editmode %}
                    <li class="item">
                        {% addbutton element_type="Sotsiaalmeedia" %}
                    </li>
                {% endif %}
                </ul>
                {% endelementscontext %}
            </nav>
        </div>
    </footer>
</div> <!-- END OF .wrap -->