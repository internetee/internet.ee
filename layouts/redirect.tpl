<!DOCTYPE html>
<!-- redirect.tpl -->
<html class="common-page {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}" data-search-indexing-allowed="false">
<head prefix="og: http://ogp.me/ns#">
    {% if editmode %}{% include "html-head" %}{% endif %}

    {% if page.data.redirect_url.size > 0 %}
        {% capture redirect_url %}{{ page.data.redirect_url }}{% endcapture %}
    {% else %}
        {% capture redirect_url %}{% for item in site.menuitems_with_hidden %}{% if item.selected? and item.children_with_hidden %}{{ item.children.first.url }}{% endif %}{% endfor %}{% endcapture %}
    {% endif %}

    {% unless editmode %}
        <meta http-equiv="REFRESH" content="0;url={{ redirect_url }}" />
    {% endunless %}
</head>

<body>
{% include "cookie-modal" %}
{% if editmode %}
{% include "header" %}
<main class="page-content" role="main">
    <article class="page--detail">
        <header class="page--header" {% if page.image? %}style="background-image: url({{ page.image.schemeless_url }})"{% endif %}>
            <div class="u-container">
                <h1>{{ page.title }}</h1>
                {% if page.description != "" %}
                    <p>{{ page.description }}</p>
                {% endif %}
            </div>
        </header>
        <div class="page--content">
            <div class="page--body">
                <div class="u-content-styles">
                    <h1>See leht on seadistatud mujale suunama.</h1>
                    <p>Alloleva tekstivälja väärtus on suunatud lehe aadress. Kui väli jätta tühjaks, suunatakse käesoleva lehe esimesele alamlehele.</p>
                    <label for="page_redirect_url">Aadress: </label>
                    <input type="text" id="page_redirect_url" value="{{ page.data.redirect_url }}">
                </div>
            </div>
        </div>
    </article>
</main>
{% include "footer" %}
{% include "site-javascripts" %}
    {% editorjsblock %}
    <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
    <script type="text/javascript">
        var pageData = new Edicy.CustomData({
            type: 'page',
            id: '{{ page.id }}'
        });
        $('body').on('change', 'input#page_redirect_url', function(event) {
            var value = $(event.target).val();
            if (value.length > 0 && value[0] !== "/") {
                value = "/" + value;
            }
            pageData.set({
                    "redirect_url": value,
                },{
                    success: function(data) {
                        $("input#page_redirect_url").val(data.redirect_url);
                    }
                }
            );

        });
        $('body').on('keyup', 'input#page_redirect_url', function(event) {
            if (event.keycode == 13) {// enter
                event.preventDefault();
                this.blur();
            }
        });
    </script>
    {% endeditorjsblock %}
{% endif %}
</body>
</html>
