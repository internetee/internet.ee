<div class="accordion {{accordion_classes}}">
  {% if editmode %}
    {% addbutton element_type="accordion" %}
  {% endif %}
  {% for accordion in elements %}
    {% if accordion.model_name == "accordion" %}
      {% assign anchor = accordion.url | split: "/" | last %}
      <div class="accordion__item" id="{{ anchor }}">
        <div class="accordion__item__head">
          <h2>
            <{% if editmode %}span{% else %}a href="#{{ anchor }}"{% endif %} class="title" data-accordion-item="#{{ anchor }}">
              <span class="count">{% editable accordion.count %}</span>
              <span class="label">{% editable accordion.title %}</span>
            </{% if editmode %}span{% else %}a{% endif %}>
          </h2>
          {% if accordion.subtitle != '' or editmode %}
          <div class="accordion__item__summary">
            <p>{% editable accordion.subtitle %}</p>
          </div>
          {% endif %}
        </div>
        <div class="accordion__item__body u-content-styles">
          {% editable accordion.content %}
        </div>
      </div>
    {% endif %}
  {% endfor %}
  {% if editmode %}
      {% addbutton element_type="accordion" %}
  {% endif %}
</div>