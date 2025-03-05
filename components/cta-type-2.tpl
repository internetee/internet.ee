<div class="o-container">
    {% if editmode %}
    <button class="cta4_bg" data-bg="{{ page.data.cta4_bg | json | escape }}"></button>
    {% endif %}
    <section class="c-cta js-cta4 c-cta--secondary" style="background-image: url({{page.data.cta4_bg.image}})">
        <h2 class="c-cta__title">{% content name="cta_type2_title" %}</h2>
        <div class="c-cta__desc">{% content name="cta_type2_desc" %}</div>
        <div class="c-cta__btn">
            {% content name="cta_type2_btn" %}
        </div>
    </section>
</div>