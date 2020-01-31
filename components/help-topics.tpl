<div class="help-topics">
   
    {% if editmode %}
        {% addbutton element_type="help_topic" %}
    {% endif %}
    <div class="help-topics__list">
            {% for help_topic in elements %}
               {% if help_topic.model_name == "help_topic" %}
                {% if editmode %}
           <p>
           <strong>{{icon}}:</strong>
           {% editable help_topic.icon single="plaintext" %}
           <small>{{available_icons}}: <a href="https://fontawesome.com/icons">https://fontawesome.com/icons</a></small>
           </p>
           <br>
           <p>
             <strong>Link:</strong>
             {% editable help_topic.link single="plaintext" %}
           </p>
           
            {% endif %}
        <div class="help-topics__item">
            <span class="fa {{help_topic.icon | strip_html}}"></span>
            <div class="help-topics__item__body">
             <a href="{{help_topic.link | strip_html}}"><h2>{% editable help_topic.title %}</h2></a>
              <p>{% editable help_topic.content %}</p>
            </div>
        </div>
           {% endif %}
            {% endfor %}

    </div>
    
    </div>