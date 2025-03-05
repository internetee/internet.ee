<section class="c-cta js-cta-3 c-cta--{{ type }}" style="background-image: url({{page.data.cta3_bg.image}})">
    {% if editmode %}
    <button class="cta3_bg" data-bg="{{ page.data.cta3_bg | json | escape }}"></button>
    {% endif %}
    <h2 class="c-cta__title">{% content name="cta_title" %}</h2>
    <div class="c-cta__desc">{% content name="cta_desc" %}</div>
    <div class="c-cta__btn">
        {% content name="cta_btn" %}
    </div>
</section>