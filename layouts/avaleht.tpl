<!DOCTYPE html>
<!-- front_page.tpl -->
<html class="page-loading front-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
</head>
<body>
{% include "header" %}
<main class="page-content" role="main" data-search-indexing-allowed="true">
    <div class="page-hero">
        {% include 'front-page-slider' %}
    </div>
    {% include "domain-search" %}
    <div class="info-blocks">
        <article class="block block--domain-auctions" id="auctions">
            <div class="icon" v-show="!loading && !auctions.length">
                <img src="{{ assets_path }}/spider-white.svg" alt="spider">
            </div>
            <h2>{{ label_domain_auctions }}
                <i class="fas fa-spinner fa-spin" v-if="loading"></i>
                <span v-if="auctions.length" class="countdown">
                    <i class="fas fa-hourglass-half"></i>
                    <strong v-if="countdown.hours !== '00'">${countdown.hours}</strong>{{ abbr_hours }}&nbsp;
                    <strong>${countdown.minutes}</strong>{{ abbr_minutes }}
                </span>
            </h2>
            <div class="domain-auctions-wrap">
                <div class="domain-auctions" v-if="!loading">
                    <div class="domain-auctions--list" v-show="auctions.length">
                        <ul>
                            <li v-for="item in auctions.slice(0,10)" :key="item.id">
                                <strong>${ item.domain_name }</strong>
                            </li>
                        </ul>
                        <footer>
                            <p v-show="auctions.length > 10"><strong>${ auctionsCount }</strong> {{ label_more_domains }}</p>
                            <a href="{{ page.data.auctionsLink }}" class="btn btn-view-more"><span>{{ label_view_all }}</span><i class="fas fa-arrow-right"></i></a>
                        </footer>
                    </div>
                    <div class="domain-auctions--status" v-show="!auctions.length && requestDone">
                        {% contentblock name="domain_auctions_no_results_block" publish_default_content="true" %}
                        <p>Hetkel domeene oksjonil ei ole.</p>
                        {% endcontentblock %}
                    </div>
                </div>
                {% if editmode %}
                    <br>
                    <label for="">Sisesta siia lingi url</label>
                    <input type="text" name="auctions_link" value="{{ page.data.auctionsLink }}" placeholder="Sisesta domeenioksjonite link" style="width: 100%;">
                {% endif %}
            </div>
        </article>
        {% comment %}
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/spider.svg" alt="spider">
            </div>
            {% contentblock name="help_block" publish_default_content="true" %}
            <h2>Abi ja info</h2>
            <p>Eesti Interneti SA tegeleb .ee tippdomeeni haldusega. Loe veel meie kohta.</p>
            <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        {% endcomment %}
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/fish.svg" alt="fish">
            </div>
            {% contentblock name="about_block" publish_default_content="true" %}
            <h2>Mis on Eesti Interneti SA?</h2>
            <p>Eesti Interneti SA tegeleb .ee tippdomeeni haldusega. Loe veel meie kohta.</p>
            <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
        <article class="block block--text">
            <div class="icon">
                <img src="{{ assets_path }}/spider.svg" alt="spider">
            </div>
            {% contentblock name="registrant_block" publish_default_content="true" %}
            <h2>Registripidajatele</h2>
            <p>Soovid saada registripidajaks või sul tehnilisi küsimusi seoses registripidamisega?</p>
            <p><a href="">Loe edasi</a></p>
            {% endcontentblock %}
        </article>
    </div>
    {% include "front-page-posts" %}
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% editorjsblock %}
<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
<script>
  var pageData = new Edicy.CustomData({
    type: 'page',
    id: '{{ page.id }}'
  });
</script>
{% endeditorjsblock %}
<script>site.initFrontPage();</script>
{% if editmode %}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
{% else %}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
{% endif %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script>
Vue.config.productionTip = false;
  new Vue({
    el: '#auctions',
    delimiters: ['${', '}'],
    data: {
      auctions: [],
      auctionsCount: 0,
      loading: true,
      requestDone: false,
    },
    mounted() {
        this.getAuctions();
        window.setInterval(() => {
            if (new Date().getSeconds() === 0) {
             this.getAuctions();
            }
        }, 1000);
    },
    created() {
      document.querySelector('html').classList.remove('page-loading');
    },
    beforeDestroy() {
      clearInterval(() => {
        this.getAuctions()
      });
    },
    computed: {
      countdown() {
          if(this.auctions.length) {
              var startsAt = new Date(this.auctions[0].starts_at);
              var now  = new Date();
              var date = startsAt.getTime() > now.getTime() ? startsAt : new Date(this.auctions[0].ends_at);

              var ms = moment(date,"DD/MM/YYYY HH:mm:ss").diff(moment(now,"DD/MM/YYYY HH:mm:ss"));
              var d = moment.duration(ms);
              return {
                  hours: Math.floor(d.asHours()),
                  minutes: moment.utc(ms).format("mm")
              };
          }
      }
    },
    methods: {
      getAuctions() {
        var self = this;
        $.getJSON( "https://auction.internet.ee/auctions.json")
            .done(function(data) {
              self.auctions = data.sort(() => .5 - Math.random());
            })
            .fail(function() {
              //
            })
            .always(function() {
              self.loading = false;
              self.requestDone = true;
              self.auctionsCount = self.auctions.length < 11 ? 0 : self.auctions.length - 10
            });
      },
    }
  });
</script>
{% include "footer-scripts" %}
</body>
</html>
