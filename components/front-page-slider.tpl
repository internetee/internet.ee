<div class="hero-slider">
    <div class="hero-slider-slides owl-carousel">
    {% if editmode %}
        {% elementscontext edicy_model="Slide" %}
            {% for slide in elements %}
                {% if slide.visible and slide.page_id == page.id %}
                <div class="slide" style="background-image:url({{ slide.image }});">
                    <a class="edit-slide" href="{{ slide.url }}">Edit</a>
                    {% addbutton page_id=page.id element_type=slide.model_name %}
                    <h2>{{ slide.title }}</h2>
                    {{ slide.body }}
                </div>
                {% endif %}
            {% endfor %}
            <div class="slide" style="background-image:url({{ images_path }}/hero-eis.jpg);">
                {% addbutton page_id=page.id element_type="Slide" %}
            </div>
        {% endelementscontext %}
    {% else %}
        {% elementscontext edicy_model="Slide" visible="1" %}
            {% for slide in elements %}
                {% if slide.visible and slide.page_id == page.id %}
                    <div class="slide" style="background-image:url({{ slide.image }});">
                        <h2>{{ slide.title }}</h2>
                        {{ slide.body }}
                    </div>
                {% endif %}
            {% endfor %}
        {% endelementscontext %}
    {% endif %}
    </div>
</div>