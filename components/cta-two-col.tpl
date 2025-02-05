<section class="c-cta--two-col">
    <div class="o-container">
        <div class="o-grid o-grid--two-col">
            <div>
                <div class="c-cta c-cta--horizontal js-cta-1" style="background-image: url({{page.data.cta1_bg.image}})">
                    {% if editmode %}
                    <button class="cta-1-bg-picker" data-bg="{{ page.data.cta1_bg | json | escape }}"></button>
                    {% endif %}
                    <div class="c-cta__content">
                        <div class="c-cta__grid--sb">
                            <h3 class="c-cta__title u-h2">{% content name="cta_2_title" %}</h3>
                            <div class="c-cta__btn">
                                {% content name="cta_2_btn" %}
                            </div>
                        </div>

                        <div class="c-cta__desc">{% content name="cta_2_desc" %}</div>
                    </div>
                </div>
            </div>
            <div>
                <div class="c-cta c-cta--horizontal js-cta-2" style="background-image: url({{page.data.cta2_bg.image}})">
                    {% if editmode %}
                    <button class="cta-2-bg-picker" data-bg="{{ page.data.cta2_bg | json | escape }}"></button>
                    {% endif %}
                    <div class="c-cta__content">
                        <div class="c-cta__grid--sb">
                        <h3 class="c-cta__title u-h2">{% content name="cta_3_title" %}</h3>
                            <div class="c-cta__btn">
                                {% content name="cta_3_btn" %}
                            </div>
                        </div>
                        <div class="c-cta__desc u-t-sm">{% content name="cta_3_desc" %}</div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>