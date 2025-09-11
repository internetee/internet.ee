<!DOCTYPE html>
<!-- page__default.tpl -->
<html class="common-page page-dynamic-landing {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  <script src="//www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
  <script type="text/javascript">
      var onloadCallback = function () {
        if (document.querySelector(".form_area")) {
          var captchaElem = document.createElement("div");
          captchaElem.classList.add('g-recaptcha');
          captchaElem.setAttribute('id', 'form-recaptcha');
          var form = document.querySelector(".form_area");
          var elem = document.querySelector(".form_submit");
          form.insertBefore(captchaElem, elem);
          window.captchaID = grecaptcha.render('form-recaptcha', {
            'sitekey': '6Ld-ARETAAAAAPN1pcTy9oYsUrbKm9_c9VDMvl6X'
          });
        }
      };
  </script>
  {% stylesheet_link "custom-pages.css" %}
    {% if editmode %}
    <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
  {% endif %}
</head>
<body class="domain-search-layout orange-campaign-landing">
{% include "header" %}
<main class="page-content" role="main">
  <article class="page--detail" data-search-indexing-allowed="true">
    
    {% if editmode or page.data.show_page_header %}
      <header class="page--header">
				{% assign heroBg = page.data.hero_image %}
				{% assign heroBgImage = 'none' %}
				{% if heroBg and heroBg.url %}
					{% assign heroBgImage = page.data.hero_image.url %}
				{% endif %}
				<div class="header-bg js-header-bg" style="background-image: url('{{ heroBgImage }}');"></div>
      {% if editmode %}
        <div class="c-switch-field">
          <span>Off/On</span>
          <label class="switch">
          <input 
            {% if page.data.show_page_header %}
            checked
            {% endif %}
           name="switch-page-header" type="checkbox">
          <span class="slider round"></span>
        </label>
        </div>
				<div class="c-header-image">
					<div style="width: 200px; height: 200px;" class="js-hero-image-area"
						data-image-object="{{ page.data.hero_image | json | escape }}" data-key="hero_image"></div>
				</div>
      {% endif %}
        <div class="u-container">
          <div>
						{% content name="page_header_content" single="text" placeholder="Päisebänner. Mille võimalusel vahetaksime
						kampaaniavisuali vastu" %}
					</div>
        </div>
      </header>
    {% endif %}
    <div class="anchors js-anchors">
      <div class="keywords-list">
      
      </div>
    </div>
		
    <div class="page--content">
			{% assign displayBlock = false %}
			{% assign displayKey = 'block1Display' %}
			{% assign blockBgKey = 'block1BgColor' %}
			{% assign blockTarget = 'js-block1' %}
			{% assign blockBgColor = '#a7a8aa' %}

			{% include "campaign-block-settings" %}

			{% if displayBlock or editmode %}
      <div class="dsearch-block js-block1" style="background-color: {{ blockBgColor }}; ">
        <div class="dsearch-container">
          <div class="dsearch-block__content">
            <div class="dsearch-block__title u-content-styles">
              {% content name="domain-title" %}
            </div>
            <div class="dsearch-block__search">
              <div id="app-dsearch">
                <div class="domain-search--in-content">
                  <div class="domain-search-container">
                    <form class="search-block" action="#" method="get" id="domain-search" @submit.prevent="addDomainLookupHandlers">
                      <div class="form-item type-search">
                        <input type="text" name="domain" class="inline-label" id="searchw" value="" placeholder="{{ domain_search }}"
                          autocomplete="off" v-model="queryString" maxlength="63" minlength="2">
                        <button class="btn btn--primary btn-submit" type="submit" title="{{ label_search }}"
                          aria-label="{{ label_search }}">
                          <i class="fas fa-arrow-right"></i>
                          <i class="fas fa-spinner fa-spin"></i>
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="domain-info">
                  <h3 v-if="message != ''" :class="[{ 'u-visible': message, 'domain--is-available': isAvailable }]"><span class="d-info-icon"></span><span>${ message }!</span></h3>
                  <a v-if="message != '' && isAvailable" href="https://www.internet.ee/domeenid/kuidas-registreerida-ee-domeeni" class="btn btn--default">Registreeri domeen</a>
                </div>
              </div>              
            </div>

            <div class="dsearch-block__footer u-content-styles">
              {% content name="domain-footer" %}
            </div>
          </div>
          <div class="dsearch-block__video">
            <div class="dsearch-embed">
              {% content name="video" %}
            </div>
          </div>
        </div>
      </div>
			{% endif %}

      <div class="u-content-styles">

				{% assign displayBlock = false %}
				{% assign displayKey = 'block2Display' %}
				{% assign blockBgKey = 'block2BgColor' %}
				{% assign blockTarget = 'js-block2' %}
				{% assign blockBgColor = '#ffffff' %}

				{% include "campaign-block-settings" %}

				{% if displayBlock or editmode %}
        <div class="dsearch-text-cols js-block2" style="background-color: {{ blockBgColor }};">
          <div class="dsearch-container">
            <div class="dsearch-text-cols__col">
              {% content name="files" %}
            </div>
            <div class="dsearch-text-cols__col">
              {% content name="files2" %}
            </div>
          </div>
        </div>
				{% endif %}

				{% assign displayBlock = false %}
				{% assign displayKey = 'block3Display' %}
				{% assign blockBgKey = 'block3BgColor' %}
				{% assign blockTarget = 'js-block3' %}
				{% assign blockBgColor = '#404041' %}
				
				{% include "campaign-block-settings" %}

				{% if displayBlock or editmode %}
        <div class="dsearch-blue-right {{ blockTarget }}" style="background-color: {{ blockBgColor }};">
          <div class="dsearch-container">
            <div class="dsearch-blue-right__content">
              {% content name="blue-right" %}
            </div>
            <div class="dsearch-blue-right__media">
              <div class="drop-picture-1" data-image-object="{{ page.data.image1 | json | escape }}"></div>
              {% assign image_url_1 = page.data.image1.url %}
              {% if image_url_1 and editmode != true %}
              <img src="{{image_url_1}}" alt="">
              {% endif %}
            </div>
          </div>
        </div>
				{% endif %}


				{% assign displayBlock = false %}
				{% assign displayKey = 'block4Display' %}
				{% assign blockBgKey = 'block4BgColor' %}
				{% assign blockTarget = 'js-block4' %}
				{% assign blockBgColor = '#ffffff' %}

				{% include "campaign-block-settings" %}

				{% if displayBlock or editmode %}
        <div class="dsearch-text-cols {{ blockTarget }}" style="background-color: {{ blockBgColor }};">
          <div class="dsearch-container">
            <div class="dsearch-text-cols__col">
              {% content name="files3" %}
            </div>
            <div class="dsearch-text-cols__col">
              {% content name="files4" %}
            </div>
          </div>
        </div>
				{% endif %}


				{% assign displayBlock = false %}
				{% assign displayKey = 'block5Display' %}
				{% assign blockBgKey = 'block5BgColor' %}
				{% assign blockTarget = 'js-block5' %}
				{% assign blockBgColor = '#ffac00' %}
				
				{% include "campaign-block-settings" %}
				
				{% if displayBlock or editmode %}
        <div class="dsearch-gray-left {{ blockTarget }}" style="background-color: {{ blockBgColor }};" id="how-to-buy">
          <div class="dsearch-container">
            <div class="dsearch-gray-left__media">
                          <div class="drop-picture-2" data-image-object="{{ page.data.image2 | json | escape }}"></div>
              {% assign image_url_2 = page.data.image2.url %}
              {% if image_url_2 and editmode != true %}
              <img src="{{image_url_2}}" alt="">
              {% endif %}
            </div>
                        <div class="dsearch-gray-left__content">
              {% content name="gray-left" %}
              <div style="margin-top: 32px; text-align: left;">
                <a style="margin: 0; padding: 15px 40px; text-transform: capitalize;" href="https://seiklusministeerium.ee/domeen" class="btn btn--primary" target="_blank">Osale</a>
              </div>
            </div>
          </div>
        </div>
				{% endif %}


				{% assign displayBlock = false %}
				{% assign displayKey = 'block6Display' %}
				{% assign blockBgKey = 'block6BgColor' %}
				{% assign blockTarget = 'js-block6' %}
				{% assign blockBgColor = '#ffffff' %}
				
				{% include "campaign-block-settings" %}
				
				{% if displayBlock or editmode %}
        <div class="dsearch-graph {{ blockTarget }}" style="background-color: {{ blockBgColor }};">
          <div class="dsearch-container">
            <div class="dsearch-graph__graph1">
              {% content name="info-1" %}
            </div>
            <div class="dsearch-graph__graph2">
              {% content name="info-2" %}
            </div>
          </div>
        </div>
				{% endif %}

      </div>
    </div>
  </article>
</main>
{% include "footer" %}
{% editorjsblock %}

  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
  var pageData = new Edicy.CustomData({

    type: "page", // allowed values "article", "page", "site"

    id: {{ page.id }} // Must be defined for "page" ({{page.id}}) or "article" ({{ article.id }})

  });
  pageData.on('success', function() {
    location.reload(yes);
  });

  const pageHeaderSwitch = document.querySelector('input[name="switch-page-header"]')
  pageHeaderSwitch.addEventListener('click', function() {
    if(pageHeaderSwitch.checked) {
      pageData.set({
        "show_page_header": true
      });
    } else {
      pageData.set({
        "show_page_header": false
      });
    }
  })

  new Edicy.ImgDropArea($('.drop-picture-1'), {
    change: function(data) {
      pageData.set({
        "image1": data
      });
    }
  });

  new Edicy.ImgDropArea($('.drop-picture-2'), {
    change: function(data) {
      pageData.set({
        "image2": data
      });
    }
  });

  new Edicy.ImgDropArea($('.drop-picture-3'), {
    change: function(data) {
      pageData.set({
        "image3": data
      });
    }
  });

	(function ($) {
		function setImgDropAreas(element, callback = null) {
			$.each($(element), function (i) {
				const name = $(this).data('key');
				new Edicy.ImgDropArea($(this)[0], {
					target_width: 800,
					change: function (data) {
						if (typeof data == "undefined") data = null;
						pageData.set(name, data);
						if (callback) callback(data);
					}
				});
			});
		}

		setImgDropAreas($('.js-hero-image-area'), updateHeroBg);

		function updateHeroBg(data) {
			if (data && data.url) {
				$('.js-header-bg').css('background-image', 'url(' + data.url + ')');
			} else {
				$('.js-header-bg').css('background-image', 'none');
			}
		}

		$('.js-block-toggle').on('change', function () {
			const key = $(this).attr('key');
			let value = $(this).is(':checked');
			if (typeof value === "undefined") value = null;
			pageData.set(key, value);
		});
		$('.js-block-bg').on('change', function () {
			const key = $(this).attr('key');
			let value = $(this).val();
			if (!value) value = null;
			pageData.set(key, value);
			const target = $(this).attr('target');
			if (target) {
				$('.' + target).css('background-color', value);
			}
		});
	}) (Edicy.jQuery);
</script>

{% endeditorjsblock %}
{% include "site-javascripts" %}

<script src=" https://cdn.jsdelivr.net/npm/punycode@2.3.1/punycode.min.js "></script>
{% if editmode %}
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
{% else %}
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.min.js"></script>
{% endif %}
<script src="https://cdn.jsdelivr.net/npm/vue-resource@1.5.1"></script>
<script src="https://unpkg.com/printd@1.0.1/printd.umd.min.js"></script>
<script>
  var domainSearch = new Vue({
    delimiters: ['${', '}'],
    el: '#app-dsearch',
    data: {
      WHOIS_HOST: '//rwhois.internet.ee/v1/',
      COUNT_HOST: '//data.internet.ee/',
      GEN_HOST: '//kiisu.eki.ee/',
      loadingDomain: false,
      queryString: '',
      status: '',
      statuses: [],
      signedLabel: '',
      signedStatus: false,
      showDNSKey: false,
      showDomainModal: false,
      showDomainInfo: false,
      showExtraDomainInfo: false,
      showDomainSuggestions: false,
      showHowToFirst: true,
      domain: [],
      message: '',
      messages: {
        registered: "{{ domain_registered_error }}",
        query: "{{ domain_query_error }}",
        validation: "{{ domain_validation_error }}",
        reserved: "{{ domain_reserved_error }}",
        deleted: "{{ domain_deleted_error }}",
        blocked: "{{ domain_blocked_error }}",
        disputed: "{{ domain_disputed_error }}",
        technical: "{{ domain_technical_error }}",
        auction: "{{ domain_auction_error }}",
        pending_registration: "{{ domain_pending_registration_error }}",
        fail: "{{ domain_query_fail }}"
      },
      isAvailable: false,
      loadingSuggestions: false,
      suggestions: [],
      printDate: moment(Date.now()).format('DD.MM.Y HH:mm'),
      cachedTitle: document.title
    },
    mounted: function () {
      // document.querySelector('.domain-info .btn').removeAttribute('style');
      // window.site.initAccordion();
    },
    methods: {
      print: function () {
        this.printDate = moment(Date.now()).format('DD.MM.Y HH:mm');
        document.title = this.domain.name;
        window.print();
      },

      showDomainMessage: function (type, name) {
        this.isAvailable = false;

        if (type === 500) {
          this.message = this.messages.fail;
        }
        if (type === 'query') {
          this.isAvailable = true;
          this.message = name + ' ' + this.messages.query;
        } else if (type === 'technical') {
          this.message = this.messages.technical;
        } else if (type === 'validation') {
          this.message = name + ' ' + this.messages.validation;
        } else if (Array.isArray(type) && type.includes('Reserved')) {
          this.message = name + ' ' + this.messages.reserved;
        } else if (Array.isArray(type) && type.includes('deleteCandidate')) {
          this.message = name + ' ' + this.messages.deleted;
        } else if (Array.isArray(type) && type.includes('Blocked')) {
          this.message = name + ' ' + this.messages.blocked;
        } else if (Array.isArray(type) && type.includes('AtAuction')) {
          this.message = name + ' ' + this.messages.auction;
        } else if (Array.isArray(type) && type.includes('PendingRegistration')) {
          this.message = name + ' ' + this.messages.pending_registration;
        } else if (Array.isArray(type) && type.includes('disputed')) {
          this.message = name + ' ' + this.messages.disputed;
        } else {
          this.message = name + ' ' + "{{ domain_registered_error }}";
        }
        if (Array.isArray(type) && type.some(function (item) {
          return ["ok (paid and in zone)",
            "expired",
            "serverHold",
            "serverRenewProhibited",
            "serverTransferProhibited",
            "serverRegistrantChangeProhibited",
            "serverAdminChangeProhibited",
            "serverTechChangeProhibited",
            "serverUpdateProhibited",
            "serverDeleteProhibited",
            "serverForceDelete",
            "pendingUpdate",
            "pendingDelete",
            "serverManualInzone",
            "Blocked",
            "Reserved",
            "inactive",
            "deleteCandidate",
            "serverObjUpdateProhibited",
            "serverExtensionUpdateProhibited",
            "serverReleaseProhibited"
          ].includes(item);
        })) {
          this.showDomainInfo = !(type.length === 1 && (type.includes('Blocked') || type.includes('Reserved')));
        } else {
          this.showDomainInfo = false;
        }
      },

      addMissingTld: function (query) {
        var domain,
          regex = new RegExp(/\.ee/);
        if (regex.exec(query) === null) {
          domain = query + '.ee';
        } else {
          domain = query;
        }
        return domain;
      },

      removeDomainEnding: function (query) {
        var domain,
          regex = new RegExp(/\.ee/);
        if (regex.exec(query) === null) {
          domain = query;
        } else {
          domain = query.replace(/\.[^/.]+$/, "");
        }
        return domain;
      },

      isValid: function (domain) {
        var pattern = /^[a-zA-Z0-9õöäüšž][a-zA-Z0-9õöäüšž-]{0,61}[a-zA-Z0-9õöäüšž](\.pri\.ee|\.com\.ee|\.fie\.ee|\.med\.ee|\.ee)$/;
        var regex = new RegExp(pattern);
        return !!(regex.exec(domain));
      },

      resetCaptcha: function () {
        grecaptcha.reset(window.captchaID);
      },

      updateQueryString: function (key, value) {
        var baseUrl = [location.protocol, '//', location.host, location.pathname].join(''),
          urlQueryString = document.location.search,
          newParam = key + '=' + value,
          params = '?' + newParam;
        if (urlQueryString) {
          var updateRegex = new RegExp('([\?&])' + key + '[^&]*');
          var removeRegex = new RegExp('([\?&])' + key + '=[^&;]+[&;]?');

          if (typeof value == 'undefined' || value == null || value == '') {
            params = urlQueryString.replace(removeRegex, "$1");
            params = params.replace(/[&;]$/, "");

          } else if (urlQueryString.match(updateRegex) !== null) {
            params = urlQueryString.replace(updateRegex, "$1" + newParam);

          } else {
            params = urlQueryString + '&' + newParam;
          }
        }
        params = params == '?' ? '' : params;
        window.history.replaceState({}, "", baseUrl + params);
      },

      addDomainLookupHandlers: function () {
        if (this.queryString.length > 1) {

          if (typeof window.ga === 'function') {

            var trackers = window.ga.getAll();
            var trackerName = trackers[0].get('name');
            
            window.ga(trackerName + '.send', {
              hitType: 'event',
              eventCategory: 'Button',
              eventAction: 'otsi',
              eventLabel: 'sinumimi'
            });
          }

          var domain = this.addMissingTld(this.queryString);
          if (domain === this.domain.name) {
            return false;
          }
          if (this.isValid(domain)) {
            this.statuses = [];
            this.updateQueryString('domain', this.queryString);
            this.loadingDomain = true;
            this.domain.name = domain;
            this.$http.get(this.WHOIS_HOST + punycode.toASCII(domain) + '.json').then(function (response) {
              try {
                this.domain = response.body;
                this.showExtraDomainInfo = false;
                if (this.domain.name) {
                  if (this.domain.hasOwnProperty('dnssec_keys')) {
                    this.signedStatus = !!this.domain.dnssec_keys.length;
                    this.signedLabel = this.domain.dnssec_keys.length ? window.translations.domains.dnssec_signed : window.translations.domains.dnssec_unsigned;
                  }

                  if (this.domain.hasOwnProperty('registered') && this.domain.registered) {
                    this.domain.registered = moment(this.domain.registered).format('DD.MM.Y HH:mm');
                  }
                  if (this.domain.hasOwnProperty('changed') && this.domain.changed) {
                    this.domain.changed = moment(this.domain.changed).format('DD.MM.Y HH:mm');
                  }
                  if (this.domain.hasOwnProperty('expire') && this.domain.expire) {
                    this.domain.expire = moment(this.domain.expire, 'Y-MM-DD').format('DD.MM.Y');
                  }
                  if (this.domain.hasOwnProperty('outzone') && this.domain.outzone) {
                    this.domain.outzone = moment(this.domain.outzone).format('DD.MM.Y');
                  }
                  if (this.domain.hasOwnProperty('delete') && this.domain.delete) {
                    this.domain.delete = moment(this.domain.delete).format('DD.MM.Y');
                  }
                  this.showDomainMessage(this.domain.status, domain);
                  this.domain.status.forEach(function (element, i) {
                    const status = window.translations.domainstatuses[element];
                    if (i === this.domain.status.length - 1) {
                      this.statuses.push(status);
                    } else {
                      this.statuses.push(status + ',');
                    }
                  }.bind(this));
                  this.showHowToFirst = false;
                  // document.querySelector('.page-domain-search').classList.remove('u-show-how-to-first');
                } else {
                  this.showDomainMessage('query', domain);
                  this.showHowToFirst = true;
                  // document.querySelector('.page-domain-search').classList.add('u-show-how-to-first');
                }
              } catch (err) {
                console.log(err);
                this.showDomainMessage('technical');
              }
              this.loadingDomain = false;
            }, function (response) {
              if (response.status === 404) {
                this.showDomainMessage('query', domain);
                this.showHowToFirst = true;
                // document.querySelector('.page-domain-search').classList.add('u-show-how-to-first');
              } else {
                this.showDomainMessage('technical');
                this.showHowToFirst = false;
                // document.querySelector('.page-domain-search').classList.remove('u-show-how-to-first');
              }
              this.loadingDomain = false;
            });
            // this.fetchDomainSuggestions();
          } else {
            this.showDomainMessage('validation', domain);
            this.loadingDomain = false;
            this.showDomainSuggestions = false;
          }
        } else {
          this.domain = [];
          this.showDomainInfo = false;
          this.loadingDomain = false;
          this.showDomainSuggestions = false;
          this.message = '';
        }
      },

      hideModal: function () {
        document.title = this.cachedTitle;
        $('body').removeClass('u-modal-open');
        $('.mdl.u-open').removeClass('u-open');
      },

      showDomainInfoModal: function () {
        if (this.domain) {
          this.showDomainModal = true;
          $('body').addClass('u-modal-open');
          $('.mdl--domain').addClass('u-open');
          this.resetCaptcha();
        }
      },

      fetchExtraDomainInfo: function () {
        var g_recaptcha_response = grecaptcha.getResponse(window.captchaID);
        if (g_recaptcha_response === "") {
          $('.g-recaptcha').addClass('error');
        } else {
          $('.g-recaptcha').removeClass('error');
          this.loadingDomain = true;
          this.$http.get(this.WHOIS_HOST + punycode.toASCII(this.domain.name.split(" ")[0]) + '.json?g-recaptcha-response=' + g_recaptcha_response).then(function (response) {
            var data = response.body;

            if (data) {
              this.domain = data;
              this.domain.registered = moment(this.domain.registered).format('DD.MM.Y HH:mm');
              this.domain.changed = moment(this.domain.changed).format('DD.MM.Y HH:mm');
              this.domain.expire = moment(this.domain.expire, 'Y-MM-DD').format('DD.MM.Y');
              if (this.domain.outzone) {
                this.domain.outzone = moment(this.domain.outzone).format('DD.MM.Y');
              }
              if (this.domain.delete) {
                this.domain.delete = moment(this.domain.delete).format('DD.MM.Y');
              }
            }
            if (!this.domain.registrar_website.match(/^[a-zA-Z]+:\/\//)) {
              this.domain.registrar_website = 'http://' + this.domain.registrar_website;
            }
            this.showExtraDomainInfo = true;
            this.showDomainInfoModal();
            this.loadingDomain = false;
          }, function (response) {
            this.loadingDomain = false;
          });
        }
      },

      chunkSuggestions: function (arr, size) {
        var index = 0;
        var arrayLength = arr.length;
        var tempArray = [];
        for (index = 0; index < arrayLength; index += size) {
          myChunk = arr.slice(index, index + size);
          tempArray.push(myChunk);
        }
        return tempArray;
      },

      fetchDomainSuggestions: function () {
        if (this.queryString.length > 1) {
          const domain = this.removeDomainEnding(this.queryString);
          this.loadingSuggestions = true;
          var suggestions = [];
          Promise.all([
            this.$http.get(this.GEN_HOST + 'm04?q=' + domain + '&min=2&max=64&gen=8&dia=on'),
            this.$http.get(this.GEN_HOST + 'm07?q=' + domain + '&min=2&max=64&gen=8&dia=on'),
            this.$http.get(this.GEN_HOST + 'm06?q=' + domain + '&min=2&max=64&gen=8&dia=on')
          ]).then(function (data) {
            suggestions = suggestions.concat(data[0].body, data[1].body, data[2].body);
            for (var i = suggestions.length - 1; i >= 0; i--) {
              suggestions[i] = suggestions[i].replace(/\s/g, '');
            }
            this.suggestions = this.chunkSuggestions(suggestions, Math.round(suggestions.length / 3));
            this.showDomainSuggestions = true;
            this.loadingSuggestions = false;
          }.bind(this));
        }
      },

      toggleDNSKey: function () {
        this.showDNSKey = !this.showDNSKey;
      }
    },
    created: function () {
      function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        const results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
      }

      if (getUrlParameter('domain')) {
        this.queryString = getUrlParameter('domain');
        this.addDomainLookupHandlers();
      }
    }
  });
</script>
{% include "footer-scripts" %}

<script src="{{ javascripts_path }}/martin.js"></script>
</body>
</html>