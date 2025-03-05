{% capture dont_render %}
{% case page.language_code %}
{% when 'et' %}
{% assign autions_title = 'Domeenioksjonid' %}
{% assign autions_en = 'inglise oksjon' %}
{% assign autions_blind = 'pime oksjon' %}
{% assign autions_btn = 'Vaata kõiki' %}
{% when 'en' %}
{% assign autions_title = 'Domain auctions' %}
{% assign autions_en = 'english auction' %}
{% assign autions_blind = 'blind auction' %}
{% assign autions_btn = 'See all' %}
{% when 'ru' %}
{% assign autions_title = 'Аукционы доменов' %}
{% assign autions_en = 'английский аукцион' %}
{% assign autions_blind = 'слепой аукцион' %}
{% assign autions_btn = 'Увидеть все' %}
{% when 'lv' %}
{% assign autions_title = 'Domēnu izsoles' %}
{% assign autions_en = 'angļu izsole' %}
{% assign autions_blind = 'aklā izsole' %}
{% assign autions_btn = 'Redzēt visu' %}
{% else %}
{% assign autions_title = 'Domain auctions' %}
{% assign autions_en = 'english auction' %}
{% assign autions_blind = 'blind auction' %}
{% assign autions_btn = 'See all' %}
{% endcase %}
{% endcapture %}

<section class="c-auctions block block--domain-auctions" id="auctions">
    <div class="icon" v-show="!loading && !auctions.length">
        <img src="{{ assets_path }}/spider-white.svg" alt="spider">
    </div>
    <h2 class="c-auctions__title">{{ autions_title }}</h2>
    <div class="c-auctions__desc">{% content name="auctions_desc" %}</div>
    <div class="c-auctions__domains domain-auctions-wrap">
        <div class="domain-auctions" v-if="!loading">
            <div class="domain-auctions--list" v-show="auctions.length">
                <div class="c-slider js-slider">
                    <div class="c-slider__slide">
                        <ul class="c-auctions__list s-auctions-list">
                            <li v-for="item in auctions.slice(0,12)" :key="item.id">

                                <strong><span class="o-po-icon"></span>${ item.domain_name }</strong>
                            </li>
                        </ul>
                    </div>
                    <div class="c-slider__slide">
                        <ul class="c-auctions__list s-auctions-list">
                            <li v-for="item in auctions.slice(12,24)" :key="item.id">
                                <strong><span class="o-po-icon"></span>${ item.domain_name }</strong>
                            </li>
                        </ul>
                    </div>
                    <div class="c-slider__slide">
                        <ul class="c-auctions__list s-auctions-list">
                            <li v-for="item in auctions.slice(24,36)" :key="item.id">
                                <strong><span class="o-po-icon"></span>${ item.domain_name }</strong>
                            </li>
                        </ul>
                    </div>
                </div>
                <footer class="c-auctions__footer">
                    <div class="c-auctions__legend">
                        <div>
                            <span class="o-io-icon o-icon--sm"></span>
                            {{autions_en}}
                        </div>
                        <div>
                            <span class="o-po-icon o-icon--sm"></span>
                            {{autions_blind}}
                        </div>
                    </div>
                    <div class="c-auctions__info">
                        <p class="c-auctions__all-count" v-show="auctions.length > 12"><strong>${ auctionsCount }</strong> {{ label_more_domains }}</p>
                        <a href="{{ page.data.auctionsLink }}" class="c-btn--blue">
                            {{ autions_btn }}
                        </a>
                    </div>
                </footer>
            </div>
            <div class="domain-auctions--status" v-show="!auctions.length && requestDone">
                {% contentblock name="domain_auctions_no_results_block" publish_default_content="true" %}
                <p>Hetkel ühtegi domeeni oksjonil ei ole</p>
                {% endcontentblock %}
            </div>
        </div>
        {% if editmode %}
        <br>
        <label for="">"Vaata kõiki" lingi url</label>
        <input class="js-auctions-btn-link" type="text" name="auctions_link" value="{{ page.data.auctionsLink }}" placeholder="Sisesta domeenioksjonite link" style="width: 100%;">
        {% endif %}
    </div>
</section>