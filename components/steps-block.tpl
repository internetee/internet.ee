<div class="steps-block"> 
  {% if editmode %}
      {% addbutton element_type="Step" %}
  {% endif %}
    {% if noTitle %}
        <h2>{% content name="steps_title" single="plaintext" placeholder="Steps block title" %}</h2>
    {% endif %}
    
  <div class="steps-block__list">
    {% for step in elements %}
      {% if step.model_name == "step" %}
        <div class="steps-block__item">
           {% if editmode %}
           <p>
             <strong>{{icon}}:</strong>
             {% editable step.icon single="plaintext" %}
             <small>{{available_icons}}: <a href="https://fontawesome.com/icons">https://fontawesome.com/icons</a></small>
           </p>
            {% endif %}
            <span class="fa {{step.icon | strip_html}}"></span>
            <h3>{% editable step.title %}</h3>
            <div class="steps-block__item__text">
                {% editable step.content %}
            </div>
        </div>
      {% endif %}
    {% endfor %}
  </div>
</div>