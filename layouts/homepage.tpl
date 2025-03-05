<!DOCTYPE html>
<html>
<head>
    {% if editmode %}
    <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
    {% endif %}

    {% comment %}SITE TITLE{% endcomment %}
    {% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
    <title>{{ page_title }}</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="google-site-verification" content="BtQ7EdEtivXyVhmUdC-5LUVf64NgsZ21c8VdGRUg3Fo" />

    {% include "html-head" %}

    {% comment %}MISC{% endcomment %}
    {% include "open-graph" %}
    {% include "site-translations" %}
    {% if blog %}{{ blog.rss_link }}{% endif %}

    <meta name="keywords" content="{{ page.keywords }}" />
    <meta name="description" content="{{ page.description }}" />
    {% stylesheet_link "styles.css" %}

    {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>
<body>
{% include "header" %}
{% include "hero" %}
{% include "domain-auctions-row" %}
{% include "cta-two-col" %}
{% include "cta-three-col" %}
{% include "latest-news" %}
{% include "cta-type-2" %}
{% include "new-footer" %}

{% include "cookie-consent" %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="{{ javascripts_path }}/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script>
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
            const intvl = window.setInterval(() => {
                if (new Date().getSeconds() === 0) {
                    this.getAuctions();
                    clearInterval(intvl)
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

{% editorjsblock %}
<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
<script>

    var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
    });

    var bgCta1 = new Edicy.BgPicker($('.cta-1-bg-picker'), {
        preview: function(data) {
            $('.js-cta-1').css('background-image', "url(" + data.image + ")")
        },
        commit: function(data) {
            pageData.set('cta1_bg', data);
        }
    });

    var bgCta2 = new Edicy.BgPicker($('.cta-2-bg-picker'), {
        preview: function(data) {
            $('.js-cta-2').css('background-image', "url(" + data.image + ")")
        },
        commit: function(data) {
            pageData.set('cta2_bg', data);
        }
    });

    var bgHero = new Edicy.BgPicker($('.hero_banner_bg'), {
        preview: function(data) {
        $('.js-hero-banner').css('background-image', "url(" + data.image + ")")
        },
        commit: function(data) {
            pageData.set('hero_banner_bg', data);
        }
    });

    var bgCta3 = new Edicy.BgPicker($('.cta3_bg'), {
        preview: function(data) {
        $('.js-cta-3').css('background-image', "url(" + data.image + ")")
        },
        commit: function(data) {
            pageData.set('cta3_bg', data);
        }
    });

    var bgCta4 = new Edicy.BgPicker($('.cta4_bg'), {
        preview: function(data) {
        $('.js-cta4').css('background-image', "url(" + data.image + ")")
        },
        commit: function(data) {
            pageData.set('cta4_bg', data);
        }
    });


    $('.js-auctions-btn-link').on('blur', function () {
        pageData.set('auctionsLink', $('.js-auctions-btn-link').val());
    })
</script>
{% endeditorjsblock %}

{% include "footer-scripts" %}
</body>
</html>