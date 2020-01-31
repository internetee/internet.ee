<nav class="anchor-block">
	<ul>
  {% for accordion in elements %} 
	  {% if accordion.model_name == "accordion" %} {% assign anchor = accordion.url | split: "/" | last %}
	  	<li class="anchor-block__item">
	  		<span class="anchor-block__item__count">{{ accordion.count }}</span>
	    	<a href="#{{ anchor }}" data-accordion-item="#{{ anchor }}">{{ accordion.title }}</a>
	  	</li>
	  {% endif %} 
  {% endfor %}
  </ul>
</nav>
