{% if editmode %}
<button style="position: fixed !important; top: unset !important; bottom: 96px !important; left: 5% !important; z-index: 10001"
        class="js-cookie-settings-btn">Cookie Settings
</button>
{% endif %}
<div class="c-cookie-modal js-cookie-consent is-hidden">
    <button class="c-cookie-modal__close js-close-cookie-consent">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
            <path d="M16.0158 2.67188C8.65487 2.66748 2.68408 8.63111 2.67969 15.992C2.6753 23.3529 8.63892 29.3237 15.9998 29.3281C19.5362 29.3339 22.9292 27.9305 25.4282 25.4284C27.9282 22.9305 29.3338 19.542 29.3359 16.008C29.3403 8.64706 23.3767 2.67627 16.0158 2.67188ZM16.0162 27.9948C9.3916 27.9993 4.01774 22.6327 4.01319 16.0081C4.00871 9.38363 9.37533 4.00969 15.9998 4.00521C19.1826 3.99951 22.2364 5.26237 24.4855 7.51433C26.7354 9.76213 28.0007 12.8114 28.0028 15.9919C28.0073 22.6164 22.6407 27.9902 16.0162 27.9948ZM16.9425 16L21.1847 11.7578C21.4387 11.4986 21.4387 11.0838 21.1847 10.8246C20.927 10.5617 20.505 10.5575 20.242 10.8151L15.9998 15.0573L11.7577 10.8152C11.4985 10.5612 11.0837 10.5612 10.8245 10.8152C10.5615 11.0728 10.5573 11.4949 10.8149 11.7578L15.0571 16L10.8149 20.2422C10.6899 20.3672 10.6198 20.5367 10.6197 20.7135C10.6197 21.0816 10.9181 21.3801 11.2863 21.3802C11.4631 21.3805 11.6328 21.3101 11.7577 21.1849L15.9998 16.9427L20.242 21.1849C20.3669 21.3101 20.5365 21.3805 20.7134 21.3802C20.8901 21.3801 21.0596 21.31 21.1846 21.1851C21.445 20.9247 21.445 20.5026 21.1847 20.2422L16.9425 16Z"
                  fill="#A7A8AA"/>
        </svg>
    </button>

    <div class="c-cookie-modal__title">
        {% xcontent name="cookie-consent-title" placeholder="Cookie policy" single="plaintext" %}
    </div>

    <div class="c-cookie-modal__desc">
        {% xcontent name="cookie-consent-desc" placeholder="Cookie policy" %}
    </div>

    <div class="c-cookie-modal__more_options js-cookie-consent-manage-options {% unless editmode == false %}is-open{% endunless %}">
        <div class="c-cookie-modal__more_options__row">
            <div class="c-cookie-modal__more_options__info">
                <div class="c-cookie-modal__more_options__title">
                    {% xcontent name="cookie-consent-group-title-1" single="plaintext" placeholder="Essential cookies" %}
                </div>
                <div class="c-cookie-modal__more_options__group">
                    <div class="c-cookie-modal__more_options__desc">
                        {% xcontent name="cookie-consent-group-desc-1" %}
                    </div>
                    <div class="c-cookie-modal__more_options__action">
                        {% xcontent name="cookie-consent-group-action-1" %}
                    </div>
                </div>
            </div>
        </div>
        <div class="c-cookie-modal__more_options__row">
            <div class="c-cookie-modal__more_options__info">
                <div class="c-cookie-modal__more_options__title">
                    {% xcontent name="cookie-consent-group-title-2" single="plaintext" placeholder="Analytics cookies" %}
                </div>
                <div class="c-cookie-modal__more_options__group">
                    <div class="c-cookie-modal__more_options__desc">
                        {% xcontent name="cookie-consent-group-desc-2" %}
                    </div>
                    <div class="c-cookie-modal__more_options__action">
                        <label class="o-checkbox" for="analytics-eis">
                            <input class="js-anl-cookie-inp" checked="" type="checkbox" id="analytics-eis">
                            <div class="o-checkbox__slider round"></div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="c-cookie-modal__more_options__row">
            <div class="c-cookie-modal__more_options__info">
                <div class="c-cookie-modal__more_options__title">
                    {% xcontent name="cookie-consent-group-title-3" single="plaintext" placeholder="Advertising cookies" %}
                </div>
                <div class="c-cookie-modal__more_options__group">
                    <div class="c-cookie-modal__more_options__desc">
                        {% xcontent name="cookie-consent-group-desc-3" %}
                    </div>
                    <div class="c-cookie-modal__more_options__action">
                        <label class="o-checkbox" for="ads-eis">
                            <input class="js-ads-cookie-inp" checked="" type="checkbox" id="ads-eis">
                            <div class="o-checkbox__slider round"></div>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="c-cookie-modal__actions">
        <button class="c-cookie-modal__btn c-cookie-modal__btn--ghost js-cookie-consent-accept">
            {% xcontent name="cookie-consent-accept-text" placeholder="Accept all" single="plaintext" %}
        </button>
        <button class="c-cookie-modal__btn c-cookie-modal__btn--ghost js-cookie-consent-manage">
            {% xcontent name="cookie-consent-accept-manage" placeholder="Manage" single="plaintext" %}
        </button>
        <button class="c-cookie-modal__btn c-cookie-modal__btn--highlighted js-cookie-consent-apply {% unless editmode %}is-hidden{% endunless %}">
            {% xcontent name="cookie-consent-accept-apply" placeholder="Save and Apply" single="plaintext" %}
        </button>
    </div>
