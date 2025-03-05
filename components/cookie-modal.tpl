{% unless previewmode or editmode %}

<div class="noteBar_container js-cookieNote" style="display: none;">

  <div class="noteBar">

    <div class="noteBar_row">

      <div class="noteBar_bodyCell">

        {% elementscontext  edicy_model="cookienote" %}

          {% for element in elements limit: 1 %}

            {{ element.content }}

          {% endfor %}

        {% endelementscontext %}

      </div>

      <div class="noteBar_buttonCell">

        <button type="button" class="noteBar_button" data-note-close>

          {{ label_close }}

        </button>

      </div>

    </div>

  </div>

</div>

{% endunless %}





