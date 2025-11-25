<!DOCTYPE html>
<!-- page__search.tpl -->
<html class="common-page page-search search-results-page {% if editmode %}editmode{% else %}public{% endif %}"
	lang="{{ page.language_code }}" data-search-indexing-allowed="false">

<head prefix="og: http://ogp.me/ns#">
	{% include "html-head" %}
</head>

<body>
	<div id="app">
		{% include "cookie-modal" %}
		{% include "header" %}
		<main class="page-content" role="main">
			<article class="page--detail mb-100">
				<header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"
					{% endif %}>
					<div class="u-container">
						<h1>{{ page.title }}</h1>
						{% if page.description != "" %}
						<p>{{ page.description }}</p>
						{% endif %}
						<form class="search-block" @submit.prevent="searchArticles" method="get" id="site-search">
							<div class="form-item type-search">
								<input type="text" name="keys" v-model.lazy="queryString" class="inline-label" id="searchw" value=""
									placeholder="{{ label_search }}..." autocomplete="off">
								<!-- <button class="btn btn--default" type="reset" @click="resetForm" title="{{ label_reset }}" aria-label="{{ label_reset }}"><i class="fas fa-sync"></i></button> -->
								<button class="btn btn--primary" type="submit" aria-label="{{ label_search }}"
									title="{{ label_search }}">
									<i class="fas fa-arrow-right"></i>
									<i class="fas fa-spinner fa-spin"></i>
								</button>
							</div>
						</form>
					</div>
				</header>
				<transition name="fadeIn">
					<div class="page--content" v-show="!showResults && !queryString">
						<div class="page--body">
							{% include "help-topics" %}
						</div>
					</div>
				</transition>
				<transition name="fadeIn">
					<div class="page--content" v-show="noResults && queryString && !loading">
						<div class="page--body u-content-styles">
							{% contentblock name="noresults_block" publish_default_content="true" %}
							<h2>Otsingule vastavaid tulemusi ei leitud</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto atque consectetur
								consequuntur cum doloribus et facilis, fugiat hic modi nam optio perspiciatis, possimus,
								provident quam quas quisquam vero. Autem, minus.</p>
							{% endcontentblock %}
						</div>
					</div>
				</transition>
				<div class="search-page page--content">
					<div class="search-page--results page--body">
						<h2 v-if="pages.length > 0 && !loading"><span v-html="totalEntries"></span> {{ label_search_results }}</h2>
						<transition name="fadeIn">
							<div v-if="articles.length">
								<paginate name="resultsPagination" :list="pages" :per="1" ref="paginator" tag="div">
									<div class="suggestions-loader" v-show="loading">
										<i class="fas fa-spinner fa-spin"></i>
									</div>
									<article class="item" v-for="(result,index) in articles" :key="index"
										v-show="showResults && !loading">
										<a :href="result.path + '?mark-keys=' + stripHtml(result.description)">
											<h3 v-html="result.title"></h3>
											<p v-html="result.description"></p>
										</a>
									</article>
								</paginate>
							</div>
						</transition>
						<div class="pagination" v-if="showResults && !loading">
							<div class="mx-auto">
								<paginate-links :async="true" :show-step-links="true" :limit="5" :step-links="{ next: '{{ label_next_plural }}', prev: '{{ label_previous_plural }}' }"
									:hide-single-page="true" @change="pageChange" for="resultsPagination"></paginate-links>
							</div>
						</div>
					</div>
				</div>
			</article>
		</main>
	</div>
	{% include "footer" %}
	{% if editmode %}
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	{% else %}
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.min.js"></script>
	{% endif %}
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-paginate/3.6.0/vue-paginate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue-resource@1.5.1"></script>
	<script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
	{% editorjsblock %}
	<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
	{% endeditorjsblock %}
	<script src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
	<script>
		var lang = '{{ page.language_code }}';
		new Vue({
			delimiters: ['${', '}'],
			el: '#app',
			data: {
				loading: false,
				articles: [],
				pages: [],
				queryString: '',
				cachedQueryString: '',
				totalEntries: 0,
				paginate: ['resultsPagination'],
				articlesParameters: {
					lang: lang,
					page: 1,
					per_page: 8,
					types: 'page,article',
					order: 'updated_at desc'
				}
			},
			created: function () {
				function getUrlParameter(name) {
					name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
					const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
					const results = regex.exec(location.search);
					return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
				}

				if (getUrlParameter('keys')) {
					this.queryString = getUrlParameter('keys');
					this.searchArticles();
				}
			},
			computed: {
				showResults: function () {
					return this.totalEntries > 0;
				},
				noResults: function () {
					return this.totalEntries === 0;
				}
			},
			methods: {
				resetForm: function () {
					this.queryString = '';
					this.articles = [];
					this.pages = [];
					this.totalEntries = 0;
					window.history.pushState({}, document.title, "/{{ page.path }}");
				},
				searchArticles: function () {
					if (this.queryString) {
						if (this.cachedQueryString !== this.queryString) {
							this.pages = [];
							this.articles = [];
							this.totalEntries = 0;
							this.articlesParameters.page = 1;
							if (this.$refs.paginator && this.$refs.paginator.lastPage !== 0) {
								this.$refs.paginator.goToPage(1);
							}
							window.history.replaceState({}, 'searchKey', window.location.pathname + '?keys=' + this.queryString);
						}
						this.cachedQueryString = this.queryString;
						this.loading = true;
						handleArticlesSearchResult = function (data) {
							this.pages = new Array(data.pages.total);
							this.articles = data.result;
							this.totalEntries = data.totalEntries;
							this.loading = false;
						}.bind(this);

						// Initiate the object
						var searchArticles = new VoogSearchSDK(this.articlesParameters, handleArticlesSearchResult);

						// Run some search query
						searchArticles.query({
							q: this.queryString
						});
					}
				},
				pageChange: function (toPage, fromPage) {
					this.articlesParameters.page = toPage;
					this.searchArticles();
					$("html, body").animate({ scrollTop: $('.search-page').offset().top }, 500);
				},
				stripHtml: function (string) {
					string = string.replace(/(?:\r\n|\r|\n)/g, '~');
					const doc = new DOMParser().parseFromString(string, 'text/html');
					return doc.body.textContent || '';
				}
			}
		});
	</script>
	{% include "site-javascripts" %}
	{% include "footer-scripts" %}
</body>

</html>