<div class="c-documents">
    {% if editmode %}
    {% addbutton page_id=element.page_id title="Add Document" element_type="document" %}
    {% endif %}
    <div class="c-documents__grid">
    {% elementscontext edicy_page_path={{page.path}} edicy_all_languages="true" edicy_model="Document" %}
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

                <a href="{{document.url}}" class="edy-cbtn edy-site-menu-add edy-add-modal" data-component="element">
                <span><span class="edy-cbtn-content">
                        <span class="edy-cbtn-text">Edit Document</span></span></span></a>
            </div>
    {% endfor %}
    </div>
    {% endelementscontext %}
</div>
