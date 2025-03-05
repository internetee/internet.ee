<div class="doc-groups">
{% if editmode %}
{% if article.language_code == 'et' %}
{% assign documents_page = 'dokumendid' %}
{% endif %}
{% if article.language_code == 'en' %}
{% assign documents_page = 'documents' %}
{% endif %}
{% if article.language_code == 'ru' %}
{% assign documents_page = 'documents' %}
{% endif %}
    <template id="repeater-template">
<div class="c-document-selector">
<input class="js-title-repeater-field repeater-field-title" placeholder="Title..." />
    <div class="c-document-selector__main">
    <select multiple="multiple" class="js-select-documents" name="documents-list">
            {% elementscontext edicy_model="document" %}
            {% assign current_docs = article.data.documents | size %}
            {% for element in elements %}
            {% assign has_printed = 0 %}
            {% if current_docs > 0 %}
                {% for project in article.data.documents %}
                        {% assign project_id = project | to_num %}
                        {% assign element_id = element.id | to_num %}
                
                        {% if project_id == element_id %}
                            <option selected="selected" value='{{element.id}}'>{{element.title}}</option>
            {% assign has_printed = has_printed | plus: 100 %}
                        {% endif %}
                    {% assign has_printed = has_printed | plus: 1 %}
                    {% if has_printed == current_docs %}
                    <option value='{{element.id}}'>{{element.title}}</option>
                    {% endif %}
                {% endfor %}
            {% else %}
            <option id="item-{{element.id}}" value='{{element.id}}'>{{element.title}}</option>
            {% endif %}
            {% endfor %}

            {% endelementscontext %}
        </select>
    </div>
    <button class="remove-btn edy-cbtn"><span><span class="edy-cbtn-content">
    <span>Remove document group</span></span></span></button>
</div>
</template>
<div id="repeater-container">
{% assign docs_count = article.data.documents | size %}
    {% if docs_count > 0 %}
    {% for document_group in article.data.documents %}
        <div class="c-document-selector">
<input value="{{document_group.title}}" class="js-title-repeater-field repeater-field-title" placeholder="Title..." />
    <div class="c-document-selector__main">
    <select multiple="multiple" class="js-select-documents" name="documents-list">
            {% elementscontext edicy_model="document" %}
            {% assign current_docs = document_group.docs | size %}
            {% for element in elements %}
            {% assign has_printed = 0 %}
            {% if current_docs > 0 %}
                {% for doc in document_group.docs %}
                        {% assign project_id = doc | to_num %}
                        {% assign element_id = element.id | to_num %}
                        
                        {% if project_id == element_id %}
                            <option selected="selected" value='{{element.id}}'>{{element.title}}</option>
                            {% assign has_printed = has_printed | plus: 100 %}
                        {% endif %}
                    {% assign has_printed = has_printed | plus: 1 %}
                    {% if has_printed == current_docs %}
                    <option value='{{element.id}}'>{{element.title}}</option>
                    {% endif %}
                {% endfor %}
            {% else %}
            <option id="item-{{element.id}}" value='{{element.id}}'>{{element.title}}</option>
            {% endif %}
            {% endfor %}

            {% endelementscontext %}
        </select>
    </div>
    <button class="remove-btn edy-cbtn"><span><span class="edy-cbtn-content">
    <span>Remove document group</span></span></span></button>
</div>
    {% endfor %}
    {% endif %}
</div>
<button class="c-btn--orange c-btn--ghost" id="add-more">Add Document Group</button>

