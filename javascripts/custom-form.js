(function($) {

    function customForm(form) {

        var $form = $(form);
        var formAction = $form.attr('action');
        var errorMessageClass = 'st-error';
        var $messageContainer = $('<div class="customForm_alert"><div>');
        var $successContainer = $('<div class="customForm_success"></div>');
        var fieldAlertTemplate = '<span class="customForm_fieldAlert js-fieldAlert"></span>';
        
        var prettifyFormErrors = function(errorsObj) {
          var newErrorsObject = {};
          newErrorsObject.fieldErrors = [];
          newErrorsObject.base = errorsObj.base;
    
          for (var prop in errorsObj) {
            if (errorsObj.hasOwnProperty(prop)) {
              if (prop.indexOf('field') !== -1) { 
                newErrorsObject.fieldErrors.push({
                  "id": 'field_' + prop,
                  "errors": errorsObj[prop]
                });
              }
            }
          }
    
          return newErrorsObject;
        };

        var showFormErrors = function(errorsObj) {
            $messageContainer.prependTo($form);
            $messageContainer.html(errorsObj.base[0]);
            $messageContainer.addClass(errorMessageClass);
            $.each(errorsObj.fieldErrors, function(index, item) {
                var $field = $('#' + item.id);
                $field.parent().addClass('has-errors');
                var $fieldNote = $(fieldAlertTemplate);
                $field.after($fieldNote);
                $fieldNote.html(item.errors.join('<br>'));
            });
            
        };

        var clearAlerts = function() {
            $form.find('.has-errors').removeClass('has-errors');
            $form.find('.js-fieldAlert').remove();
            $messageContainer.remove();
        };
        
        var showSuccess = function(data) {
            $form.before($successContainer);
            $successContainer.text(data);
            $form.remove();
        }
        
        function formSubmitHandler() {
            var formData = $form.serializeArray();
            clearAlerts();
            $.post(formAction, formData)
              .done(function(data) {
                if (data.errors) {
                  showFormErrors(prettifyFormErrors(data.errors));
                } else if (data.notice) {
                  showSuccess(data.notice);
                } else {
                  console.log(data);
                }
              });
        }
        
        $form.on('submit', function(e) {
            e.preventDefault();
            formSubmitHandler();
        });
    }
    
    $('.js-customForm form').each(function(index, element) {
        customForm(element);
    });
    
})(jQuery);

