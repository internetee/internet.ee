<div class="faq-block">
    {% contentblock name="faq-block_title_link" publish_default_content="true" %}
        <h2>KKK</h2>
    {% endcontentblock %}
    <div class="faq-block__list">
        {% grouped sections by section in elements %}
            {% for section in sections %}
                {% for element in section %}

                    {% if element.model_name == "FAQ" %}
                        {% comment %}
                            {% if forloop.first %}
                                <h2 class="faq-section"><strong>{{ element.section }}</strong></h2>
                            {% endif %}
                        {% endcomment %}
                        <div class="faq-block__item">
                            {% if element.anchor != "" %}
                                <a name="{{ element.anchor | escape | replace:' ', '_' }}"></a>
                            {% endif %}
                            <div class="faq-block__item__body">
                                <h3>{% editable element.title %}</h3>
                                <div class="faq-block__item__answer">
                                    {% editable element.body %}
                                </div>
                            </div>
                        </div>
                    {% endif %}
                {% endfor %}
            {% endfor %}
        {% endgrouped %}
        {% if editmode %}
            <br>{% addbutton element_type="FAQ" %}<br>
        {% endif %}
    </div>
    <div class="faq-block__links">
        {% contentblock name="faq-block_links" publish_default_content="true" %}
            <a href="#">Kõik küsimused ja vastused</a>
        {% endcontentblock %}
    </div>
</div>