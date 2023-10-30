<!DOCTYPE html>
<!-- page__domain_search.tpl -->
<html class="domain-search-page common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  <script src="//www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
  <script type="text/javascript">
    var onloadCallback = function () {
      setTimeout(function () {
        window.captchaID = grecaptcha.render('domain-recaptcha', {
          'sitekey': '6Ld-ARETAAAAAPN1pcTy9oYsUrbKm9_c9VDMvl6X'
        });
        
      }, 500);
      
      
    };
  </script>
</head>
<body>
{% include "cookie-modal" %}
{% include "header" %}
<main id="app-domain-search" class="page-domain-search page-content" role="main">
  <article class="page--detail" data-search-indexing-allowed="false">
    <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
      <div class="u-container">
        <div class="domain-search">
          <form class="search-block" action="#" method="get" id="domain-search" @submit.prevent="addDomainLookupHandlers">
            <div class="form-item type-search">
              <input type="text" name="domain" class="inline-label" id="searchw" value=""
                     placeholder="{{ domain_search }}" autocomplete="off" v-model="queryString"
                     maxlength="63" minlength="1">
              <button class="btn btn--primary btn-submit" type="submit" title="{{ label_search }}" aria-label="{{ label_search }}">
                <i class="fas fa-arrow-right"></i>
                <i class="fas fa-spinner fa-spin"></i>
              </button>
            </div>
          </form>
        </div>
        <div class="domain-info">
          <h1 :class="[{ 'u-visible': message }]">${ message }</h1>
          <a style="display: none;" href="#" data-open-modal="domain" @click.prevent="showDomainInfoModal"
             :class="[{ 'u-visible': showDomainInfo }, 'btn', 'btn--default']">{{ click_here }}</a>
        </div>
      </div>
    </header>
    <transition name="fadeIn">
      <div class="suggestions-loader" v-show="loadingSuggestions && !showDomainSuggestions">
        <i class="fas fa-spinner fa-spin"></i>
      </div>
    </transition>
    <transition name="fadeIn">
      <article class="domain--suggestions" style="display: none" v-show="showDomainSuggestions">
        <div class="u-container">
          <div class="u-content-styles">
            {% contentblock name="domain_suggestions" publish_default_content="true" %}
              <h2>Siin on mõned domeeninime soovitused</h2>
              <p>Vali endale sobiv domeeninimi ja jätka registreerimist registripidaja juures.</p>
            {% endcontentblock %}
          </div>
        </div>
        <transition name="scale">
          <div class="domain--suggestions-list">
            <ul>
              <li v-for="suggestion in suggestions[0]" v-show="suggestion.length > 0">
                ${ suggestion }
              </li>
            </ul>
            <ul>
              <li v-for="suggestion in suggestions[1]" v-show="suggestion.length > 0">
                ${ suggestion }
              </li>
            </ul>
            <ul>
              <li v-for="suggestion in suggestions[2]" v-show="suggestion.length > 0">
                ${ suggestion }
              </li>
            </ul>
            <div class="suggestions-loader" v-show="loadingSuggestions && showDomainSuggestions">
              <i class="fas fa-spinner fa-spin"></i>
            </div>
          </div>
        </transition>
        <div class="domain--suggestions-actions" style="display: none;">
          <button type="button" class="btn btn--primary btn--large" @click.prevent="fetchDomainSuggestions"><i class="fas fa-sync-alt"></i><span>{{ label_regenerate }}</span></button>
        </div>
        <span class="spider-61x50"></span>
        <span class="fish-200x61"></span>
        <span class="fish-100x31"></span>
      </article>
    </transition>
    {% include 'steps-block' %}
    <div class="page--content" data-search-indexing-allowed="true">
      <div class="page--body">
        <div class="u-content-styles">
          {% content name="domain_search_content" %}
        </div>
        {% assign accordion_classes = "accordion--alt" %}
        {% include "accordion" %}
      </div>
    </div>
    <div class="mdl mdl--domain" data-modal="domain" id="printDomainData">
      <div class="mdl--container">
        <header class="mdl--header">
          <h2>${ domain.name }</h2>
          <a href="#" role="button" class="btn btn--print" @click.prevent="print"><i class="fas fa-print"></i></a>
          <a href="#" role="button" class="btn btn--close" @click.prevent="hideModal">
            <i class="fas fa-times"></i>
          </a>
        </header>
        <div class="mdl--content">
          <article class="domain--detail">
            <div class="domain--info">
              <table class="table">
                <tbody>
                <tr>
                  <th>{{ domain_status }}:</th>
                  <td class="status">
                    <span v-for="item in statuses">
                      ${ item }
                    </span>
                  </td>
                </tr>
                <tr v-if="domain.registration_deadline">
                  <th>{{ domain_registration_deadline }}:</th>
                  <td class="registration_deadline">${ domain.registration_deadline }</td>
                </tr>
                <tr v-if="domain.registered">
                  <th>{{ domain_registered_at }}:</th>
                  <td class="registered_at">${ domain.registered }</td>
                </tr>
                <tr v-if="domain.changed">
                  <th>{{ domain_changed_at }}:</th>
                  <td class="changed_at">${ domain.changed }</td>
                </tr>
                <tr v-if="domain.expire">
                  <th>{{ domain_expire }}:</th>
                  <td class="expire">${ domain.expire }</td>
                </tr>
                <tr v-if="domain.outzone">
                  <th>{{ domain_outzone }}:</th>
                  <td class="outzone">${ domain.outzone }</td>
                </tr>
                <tr v-if="domain.delete">
                  <th>{{ domain_delete }}:</th>
                  <td class="delete">${ domain.delete }</td>
                </tr>
                <tr v-if="domain.nameservers">
                  <th>{{ domain_nservers }}:</th>
                  <td class="nservers">
                    <template v-for="nameserver in domain.nameservers">
                      ${ nameserver }<br>
                    </template>
                  </td>
                </tr>
                <tr v-if="domain.dnssec_keys">
                  <th>{{ domain_dnssec }}:</th>
                  <td class="dnssec">
                    ${ signedLabel }
                    <a href="#" class="btn" @click.prevent="toggleDNSKey()" v-if="signedStatus">
                      <span v-if="!showDNSKey" class="u-open">{{ label_show_dns_keys }}</span>
                      <span v-if="showDNSKey" class="u-close">{{ label_hide_dns_keys }}</span>
                    </a>
                    <p class="u-word-break" v-if="showDNSKey">
                      <template v-for="key in domain.dnssec_keys">
                        ${ key }
                      </template>
                    </p>
                  </td>
                </tr>
                <tr v-if="domain.registrar" v-show="!showExtraDomainInfo">
                  <th>{{ domain_registrar }}:</th>
                  <td>
                    ${ domain.registrar }<br>
                    <a :href="domain.registrar_website">${ domain.registrar_website }</a>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <transition name="fadeIn">
              <div class="domain--extra-info" v-show="showExtraDomainInfo">
                <table class="table">
                  <tbody>
                  <tr>
                    <th>{{ domain_registrant }}:</th>
                    <td>
                      <template v-if="domain.registrant === 'Private Person'">
                        {{ label_private_person }}<br>
                      </template>
                      <template v-else>
                        ${ domain.registrant }<br>
                      </template>
                      <template v-if="domain.registrant_reg_no">
                        Reg nr: ${ domain.registrant_reg_no }<br>
                      </template>
                      <template v-if="domain.email != 'Not Disclosed'">
                        <a :href="'mailto:' + domain.email">${ domain.email }</a>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <th>{{ domain_admin_contact }}:</th>
                    <td>
                      <template v-for="contact in domain.admin_contacts">
                        <template v-if="contact.name != 'Not Disclosed'">
                          ${ contact.name }<br>
                        </template>
                        <template v-else>
                          {{ label_not_disclosed }}
                        </template>
                        <template v-if="contact.email != 'Not Disclosed'">
                          <a :href="'mailto:' + contact.email">${ contact.email }</a>
                        </template>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <th>{{ domain_tech_contact }}:</th>
                    <td>
                      <template v-for="contact in domain.tech_contacts">
                        <template v-if="contact.name != 'Not Disclosed'">
                          ${ contact.name }<br>
                        </template>
                        <template v-else>
                          {{ label_not_disclosed }}
                        </template>
                        <template v-if="contact.email != 'Not Disclosed'">
                          <a :href="'mailto:' + contact.email">${ contact.email }</a>
                        </template>
                      </template>
                    </td>
                  </tr>
                  <tr>
                    <th>{{ domain_registrar }}:</th>
                    <td>
                      ${ domain.registrar }<br>
                      <a :href="domain.registrar_website">${ domain.registrar_website }</a>
                    </td>
                  </tr>
                  </tbody>
                </table>
                <div class="domain--extra-actions" v-if="domain.registrant === 'Private Person'">
                  <a :href="'https://rwhois.internet.ee/contact_requests/new?domain_name='+ domain.name + '&locale={{ page.language_code }}'" class="btn btn--default" target="_blank">{{ label_contact_registrant }}</a>
                </div>
              </div>
            </transition>
            <transition name="fadeIn">
              <div class="domain--extra-info" v-show="!showExtraDomainInfo">
                <div class="domain--registrant" v-show="!pendingRegistrationStatus">
                  <div class="registrant-type">
                    <img v-if="domain.registrant_kind === 'org'" src="{{ assets_path }}/business.svg" alt="">
                    <img v-if="domain.registrant === 'Private Person'" src="{{ assets_path }}/private-person.svg" alt="">
                  </div>
                  <h3>{{ domain_registrant }}</h3>
                  <p v-if="domain.registrant === 'Private Person'">
                    <strong>{{ label_private_person }}</strong>
                  </p>
                  <p v-else>
                    <strong>${ domain.registrant }</strong>
                  </p>
                  <p v-if="domain.registrant_reg_no">
                    Reg nr: ${ domain.registrant_reg_no } (${ domain.registrant_ident_country_code })
                  </p>
                  <div id="domain-recaptcha" class="g-recaptcha"></div>
                  <button class="btn btn--primary"
                          @click="fetchExtraDomainInfo">{{ show_more }}</button>
                </div>
              </div>
            </transition>
            <p class="print-date">${ printDate }</p>
          </article>
        </div>
        <footer class="mdl--footer">
          {% content name="domain-info" %}
        </footer>
      </div>
    </div>
  </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
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
    el: '#app-domain-search',
    data: {
      WHOIS_HOST: '//rwhois.internet.ee/v1/',
      COUNT_HOST: '//data.internet.ee/',
      GEN_HOST: '//kiisu.eki.ee/',
      loadingDomain: false,
      queryString: '',
      status: '',
      statuses : [],
      signedLabel: '',
      signedStatus: false,
      showDNSKey: false,
      showDomainModal: false,
      showDomainInfo: false,
      showExtraDomainInfo: false,
      showDomainSuggestions: false,
      showHowToFirst: true,
      pendingRegistrationStatus: false,
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
      loadingSuggestions: false,
      suggestions: [],
      printDate: moment(Date.now()).format('DD.MM.Y HH:mm'),
      cachedTitle: document.title
    },
    mounted: function () {
      document.querySelector('.domain-info .btn').removeAttribute('style');
      window.site.initAccordion();
    },
    methods: {
      print: function() {
        this.printDate = moment(Date.now()).format('DD.MM.Y HH:mm');
        document.title = this.domain.name;
        window.print();
      },

      showDomainMessage: function (type, name) {
        if (type === 500) {
            this.message = this.messages.fail;
        }
        if (type === 'query') {
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
        }  else {
          this.message = name + ' ' + "{{ domain_registered_error }}";
        }
        if (Array.isArray(type) && type.some(function(item) {
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
            "PendingRegistration",
            "serverManualInzone",
            "serverObjUpdateProhibited",
            "serverExtensionUpdateProhibited",
            "Blocked",
            "Reserved",
            "inactive",
            "deleteCandidate",
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
        var pattern = /^[a-zA-Z0-9õöäüšž-]{0,61}[a-zA-Z0-9õöäüšž](\.pri\.ee|\.com\.ee|\.fie\.ee|\.med\.ee|\.ee)$/;
        var regex = new RegExp(pattern);
        return !!(regex.exec(domain));
      },
      
      resetCaptcha: function () {
        grecaptcha.reset(window.captchaID);
        setTimeout(function () {
          console.log($("body > div").last().addClass("newChallengeBox"));
        }, 1000);
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
        if (this.queryString.length > 0) {
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
                if (this.domain.status.includes('PendingRegistration')) {
                  this.pendingRegistrationStatus = true;
                } else {
                  this.pendingRegistrationStatus = false;
                }
                if (this.domain.name) {
                  if (this.domain.hasOwnProperty('dnssec_keys') && this.domain.dnssec_keys != null) {
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
                  if (this.domain.hasOwnProperty('registration_deadline') && this.domain.registration_deadline) {
                    this.domain.registration_deadline = moment(this.domain.registration_deadline).format('DD.MM.Y HH:mm');
                  }
                  this.showDomainMessage(this.domain.status, domain);
                  this.domain.status.forEach(function(element,i) {
                    const status = window.translations.domainstatuses[element];
                    if (i === this.domain.status.length - 1) {
                      this.statuses.push(status);
                    } else {
                      this.statuses.push(status + ',');
                    }
                  }.bind(this));
                  this.showHowToFirst = false;
                  document.querySelector('.page-domain-search').classList.remove('u-show-how-to-first');
                } else {
                  this.showDomainMessage('query', domain);
                  this.showHowToFirst = true;
                  document.querySelector('.page-domain-search').classList.add('u-show-how-to-first');
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
                document.querySelector('.page-domain-search').classList.add('u-show-how-to-first');
              } else {
                this.showDomainMessage('technical');
                this.showHowToFirst = false;
                document.querySelector('.page-domain-search').classList.remove('u-show-how-to-first');
              }
              this.loadingDomain = false;
            });
            this.fetchDomainSuggestions();
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
<style>
@media screen and (max-width: 768px) {
  .newChallengeBox {
    left: 0 !important;
  }
}
</style>
</body>
</html>