</div>
<div class="c-cookie-modal-bg js-cookie-consent-overlay is-hidden"></div>

<script>
    function getCookie(cName) {
        const name = cName + "=";
        const cDecoded = decodeURIComponent(document.cookie); //to be careful
        const cArr = cDecoded.split('; ');
        let res;
        cArr.forEach(val => {
            if (val.indexOf(name) === 0) res = val.substring(name.length);
        })
        return res
    }

    document.addEventListener('DOMContentLoaded', function () {
        const isEditMode = {{editmode}}
        const cookieCloseBtn = document.querySelector('.js-close-cookie-consent')
        const cookieModal = document.querySelector('.js-cookie-consent')
        const cookieOverlay = document.querySelector('.js-cookie-consent-overlay')
        const cookieAcceptBtn = document.querySelector('.js-cookie-consent-accept')
        const cookieManageBtn = document.querySelector('.js-cookie-consent-manage')
        const cookieApplyBtn = document.querySelector('.js-cookie-consent-apply')
        const cookieManageOptions = document.querySelector('.js-cookie-consent-manage-options')
        const cookieAnlInp = document.querySelector('.js-anl-cookie-inp')
        const cookieAdsInp = document.querySelector('.js-ads-cookie-inp')
        let cookieSettings = {}
        {% if site.data.cookie_settings %}
        cookieSettings = {{ site.data.cookie_settings | json }}
        {% endif %}

    cookieCloseBtn.addEventListener('click', closeCookieModal)

    function closeCookieModal() {
        cookieModal.classList.add('is-hidden')
        cookieOverlay.classList.add('is-hidden')
    }

    function openCookieModal() {
        if (isEditMode) return null

        cookieModal.classList.remove('is-hidden')
        cookieOverlay.classList.remove('is-hidden')
    }

    function openManageCookie() {
        cookieManageOptions.classList.add('is-open')
        cookieApplyBtn.classList.remove('is-hidden')
        cookieManageBtn.classList.add('is-hidden')
    }

    if (!isEditMode) {
        cookieManageBtn.addEventListener('click', openManageCookie)
    }

    function createEISCookies() {
        if (isEditMode) return null

        const adsCookie = cookieAdsInp.checked
        const anlCookie = cookieAnlInp.checked
        const dateExpCookie = new Date(new Date().setFullYear(new Date().getFullYear() + 1))

        setEISCookies(adsCookie, anlCookie, dateExpCookie)

        closeCookieModal()
    }

    function acceptAllCookies() {
        if (isEditMode) return null

        const dateExpCookie = new Date(new Date().setFullYear(new Date().getFullYear() + 1))
        setEISCookies(true, true, dateExpCookie)
        closeCookieModal()
    }

    function setEISCookies(adsCookie, anlCookie, dateExpCookie) {
        if (isEditMode) return null

        document.cookie = `eis_general=true; expires=${dateExpCookie}; path=/`
        document.cookie = `eis_ads=${adsCookie}; expires=${dateExpCookie}; path=/`
        document.cookie = `eis_analytics=${anlCookie}; expires=${dateExpCookie}; path=/`
    }

    cookieAcceptBtn.addEventListener('click', acceptAllCookies)
    cookieApplyBtn.addEventListener('click', createEISCookies)

    const eisCookies = document.cookie;
    if (!eisCookies.includes('eis_general') && !isEditMode && cookieSettings && cookieSettings.enable_cookie && !document.querySelector('html.sisuleht-template-cookie')) {
        openCookieModal()
    }

    if (document.querySelector(".c-footer a[href='#cookie-settings']")) {
        document.querySelector(".c-footer a[href='#cookie-settings']")
            .addEventListener('click', function () {

                    openCookieModal()
                    if (getCookie('eis_analytics') !== "true") {
                        cookieAdsInp.checked = false
                    }
                    if (getCookie('eis_ads') !== "true") {
                        cookieAnlInp.checked = false
                    }
                }
            )
    }

    })
