<!DOCTYPE html>
<!-- registars.tpl -->
<html class="page-loading common-page common-registrar-page {% if editmode %}editmode{% else %}public{% endif %}"
      lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "cookie-modal" %}
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
        <form action="#" method="GET" class="registrar-filter" @submit.prevent="submitForm">
            <div class="search-block">
                <div class="filter-item type-checkbox">
                    <div class="checkbox">
                        <input type="checkbox" id="dnssec" @change="getServices" value="dnssec">
                        <label for="dnssec">
                            <span class="icon-dnssec"></span>
                            DNSSEC
                            <i class="fas fa-question-circle" data-open-modal="dnssec"></i>
                        </label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" id="ep" @change="getServices" value="ep">
                        <label for="ep">
                            <span class="icon-ep"></span>
                            Elite partner
                            <i class="fas fa-question-circle" data-open-modal="elite-partner"></i>
                        </label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" id="ipv6" @change="getServices" value="icon3">
                        <label for="ipv6">
                            <span class="icon-short-periods"></span>
                            {{ label_short_periods }}
                            <i class="fas fa-question-circle" data-open-modal="ipv6"></i>
                        </label>
                    </div>
                </div>
                <div class="filter-item form-item type-search">
                    <input type="text" name="registrar" class="inline-label" id="searchw" value=""
                           placeholder="{{ label_search_registrar }}" v-model="queryString">
                    <button class="btn btn--primary" id="submit" aria-label="{{ label_search }}"><i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </form>
        <div class="suggestions-loader" v-show="loading">
            <i class="fas fa-spinner fa-spin"></i>
        </div>
        <section class="content-inner content-area" data-search-indexing-allowed="true" v-show="filterResults.length > 0 && !loading">
            <transition-group name="fadeIn" tag="div" class="registrar-list-container">
                {% elementscontext edicy_model="Registrant" %}
                    {% if editmode %}
                        <article class="registrar--item" :key="-1">
                            <div class="registrar--logo">
                                <i class="fas fa-plus"></i>
                            </div>
                            <h2>Lisa uus registripidaja</h2>
                            <br>
                            <p>{% addbutton element_type="Registrant" %}</p>
                        </article>
                    {% endif %}
                    <article class="registrar--item" v-for="(result,index) in filterResults" :key="index">
                        <div class="registrar--services">
                            <span v-if="result.values.dnssec" class="item" title="DNSSEC" style="background-image:url({{ assets_path }}/dns.svg)"></span>
                            <span v-if="result.values.ep" class="item" title="Elite Partner" style="background-image:url({{ assets_path }}/ep2.svg)"></span>
                            <span v-if="result.values.icon3" class="item" title="Short URL" style="background-image:url({{ assets_path }}/short-url.svg)"></span>
                        </div>
                        <a :href="result.website" class="registrar--logo">
                            <i v-if="typeof result.values.logo === 'undefined'" class="fas fa-certificate"></i>
                            <img v-else :src="result.values.logo" :alt="result.title">
                        </a>
                        <h2>${ result.title }</h2>
                        <p><a :href="result.values.website|urlify" class="registrar--url">${ result.values.website }</a></p>
                        {% if editmode %}
                            <p><a :href="result.public_url" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a></p>
                        {% endif %}
                    </article>
                {% endelementscontext %}
            </transition-group>
        </section>
        <transition name="fadeIn">
            <div class="page--content" style="display: none;" v-show="!loading && !filterResults.length">
                <div class="page--body u-content-styles">
                    {% contentblock name="noresults_block" publish_default_content="true" %}
                        <h2>Otsingule vastavaid tulemusi ei leitud</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto atque consectetur consequuntur cum doloribus et facilis, fugiat hic modi nam optio perspiciatis, possimus, provident quam quas quisquam vero. Autem, minus.</p>
                    {% endcontentblock %}
                </div>
            </div>
        </transition>
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
            <div class="mdl--actions">
                <button class="btn btn--primary" data-close-modal>{{ label_close }}</button>
            </div>
        </div>
    </div>
</div>
<div class="mdl mdl--registrar" data-modal="elite-partner">
    <div class="mdl--container">
        <header class="mdl--header">
            <h2>Elite partner</h2>
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
<div class="mdl mdl--registrar" data-modal="ipv6">
    <div class="mdl--container">
        <header class="mdl--header">
            <h2>{{ label_short_periods }}</h2>
            <a href="#" role="button" class="btn btn--close" data-close-modal>
                <i class="fas fa-times"></i>
            </a>
        </header>
        <div class="mdl--content">
            <article class="u-content-styles">
                {% contentblock name="ipv6-desc" publish_default_content="true" %}
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
{% if editmode %}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
{% else %}
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
{% endif %}
<script src="https://cdn.jsdelivr.net/npm/vue-resource@1.5.1"></script>
{% include "site-javascripts" %}

<script>
    var lang = '{{ page.language_code }}';
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
        created: function() {
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
                        if (typeof item.values.icon3 !== 'undefined' && item.values.icon3) {
                            services.push('icon3');
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
                    this.queryServices = this.queryServices.filter(function(item) {
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

                this.$http.get(this.requestUrl).then(function(response) {
                    let links = response.headers.get('Link').split(',');
                    let nextPage = links.filter(function(item) {
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
                    }
                    else {
                        this.queryPage++;
                        this.searchArticles();
                    }
                }, function(response) {
                    console.log(response);
                });
            }
        }
    });
</script>
</body>
</html>