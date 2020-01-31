<!DOCTYPE html>
<!-- blog_news_main.tpl -->
<html class="page-loading blog-page blog--main {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
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
        <form class="blog-filter" action="#" method="get" @submit.prevent="submitForm">
            <div class="blog-filter--topics">
                <div class="items">
                    {% assign types = '' | split: ',' %}
                    {% for article in site.latest_1500_articles %}
                        {% unless article.page.node_id == 2089647 %}
                            {% assign typeName = article.data.type | split: ',' %}
                            {% assign types = types | concat: typeName %}
                        {% endunless %}
                    {% endfor %}
                    {% assign types = types | uniq %}
                    {% for type in types %}
                        {% assign type = type | strip %}
                        <a href="#" @click.self.prevent="getTypes('{{ type }}')" data-type="{{ type }}"><i class="fas fa-check"></i>{{ type }}</a>
                    {% endfor %}
                </div>
                <div class="items">
                  {% assign topics = '' | split: ',' %}
                  {% for article in site.latest_1500_articles %}
                    {% unless article.page.node_id == 2089647 %}
                    {% assign topicName = article.data.topic | split: ',' %}
                    {% assign topics = topics | concat: topicName %}
                    {% endunless %}
                  {% endfor %}
                  {% assign topics = topics | uniq %}
                  {% for topic in topics %}
                    {% assign topic = topic | strip %}
                      <a href="#" @click.self.prevent="getTopics('{{ topic }}')" data-topic="{{ topic }}"><i class="fas fa-check"></i>{{ topic }}</a>
                  {% endfor %}
                </div>
                <a href="#" class="btn" @click.prevent="showAdvOptions = !showAdvOptions">
                    <span v-show="!showAdvOptions" class="option">{{ label_more_options }}</span>
                    <span v-show="showAdvOptions" class="option">{{ label_less_options }}</span>
                    <i :class="{ 'fa-rotate-180': showAdvOptions, 'fas': true, 'fa-arrow-down': true }"></i>
                </a>
            </div>
            <div class="search-block">
                <div class="filter-item form-item type-search">
                    <input v-model="queryString" type="text" name="search" value="" placeholder="{{ label_search_keyword }}">
                </div>
                <div class="filter-item input-group type-date-range">
                    <div class="form-item type-datepicker">
                        <input type="text" placeholder="{{ label_date_from }}" v-if="!init">
                        <flat-pickr v-model="queryDate.from" @on-change="setQueryDateFrom" @on-open="resetQueryMinDate" @on-close="setQueryMinDate" :config="fromDatepickerConfig" placeholder="{{ label_date_from }}"></flat-pickr>
                        <button class="btn btn--primary" type="button" title="{{ label_open_calendar }}" aria-label="{{ label_open_calendar }}">
                            <i class="fas fa-calendar-alt"></i>
                        </button>
                    </div>
                    <span class="sep">-</span>
                    <div class="form-item type-datepicker">
                        <input type="text" placeholder="{{ label_date_to }}" v-if="!init">
                        <flat-pickr v-model="queryDate.to" @on-change="setQueryDateTo" @on-open="resetQueryMaxDate" @on-close="setQueryMaxDate" :config="toDatepickerConfig" placeholder="{{ label_date_to }}"></flat-pickr>
                        <button class="btn btn--primary" type="button" title="{{ label_open_calendar }}" aria-label="{{ label_open_calendar }}">
                            <i class="fas fa-calendar-alt"></i>
                        </button>
                    </div>
                </div>
                <div class="filter-item form-actions">
                    <button class="btn btn--primary btn--large" type="submit" title="{{ label_search }}" aria-label="{{ label_search }}">
                        <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="btn btn--default btn--large" type="reset" @click="resetForm" title="{{ label_reset }}" aria-label="{{ label_reset }}"><i class="fas fa-sync"></i></button>
                </div>
            </div>
            <transition name="fade">
                <div class="article--tags" v-show="showAdvOptions">
                    {% assign tags = '' | split: ',' %}
                    {% for article in site.latest_1500_articles %}
                        {% unless article.page.node_id == 2293891 %}
                            {% assign tagName = article.tag_names_str | split: ', ' %}
                            {% assign tags = tags | concat: tagName %}
                        {% endunless %}
                    {% endfor %}
                    {% assign tags = tags | uniq | sort_natural %}
                    {% for tag in tags %}
                      {% assign tag = tag | strip %}
                        <a href="#" @click.prevent="getTags('{{ tag }}')" data-tag="{{ tag }}">{{ tag }}</a>
                    {% endfor %}
                </div>
            </transition>
        </form>
        <div class="suggestions-loader" v-show="loading">
            <i class="fas fa-spinner fa-spin"></i>
        </div>
        <div v-if="filterResults.length > 0 && !loading">
            <paginate name="resultsPagination" :list="filterResults" :per="resultsPerPage" ref="paginator" tag="div">
                <transition-group name="fade" tag="div" class="articles--list">
                    <article class="article article--teaser" v-for="(result,index) in paginated('resultsPagination')" :key="index">
                        <a :href="result.public_url" :class="{ 'article--image': true, 'u-has-placeholder': !result.image.public_url }">
                            <img :src="result.image.public_url" :alt="result.title" v-if="result.image.public_url">
                        </a>
                        <div class="article--content">
                            <header>
                                <div class="article--data" v-if="result.data.type || result.data.topic">
                                    <p v-if="result.data.type" class="item article--type" v-html="result.data.type"></p>
                                    <p v-if="result.data.topic" class="item article--topic" v-html="result.data.topic"></p>
                                </div>
                                <h3><a :href="result.public_url" v-html="result.title"></a></h3>
                            </header>
                            <p v-html="result.excerpt"></p>
                            <footer>
                                <p class="article--date"><i class="fas fa-pencil-alt"></i>${ result.created_at }</p>
                                <p class="article--author" v-html="result.author.name"></p>
                            </footer>
                        </div>
                    </article>
                </transition-group>
            </paginate>
        </div>
        <div class="pagination" v-if="filterResults.length > 0 && !loading">
            <paginate-links :show-step-links="true" :limit="5" :step-links="{ next: 'Järgmised', prev: 'Eelmised' }" :hide-single-page="true" @change="pageChange" for="resultsPagination"></paginate-links>
            <div class="results-per-page">
                <label>Tulemusi lehel</label>
                <div class="select">
                    <select v-model.number="resultsPerPage">
                        <option value="9">9</option>
                        <option value="18">18</option>
                        <option value="54">54</option>
                        <option value="9999">Kõik</option>
                    </select>
                </div>
            </div>
        </div>
        <transition name="fade">
            <div class="page--content" style="display: none;" v-show="!loading && !filterResults.length">
                <div class="article--body u-content-styles">
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
{% if editmode %}
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
{% else %}
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
{% endif %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-paginate/3.6.0/vue-paginate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-resource@1.5.1"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.5.0/flatpickr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.5.0/l10n/{{ page.language_code }}.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-flatpickr-component@7.0.4/dist/vue-flatpickr.min.js"></script>
{% include "site-javascripts" %}
<script>
    {% assign toDate = "today" | date: "%Y-%m-%d" %}
    var blogposts = [
        {% for article in site.latest_1500_articles %}
            {% unless article.page.node_id == 2089647 %}
                {% capture blogpost %}
                    {
                        "id": {{ article.id }},
                        "title": {% if article.title %}{{ article.title | json }}{% else %}""{% endif%},
                        "path": "{{ article.path }}",
                        "excerpt": {% if article.excerpt %}{{ article.excerpt | json }}{% else %}""{% endif%},
                        "created_at": "{{ article.created_at | date:'%d.%m.%Y' }}",
                        "data": {
                            "type": "{{ article.data.type }}",
                            "topic": "{{ article.data.topic }}",
                        },
                        "public_url": "{{ article.url }}",
                        "author": {
                            "name": "{{ article.author.name }}",
                        },
                        "image": {
                            "public_url": "{{ article.image.for-width-1024.schemeless_url }}",
                        },
                        "tag_names":[
                            {% for tag in article.tag_names %}
                            '{{ tag }}',
                            {% endfor %}
                        ]
                    },
                {% endcapture %}
                {{ blogpost | strip | strip_newlines }}
            {% endunless %}
        {% endfor %}
    ];
    
    var lang = '{{ page.language_code }}';
    Vue.component('flat-pickr', VueFlatpickr);
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
            queryTopics: [],
            queryTypes: [],
            queryTags: [],
            queryDate: {
                from: '',
                to: ''
            },
            results: blogposts,
            cachedResults: blogposts,
            resultsPerPage: 9,
            paginate: ['resultsPagination'],
            fromDatepickerConfig: {
                dateFormat: 'Y-m-d',
                altFormat: 'd.m.y',
                altInput: true,
                minDate: '',
                maxDate: '{{ toDate }}',
                locale: '{{ page.language_code }}'
            },
            toDatepickerConfig: {
                dateFormat: 'Y-m-d',
                altFormat: 'd.m.y',
                altInput: true,
                minDate: '',
                maxDate: '{{ toDate }}',
                locale: '{{ page.language_code }}'
            }
        },
        created: function() {
            this.init = true;
            document.querySelector('html').classList.remove('page-loading');
            function getUrlParameter(name) {
              name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
              const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
              const results = regex.exec(location.search);
              return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }
            if (getUrlParameter('topic')) {
              const topic = getUrlParameter('topic');
              this.getTopics(topic);
            }
              if (getUrlParameter('type')) {
                const type = getUrlParameter('type');
                this.getTypes(type);
              }
          if (getUrlParameter('tag')) {
            const tag = getUrlParameter('tag');
            this.getTags(tag);
          }
        },
        computed: {
            filterResults: function () {
                let results = [];
                let tag_results = [];
                if (!this.queryTopics.length && !this.queryTypes.length && !this.queryTags.length) {
                    return this.results;
                }
                if (this.queryTopics.length || this.queryTypes.length) {
                    results = this.results.filter(function(item) {
                        return (item.data.topic && this.queryTopics.indexOf(item.data.topic) > -1) || (item.data.type && this.queryTypes.indexOf(item.data.type) > -1);
                    }.bind(this));
                }
                if (this.queryTags.length) {
                    tag_results = this.results.filter(function(item) {
                        return this.queryTags.every(function (v) {
                            return item.tag_names.indexOf(v) >= 0;
                        }.bind(this));
                    }.bind(this));
                    return tag_results;
                } else {
                    return results;
                }
            }
        },
        methods: {
            getTopics: function (topic) {
                if (this.queryTopics.indexOf(topic) > -1) {
                  document.querySelector('[data-topic="' + topic + '"]').classList.remove('u-active');
                  this.queryTopics = this.queryTopics.filter(function(item) {
                    return item.indexOf(topic) === -1;
                  });
                } else {
                  this.queryTopics.push(topic);
                  document.querySelector('[data-topic="' + topic + '"]').classList.add('u-active');
                }
              if (this.$refs.paginator) {
                this.$refs.paginator.goToPage(1);
              }
            },
            getTypes: function (type) {
                if (this.queryTypes.indexOf(type) > -1) {
                  document.querySelector('[data-type="' + type + '"]').classList.remove('u-active');
                  this.queryTypes = this.queryTypes.filter(function(item) {
                    return item.indexOf(type) === -1;
                  });
                } else {
                  this.queryTypes.push(type);
                  document.querySelector('[data-type="' + type + '"]').classList.add('u-active');
                }
              if (this.$refs.paginator) {
                this.$refs.paginator.goToPage(1);
              }
            },
            getTags: function (tag) {
                if (this.queryTags.indexOf(tag) > -1) {
                    document.querySelector('[data-tag="' + tag + '"]').classList.remove('u-active');
                    this.queryTags = this.queryTags.filter(function(item) {
                        return item.indexOf(tag) === -1;
                    });
                } else {
                    if (tag !== 'undefined') {
                        this.queryTags.push(tag);
                        document.querySelector('[data-tag="' + tag + '"]').classList.add('u-active');
                    }
                }
                if (this.$refs.paginator) {
                    this.$refs.paginator.goToPage(1);
                }
            },
            setQueryDateFrom: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.queryDate.from = dateStr;
            },
            resetQueryMaxDate: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.fromDatepickerConfig.maxDate = '{{ toDate }}';
            },
            setQueryMaxDate: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.fromDatepickerConfig.maxDate = dateStr;
            },
            resetQueryMinDate: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.toDatepickerConfig.minDate = '';
            },
            setQueryMinDate: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.toDatepickerConfig.minDate = dateStr;
            },
            setQueryDateTo: function (selectedDates, dateStr, instance) {
                console.log(dateStr);
                this.queryDate.to = dateStr;
            },
            setDate: function () {
                $(this.results).each(function (index, item) {
                    item.created_at = moment(item.created_at).format('DD.MM.YYYY');
                });
            },
            resetForm: function() {
                let activeFilters = document.querySelectorAll('[data-topic].u-active,[data-type].u-active,[data-tag].u-active');
                activeFilters.forEach(function(item) {
                    item.classList.remove('u-active');
                });
                this.queryString = '';
                this.queryTopics = [];
                this.queryTypes = [];
                this.queryTags = [];
                this.queryDate = {
                    from: '',
                    to: ''
                };
                this.fromDatepickerConfig = {
                    minDate: '',
                    maxDate: '{{ toDate }}',
                };
                this.toDatepickerConfig = {
                    minDate: '',
                    maxDate: '{{ toDate }}',
                };
                this.results = this.cachedResults;
                if (this.$refs.paginator) {
                    this.$refs.paginator.goToPage(1);
                }
            },
            submitForm: function() {
                this.results = [];
                if (this.$refs.paginator) {
                    this.$refs.paginator.goToPage(1);
                }
                this.searchArticles();
            },
            searchArticles: function () {
                this.loading = true;
                let searchTitle = this.queryString ? 'q.article.title.$matches=' + encodeURI(this.queryString) : '',
                    searchBody = this.queryString ? '&q.article.body.$matches=' + encodeURI(this.queryString) : '',
                    searchDateFrom = this.queryDate.from ? '&q.article.created_at.$gteq=' + encodeURI(this.queryDate.from) : '',
                    searchDateTo = this.queryDate.to ? '&q.article.created_at.$lteq=' + encodeURI(this.queryDate.to) : '';
              this.requestUrl = '/admin/api/articles?'
                    + searchTitle
                    + searchBody
                    + searchDateFrom
                    + searchDateTo
                    + '&q.page.node_id.$in=2089597,2089638'
                    + '&page=' + this.queryPage
                    + '&per_page=' + this.queryPerPage
                    + '&language_code=' + lang
                    + '&include_tags=true'
                    + '&include_details=true';

                this.$http.get(this.requestUrl).then(function(response) {
                    let links = response.headers.get('Link').split(',');
                    let nextPage = links.filter(function(item) {
                      return item.indexOf('rel="next"') > -1;
                    });
                    nextPage = nextPage.toString().match(/\<(.*?)\>/);
                    this.results = this.results.concat(response.body);
                    if (!nextPage) {
                        this.loading = false;
                        this.setDate();
                        this.queryPage = 1;
                    }
                    else {
                        this.queryPage++;
                        this.searchArticles();
                    }
                }, function(response) {
                    console.log(response);
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