</script>

<script>
    if (getCookie('eis_analytics') !== "true") {
        window['ga-disable-UA-XXXXXX-Y'] = true;
    }
</script>

{% editorjsblock %}
<!-- Settings popover javascript. -->
<script
        src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"
></script>


<!-- Setings popover initiation. -->
<script>
    var siteData = new Edicy.CustomData({
        type: 'site'
    });

    {% if site.data.cookie_settings %}
    cookieSettings = {{ site.data.cookie_settings | json }}
    {% else %}
    cookieSettings = {}
    {% endif %}

    var settingsBtn = document.querySelector('.js-cookie-settings-btn');

    var cookieSettingsEdit = new Edicy.SettingsEditor(settingsBtn, {
        menuItems: [
            {
                "title": "Enable Cookie Modal",
                "type": "toggle",
                "key": "enable_cookie",
                "states": {
                    "off": false,
                    "on": true
                }
            },
            {
                "title": "Edit Modal",
                "type": "toggle",
                "key": "edit_mode_cookie",
                "states": {
                    "off": false,
                    "on": true
                }
            }
        ],
        values: cookieSettings,

        preview: function (data) {
            const cookieModal = document.querySelector('.js-cookie-consent')
            const cookieOverlay = document.querySelector('.js-cookie-consent-overlay')
            const dataObj = Object.keys(data)
            if (dataObj.indexOf('edit_mode_cookie') && data.edit_mode_cookie == true) {
                cookieModal.classList.remove('is-hidden')
                cookieOverlay.classList.remove('is-hidden')
            } else {
                cookieModal.classList.add('is-hidden')
                cookieOverlay.classList.add('is-hidden')
            }
        },
        preview: function (data) {
            const cookieModal = document.querySelector('.js-cookie-consent')
            const cookieOverlay = document.querySelector('.js-cookie-consent-overlay')
            const dataObj = Object.keys(data)
            if (dataObj.indexOf('edit_mode_cookie') && data.edit_mode_cookie == true) {
                cookieModal.classList.remove('is-hidden')
                cookieOverlay.classList.remove('is-hidden')
            } else {
                cookieModal.classList.add('is-hidden')
                cookieOverlay.classList.add('is-hidden')
            }
        },
        commit: function (data) {
            const newDataObj = {enable_cookie: data.enable_cookie, edit_mode_cookie: false}
                siteData.set('cookie_settings', newDataObj);
        }
    });
    
</script>
{% endeditorjsblock %}