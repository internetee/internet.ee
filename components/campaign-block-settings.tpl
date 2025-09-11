{% if page.data[displayKey] or page.data[displayKey] == null %}
{% assign displayBlock = true %}
{% endif %}
{% if blockBgColor == null or blockBgColor == '' %}
{% assign blockBgColor = '#eeedf6' %}
{% endif %}
{% if page.data[blockBgKey] %}
{% assign blockBgColor = page.data[blockBgKey] %}
{% endif %}
{% if editmode %}
	<div class="c-block-settings">
		<div class="c-block-settings-content px-10 py-10">
			<div class="">
				<label>Näita plokki</label>
				<div><input type="checkbox" {% if displayBlock %} checked {% endif %} class="js-block-toggle" key="{{displayKey}}"
						value="{{ page.data[displayKey] }}" /></div>
			</div>
			<div>
				<label>Taust</label>
				<div><input type="color" class="js-block-bg" key="{{blockBgKey}}" value="{{ blockBgColor }}" target="{{ blockTarget }}" />
				</div>
			</div>
		</div>
	</div>
{% endif %}