<button style="min-width:100px; margin-top: 2rem; font-size: 18px; padding: 12px 30px;" class="c-btn c-btn--blue js-save-repeaters">Save</button>

            <div class="c-documents">
        
            
            {% for selected_proj in article.data.documents %}
            {% assign selected_projects = "" %}
            
            {% for doc in selected_proj.docs %}
            
            {% if forloop.last %}
                {% assign selected_projects = selected_projects | append: doc %}
                {% assign title_projects = selected_proj.title %}
            {% else %}
                {% assign selected_proj_with_comma = doc | append: "," %}
                {% assign selected_projects = selected_projects | append: selected_proj_with_comma %}
            {% endif %}
        {% endfor %}
            {% if selected_projects != "" %}
            <div class="c-documents__group">
            <div class="u-content-styles">
                <h2>{{title_projects}}</h2>
            </div>
            <div class="c-documents__grid">
            {% elementscontext q.element.id.$in=selected_projects %}
                {% for document in elements %}
                    <div class="c-document">
                        <a href="{{ document.file }}" class="c-document__link" aria-label="{{ document.title }}"></a>
                        <div class="c-document__header">
                            <div class="c-document__icon">
                                <i class="fas fa-file-pdf"></i>
                            </div>
                            <div class="c-document__header__info">
                                <div class="c-document__title">{{ document.title }}</div>
                                <div class="c-document__meta">
                                    pdf, {{ document.filesize }}
                                </div>
                            </div>
                        </div>
                        <div class="c-document__desc">
                            {{ document.description }}
                        </div>

                    </div>
                {% endfor %}
            {% endelementscontext %}
            </div>
            </div>
        {% endif %}
        {% endfor %}
            
    
    </div>
    </div>

{% endif %}

{% editorjsblock %}
<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
<script src="{{ javascripts_path }}/multi.min.js"></script>
<script src="{{ javascripts_path }}/repeater.js"></script>
<script>
    
    var pageData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });

      if(document.querySelector('.js-select-documents')) {
        document.querySelectorAll('.js-select-documents').forEach(function(selectDocInput) {
            $(selectDocInput).multi();
        })

        document.querySelectorAll('.c-document-selector').forEach(function(docGroup) {
          docGroup.querySelector(".remove-btn").addEventListener("click", function () {
            docGroup.remove();
        });  
        })
      }


    document.addEventListener("DOMContentLoaded", function () {
    const repeaterContainer = document.getElementById("repeater-container");
    const addMoreButton = document.getElementById("add-more");
    const template = document.getElementById('repeater-template');

    // Function to add a new repeater item
    function addRepeaterItem() {
        const clone = document.importNode(template.content, true);
    
            // Append the clone to the repeater container
        repeaterContainer.appendChild(clone);
    
        const lastAddedRepeater = repeaterContainer.lastElementChild;
        $(lastAddedRepeater).find('.js-select-documents').multi();

         // Add remove functionality to the new "Remove" button inside the clone
         lastAddedRepeater.querySelector(".remove-btn").addEventListener("click", function () {
            lastAddedRepeater.remove();
        });
    }
    // Add new item when "Add More" is clicked
    addMoreButton.addEventListener("click", addRepeaterItem);


        // Function to collect data from each .c-document-selector element
        function collectDocumentData() {
            // Array to store the final structured data
            const data = [];
    
            // Select all document selector groups
            const documentSelectors = document.querySelectorAll('.c-document-selector');
    
            // Loop through each document selector group
            documentSelectors.forEach(function(selector) {
                // Get the title from the input field
                const title = selector.querySelector('.js-title-repeater-field').value;
    
                // Get the selected options from the multi-select
                const selectedDocs = [];
                const selectElement = selector.querySelector('.js-select-documents');
                const selectedOptions = selectElement.querySelectorAll('option:checked');
    
                selectedOptions.forEach(function(option) {
                    selectedDocs.push(option.value);  // Collect the value of each selected option
                });
    
                // Add the structured data to the array
                data.push({
                    title: title,
                    docs: selectedDocs
                });
            });
    
            return data;
        }
    
        // Call the function to collect data
        document.querySelector('.js-save-repeaters').addEventListener('click',function() {
            const collectedData = collectDocumentData();
            
            pageData.set({"documents": collectedData});
        })

        // Example usage: send the collected data somewhere, e.g., save it via an API
        // sendDataToServer(collectedData);
    
});
</script>
{% endeditorjsblock %}
</div>