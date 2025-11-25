<!DOCTYPE html>
<!-- registars.tpl -->
<html class="common-page common-registrar-page {% if editmode %}editmode{% else %}public{% endif %}"
      lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
    {% include "html-head" %}
</head>

<body>
{% include "header" %}
<main class="page-content" role="main">
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
        <div class="registrar-filter">
            <div class="search-block">
                <div class="filter-item type-checkbox">
                    <div class="checkbox">
                        <input type="checkbox" id="dnssec" data-filter=".dnssec" class="filter-checkbox" value="dnssec">
                        <label for="dnssec">
                            <span class="icon-dnssec"></span>
                            DNSSEC
                            <i class="fas fa-question-circle" data-open-modal="dnssec"></i>
                        </label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" class="filter-checkbox" id="ep" data-filter=".ep" value="ep">
                        <label for="ep">
                            <span class="icon-ep"></span>
                            {{ label_elite_partner }}
                            <i class="fas fa-question-circle" data-open-modal="elite-partner"></i>
                        </label>
                    </div>
                    <div class="checkbox">
                        <input type="checkbox" id="short_url" class="filter-checkbox" data-filter=".short_url" value="short_url">
                        <label for="short_url">
                            <span class="icon-short-periods"></span>
                            {{ label_short_periods }}
                            <i class="fas fa-question-circle" data-open-modal="short_url"></i>
                        </label>
                    </div>
                </div>
                <div class="filter-item form-item type-search">
                    <input type="text" name="registrar" class="inline-label" id="search-filter" value=""
                           placeholder="{{ label_search_registrar }}">
                    <button class="btn btn--primary" id="submit" aria-label="{{ label_search }}"><i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </div>
        <section class="content-inner content-area" data-search-indexing-allowed="true">
            <div id="filter-container" class="registrar-list-container filter-container">
                {% elementscontext edicy_all_languages="false" edicy_model="Registrant" edicy_page_path_prefix=page.path %}

                    {% if editmode %}
                        <article class="registrar--item">
                            <div class="registrar--logo">
                                <i class="fas fa-plus"></i>
                            </div>
                            <h2>Lisa uus registripidaja</h2>
                            <br>
                            <p>{% addbutton element_type="Registrant" %}</p>
                        </article>
                    {% endif %}
                {% for element in elements %}
                {% assign filter_classes = "" %}
                    {% if element.dnssec == true %}
                    {% assign filter_classes = filter_classes | append: " dnssec" %}
                    {% endif %}
                    {% if element.ep == true %}
                {% assign filter_classes = filter_classes | append: " ep" %}
                    {% endif %}
                    {% if element.short_url == true %}
                {% assign filter_classes = filter_classes | append: " short_url" %}
                    {% endif %}
                    <article class="registrar--item registrar {{filter_classes}}">
                        <div class="registrar--services">
                            {% if element.dnssec == true %}
                                <span class="item" title="DNSSEC" style="background-image:url({{ assets_path }}/dns.svg)"></span>
                            {% endif %}
                            {% if element.ep == true %}
                            <span class="item" title="{{ label_elite_partner }}" style="background-image:url({{ assets_path }}/ep2.svg)"></span>
                            {% endif %}
                            {% if element.short_url == true %}
                            <span class="item" title="Short URL" style="background-image:url({{ assets_path }}/short-url.svg)"></span>
                            {% endif %}
                        </div>
                        <a href="{{ element.url }}" class="registrar--logo">
                            {% if element.logo != "" or element.logo %}
                            <img src="{{ element.logo }}" alt="{{ element.title }}">
                            {% else %}
                            <i class="fas fa-certificate"></i>
                            {% endif %}
                        </a>
                        <h2 class="name">
                            {{ element.title }}
                        </h2>
                        <p><a href="{{ element.url }}" class="registrar--url">
                                {% assign parts_ee = element.website | split: ".ee/" %}
                                {% assign domain_ee = parts_ee[0] %}

                                {% assign parts_com = domain_ee | split: ".com/" %}
                                {% assign domain = parts_com[0] %}

                                {{ domain | replace_first: "https://", "" }}
                            </a></p>
                        {% if editmode %}
                            <p><a href="{{ element.url }}" class="btn btn--edit"><i class="fas fa-pencil-alt"></i><span>{{ label_edit }}</span></a></p>
                        {% endif %}
                    </article>
                {% endfor %}
                {% endelementscontext %}
            </div>
        </section>
        <transition name="fadeIn">
            <div class="page--content" style="display: none;">
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
{% include "footer" %}

{% include "site-javascripts" %}

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script>
    $(document).ready(function(){
        // Initialize Isotope
        var $grid = $('#filter-container').isotope({
            itemSelector: '.registrar',
            layoutMode: 'fitRows',
            getSortData: {
                name: function(itemElem) {
                    // Get the text content of the element and convert it to lowercase
                    return $(itemElem).find('.name').text().toLowerCase();
                },
                classCount: function(itemElem) {
                    // Count how many of the specified classes the item has
                    var badgeClasses = ['dnssec', 'ep', 'short_url']; // List of badge classes
                    var count = 0;
                    badgeClasses.forEach(function(cls) {
                        if ($(itemElem).hasClass(cls)) count++;
                    });
                    // Return a negative count to have items with more badges come first
                    return -count;
                }
            },

            sortBy: ['classCount', 'name'] // Sort by class count first, then by name
        });


        // Filtering based on checkboxes
        $('.filter-checkbox').change(function(){
            var filters = [];
            $('.filter-checkbox:checked').each(function(){
                filters.push($(this).attr('data-filter'));
            });
            var filterValue = filters.join(', ');
            $grid.isotope({ filter: filterValue });
            $grid.isotope({ sortBy: ['classCount', 'name'] });
        });

        // Filtering based on search input
        $('#search-filter').on('input', function() {
            var searchValue = $(this).val().toLowerCase();
            $grid.isotope({
                filter: function() {
                    return $(this).text().toLowerCase().includes(searchValue);
                }
            });
        });
    });
</script>




<script>
    /* var lang = '{{ page.language_code }}';
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
    }); */
</script>
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
{% include "footer-scripts" %}
</body>
</html>