<!DOCTYPE html>
<!-- registars.tpl -->
<html class="page-loading common-page common-registrar-page {% if editmode %}editmode{% else %}public{% endif %}"
      lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main" id="app">
    <div class="page--detail">
        <header class="page--header"
                {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <section class="content-inner content-area" data-search-indexing-allowed="true">
            <div style="margin: 4rem 0 2rem">
                <div class="registrar-list-container" style="display: flex; justify-content: center">
                    <article class="registrar--item registrar--profile">
                        <div class="registrar--services"><!----></div>
												{% if editmode %}
                        <a class="registrar--logo" style="height: 180px; display: flex; justify-content: center">
                            {% editable element.logo %}
                        </a>
												{% else %}
													{% if element.logo and element.logo != "" %}
														<div style="height: 180px; display: flex; justify-content: center">
															<img src="{{ element.logo }}" alt="{{ element.title }}" class="registrar--logo">
														</div>
													{% endif %}
												{% endif %}
                        <h2 style="margin-bottom: 10px">{% editable element.title %}</h2>
                        <p>
													{% if editmode %}
														<a class="registrar--url">{% editable element.website %}</a>
													{% else %}
														<a class="registrar--url" href="{{element.website}}" target="_blank">{{ element.website }}</a>
													{% endif %}
												</p>

                        <div style="margin-top: 1rem; padding-left: 1rem; padding-right: 1rem;">
                            <div style="display: flex; gap: 1rem; align-items: center;">
                                <span title="Elite Partner"
                                      style="display: block; height: 24px; width: 24px; background: none no-repeat 50%/cover; background-image: none; background-image: url(/assets/ep2.svg);"></span>
																{% if editmode %}
                                	{% editable element.ep %}
																{% else %}
																	{% if element.ep %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-error"></i>{% endif %}
																{% endif %}
																
                            </div>
                            <div style="margin-top: 1rem">
                                <div style="display: flex; gap: 1rem; align-items: center;">
                                    <span title="DNSSEC" class="item"
                                          style="display: block; height: 24px; width: 24px; background: none no-repeat 50%/cover; background-image: url('/assets/dns.svg');"></span>
																		{% if editmode %}
	                                    {% editable element.dnssec %}
																		{% else %}
																			{% if element.dnssec %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-error"></i>{% endif %}
																		{% endif %}
                                </div>
                            </div>
                            <div style="margin-top: 1rem">
                                <div style="display: flex; gap: 1rem; align-items: center;">
                                    <span title="Short periods" class="item"
                                          style="display: block; height: 24px; width: 24px; background: none no-repeat 50%/cover; background-image: url('/assets/short-url.svg');"></span>
																		{% if editmode %}
	                                    {% editable element.short_url %}
																		{% else %}
																			{% if element.short_url %}<i class="fa fa-check text-success"></i>{% else %}<i class="fa fa-times text-error"></i>{% endif %}
																		{% endif %}
                                </div>
                            </div>

                            <div style="margin-top: 2rem">
                                <label style="font-weight: bold;" for="">{{ customer_service }}:</label>
                                {% editable element.customer_service %}
                            </div>
                            <div style="margin-top: 1rem">
                                <label style="font-weight: bold;" for="">Email:</label>
                                {% editable element.phone %}
                            </div>
                            <div style="margin-top: 1rem">
                                <label style="font-weight: bold;" for="">{{ customer_service }}:</label>
                                {% editable element.email %}
                            </div>
                            <div style="margin-top: 1rem">
                                <label style="font-weight: bold;" for="">{{ label_languages }}: {% if editmode %}<br> <small>Seperate with comma: ENG, EST</small>{% endif %}</label>
                                {% editable element.languages %}
                            </div>
                            <div style="margin-top: 1rem">
                                <label style="font-weight: bold;" for="">{{ identification_methods }}:</label>
                                {% editable element.identification_methods %}
                            </div>
														<div style="margin-top: 1rem">
															{% if editmode %}
															<label style="font-weight: bold;" for="">Description</label>
															{% endif %}
															{% editable element.description %}
														</div>
                        </div>
                </div>
        </section>
    </div>
</main>
<div class="mdl mdl--registrar" data-modal="dnssec">
    <div class="mdl--container">
        <header class="mdl--header">
            <h2>DNSSEC</h2>
            <a href="#" role="button" class="btn btn--close" data-close-modal>
                <i class="fas fa-times"></i>
            </a>
        </header>
        <div class="mdl--content">
            <article class="u-content-styles">
                {% contentblock name="dnssec-desc" publish_default_content="true" %}
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fermentum arcu tortor, ac
                    lobortis metus luctus ac. Donec ornare mi a orci consectetur.</p>
                {% endcontentblock %}
            </article>
        </div>
    </div>
</div>
<div class="mdl mdl--registrar" data-modal="elite-partner">
    <div class="mdl--container">
        <header class="mdl--header">
            <h2>{{ label_elite_partner }}</h2>
            <a href="#" role="button" class="btn btn--close" data-close-modal>
                <i class="fas fa-times"></i>
            </a>
        </header>
        <div class="mdl--content">
            <article class="u-content-styles">
                {% contentblock name="elite-partner-desc" publish_default_content="true" %}
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fermentum arcu tortor, ac
                    lobortis metus luctus ac. Donec ornare mi a orci consectetur.</p>
                {% endcontentblock %}
            </article>
            <div class="mdl--actions">
                <button class="btn btn--primary" data-close-modal>{{ label_close }}</button>
            </div>
        </div>
    </div>
</div>
<div class="mdl mdl--registrar" data-modal="short_url">
    <div class="mdl--container">
        <header class="mdl--header">
            <h2>{{ label_short_periods }}</h2>
            <a href="#" role="button" class="btn btn--close" data-close-modal>
                <i class="fas fa-times"></i>
            </a>
        </header>
        <div class="mdl--content">
            <article class="u-content-styles">
                {% contentblock name="short_url-desc" publish_default_content="true" %}
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fermentum arcu tortor, ac
                    lobortis metus luctus ac. Donec ornare mi a orci consectetur.</p>
                {% endcontentblock %}
            </article>
            <div class="mdl--actions">
                <button class="btn btn--primary" data-close-modal>{{ label_close }}</button>
            </div>
        </div>
    </div>
</div>
{% include "footer" %}

{% include "site-javascripts" %}

<script>
    var lang = '{{ page.language_code }}';
    Vue.config.productionTip = false;
    new Vue({
        delimiters: ['${', '}'],
        el: '#app',
        data: {
            init: false,
            loaded: false,
            loading: false,
            showAdvOptions: false,
            requestUrl: '',
            queryPage: 1,
            queryPerPage: 250,
            queryString: '',
            queryServices: [],
            results: [],
            cachedResults: [],
        },
        filters: {
            urlify: function (value) {
                if (value.match('^http')) {
                    return value;
                } else {
                    return 'http://' + value;
                }
            }
        },
        created: function () {
            this.init = true;
            document.querySelector('html').classList.remove('page-loading');
            this.searchArticles();
        },
        computed: {
            filterResults: function () {
                let results = [];
                if (!this.queryServices.length) {
                    results = this.results;
                }
                if (this.queryServices.length) {
                    results = this.results.filter(function (item) {
                        const services = [];
                        if (typeof item.values.dnssec !== 'undefined' && item.values.dnssec) {
                            services.push('dnssec');
                        }
                        if (typeof item.values.ep !== 'undefined' && item.values.ep) {
                            services.push('ep');
                        }
                        if (typeof item.values.short_url !== 'undefined' && item.values.short_url) {
                            services.push('short_url');
                        }
                        return this.queryServices.every(function (v) {
                            return services.indexOf(v) >= 0;
                        });
                    }.bind(this));
                }
                return results;
            },
        },
        methods: {
            getServices: function (event) {
                let service = event.target.value;
                if (event.target.checked) {
                    this.queryServices.push(service);
                } else {
                    this.queryServices = this.queryServices.filter(function (item) {
                        return item.indexOf(service) === -1;
                    });
                }
            },
            submitForm: function () {
                this.results = [];
                this.searchArticles();
            },
            searchArticles: function () {
                this.loading = true;
                let searchTitle = this.queryString ? 'q.element.title.$matches=' + encodeURI(this.queryString) : '';
                this.requestUrl = '/admin/api/elements?'
                    + searchTitle
                    + '&q.element_definition.title.$matches=Registrant'
                    + '&page=' + this.queryPage
                    + '&per_page=' + this.queryPerPage
                    + '&language_code=' + lang
                    + '&include_values=true'
                    + '&s=element.values.ep.$desc,element.values.dnssec.$desc,element.values.short_url.$desc,element.title.$asc';

                this.$http.get(this.requestUrl).then(function (response) {
                    let links = response.headers.get('Link').split(',');
                    let nextPage = links.filter(function (item) {
                        return item.indexOf('rel="next"') > -1;
                    });
                    nextPage = nextPage.toString().match(/\<(.*?)\>/);
                    this.results = this.results.concat(response.body);
                    if (!nextPage) {
                        this.loading = false;
                        this.queryPage = 1;
                        if (!this.loaded) {
                            this.cachedResults = this.results;
                            this.loaded = true;
                        }
                    } else {
                        this.queryPage++;
                        this.searchArticles();
                    }
                }, function (response) {
                    console.log(response);
                });
            }
        }
    });
</script>
{% include "footer-scripts" %}
</body>
</html>