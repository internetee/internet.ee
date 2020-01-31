<!DOCTYPE html>
<!-- domeenioksjonid.tpl -->
<html class="page-loading auctions-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
    {{ blog.rss_link }}
</head>
<body>
{% include "cookie-modal" %}
{% include "header" %}
<main class="page-content" role="main">
    <section class="page--detail" data-search-indexing-allowed="true" id="app">
        <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }} {% addbutton %}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="domain-auctions-instructions">
            <div class="panel-block" v-if="!loading">
                <p>{{ label_total_domainauctions }} <strong v-html="auctions.length"></strong></p>
            </div>
            {% include 'steps-block' noTitle %}
            <div class="u-content-styles">
                {% contentblock name="domain-auctions-instructions"%}
                    Tutvu ka oksjonikeskkonna kasutajatingimustega ja loe detailsemalt oksjoniprotsessist.
                {% endcontentblock %}
            </div>
        </div>
        <form class="blog-filter auctions-filter" action="#" @submit.prevent="submitForm" v-if="auctions.length">
            <div class="search-block">
                <div class="filter-item form-item type-search">
                    <input v-model="queryString" type="text" name="search" value="" placeholder="{{ label_search }}">
                </div>
                <div class="filter-item form-actions">
                    <button class="btn btn--primary btn--large" type="submit" title="{{ label_search }}" aria-label="{{ label_search }}">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="btn btn--default btn--large" type="reset" @click="resetForm" title="{{ label_reset }}" aria-label="{{ label_reset }}">
                        <i class="fas fa-sync"></i>
                    </button>
                </div>
            </div>
        </form>
        <div class="suggestions-loader" v-if="loading">
            <i class="fas fa-spinner fa-spin"></i>
        </div>
        <div v-if="results.length && !loading">
            <paginate name="resultsPagination" :list="results" :per="resultsPerPage" ref="paginator" tag="div">
                <transition-group name="fadeIn" tag="div" class="domains-list">
                    <article class="item" v-for="(result,index) in paginated('resultsPagination')" :key="result.id + index">
                        <a :href="'https://auction.internet.ee/auctions/' + result.id + '/offers/new'" v-html="result.domain_name"></a>
                    </article>
                </transition-group>
            </paginate>
        </div>
        <div class="pagination" v-if="results.length && !loading">
            <paginate-links :async="true" :show-step-links="true" :limit="5" :step-links="{ next: 'Järgmised', prev: 'Eelmised' }" :hide-single-page="true" @change="pageChange" for="resultsPagination"></paginate-links>
            <div class="results-per-page" v-if="results.length > 20">
                <label>{{ label_results_per_page }}</label>
                <div class="select">
                    <select v-model.number="resultsPerPage">
                        <option value="20">20</option>
                        <option value="50">50</option>
                        <option value="999999">{{ label_all }}</option>
                    </select>
                </div>
            </div>
        </div>
        <transition name="fadeIn">
            <div class="page--content" v-show="!loading && (!results.length || !auctions.length)">
                <div class="article--body u-content-styles" v-show="!auctions.length">
                    {% contentblock name="no_auctions_block" publish_default_content="true" %}
                        <h2>Hetkel ühtegi domeeni oksjonil ei ole</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto atque consectetur consequuntur cum doloribus et facilis, fugiat hic modi nam optio perspiciatis, possimus, provident quam quas quisquam vero. Autem, minus.</p>
                    {% endcontentblock %}
                </div>
                <div class="article--body u-content-styles" v-show="!results.length && auctions.length">
                    {% contentblock name="noresults_block" publish_default_content="true" %}
                        <h2>Otsingule vastavaid tulemusi ei leitud</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto atque consectetur consequuntur cum doloribus et facilis, fugiat hic modi nam optio perspiciatis, possimus, provident quam quas quisquam vero. Autem, minus.</p>
                    {% endcontentblock %}
                </div>
            </div>
        </transition>
    </section>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
{% if editmode %}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
{% else %}
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
{% endif %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-paginate/3.6.0/vue-paginate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script>
    new Vue({
        delimiters: ['${', '}'],
        el: '#app',
        data: {
            loading: true,
            requestUrl: '',
            queryString: '',
            auctions: [],
            resultsPerPage: 20,
            paginate: ['resultsPagination'],
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
            results: function () {
              if (this.queryString) {
                return this.auctions.filter(function(auction) {
                  return !!auction.domain_name.toLowerCase().includes(this.queryString.toLowerCase());
                }.bind(this));
              }
              return this.auctions;
            },
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
            resetForm: function() {
                this.queryString = '';
                this.results = this.auctions;
                if (this.$refs.paginator) {
                    this.$refs.paginator.goToPage(1);
                }
            },
            submitForm() {
                this.results = this.auctions.filter(function(auction) {
                  return !!auction.domain_name.toLowerCase().includes(this.queryString.toLowerCase());
                }.bind(this));
            },
            getAuctions() {
                var self = this;
                $.getJSON("https://auction.internet.ee/auctions.json")
                .done(function(data) {
                  self.auctions = data;
                })
                .fail(function() {
                  self.auctions = [];
                })
                .always(function() {
                  self.loading = false;
                });
            },
            pageChange: function () {
                $("html, body").animate({ scrollTop: $('.blog-filter').offset().top }, 500);
            }
        }
    });
</script>
</body>
</html>
