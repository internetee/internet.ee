<article class="article article--teaser">
    <a href="{{ item.url }}" class="article--image{% unless item.image %} u-has-placeholder{% endunless %}">
        {% if item.image %}
            <img src="{{ item.image.for-width-1024.schemeless_url }}" alt="{{ item.title }}">
        {% else %}
            <!-- We know that there is invalid HTML in this image -->
        {% endif %}
    </a>
    <div class="article--content">
        <header>
            {% if item.data.type or item.data.topic %}
                <div class="article--data">
                    {% assign articleType = item.data.type | strip %}
                    {% assign articleTopic = item.data.topic | strip %}
                    {% if articleType != '' %}
                        <p class="item article--type">{{ item.data.type }}</p>
                    {% endif %}
                    {% if articleTopic != '' %}
                        <p class="item article--topic">{{ item.data.topic }}</p>
                    {% endif %}
                </div>
            {% endif %}
            <h3><a href="{{ item.url }}">{{ item.title }}</a></h3>
        </header>
        <p>{{ item.excerpt }}</p>
        <footer>
            <p class="article--date"><i class="fas fa-pencil-alt"></i>{{ item.created_at | date: "%d.%m.%y" }}</p>
            <p class="article--author">{{ item.author.name }}</p>
        </footer>
    </div>
</article>