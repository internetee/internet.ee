;
(function($) {
    'use strict';
    var initWattie = function initWattie(opts) {
        // $('.accordion__item__head').on('click', function(e) {
        //     e.preventDefault();
        //     var a = $(this).closest('.accordion'),
        //         aI = $(this).closest('.accordion__item'),
        //         fromTop = $(window).scrollTop();
        //     if (aI.hasClass('accordion__item--active')) {
        //         aI.removeClass('accordion__item--active');
        //         aI.find('.accordion__item__body').slideUp(200);
        //         console.log('asd');
        //     } else {
        //         a.find('.accordion__item').removeClass('accordion__item--active');
        //         a.find('.accordion__item__body').slideUp(200);
        //         aI.addClass('accordion__item--active');
        //         aI.find('.accordion__item__body').slideDown({
        //             duration: 200,
        //             step: function() {
        //                 if ($(window).scrollTop() > aI.offset().top) {
        //                     $('html, body').scrollTop(aI.offset().top + 1);
        //                 }
        //             }
        //         });
        //     }
        // });


        // // Anchor block
        // var anchorBlock = $('.anchor-block'),
        //     anchorBlockContainer = $('.content-container__sidebar'),
        //     blockFromTop,
        //     lastId,
        //     menuItems = anchorBlock.find(".anchor-block__item a"),
        //     scrollItems = menuItems.map(function() {
        //         var item = $($(this).attr("href"));
        //         if (item.length) {
        //             return item;
        //         }
        //     });

        // menuItems.click(function(e) {
        //     var href = $(this).attr("href"),
        //         offsetTop = href === "#" ? 0 : $(href).offset().top + 1;
        //     $('html, body').stop().animate({
        //         scrollTop: offsetTop
        //     }, 200);

        //     //$(href).find('.accordion__item__head').click();
        //     e.preventDefault();
        // });

        // $(window).scroll(function() {
        //     if ($(anchorBlock).length) {
        //       var maxScroll = anchorBlockContainer.offset().top + anchorBlockContainer.outerHeight() - anchorBlock.outerHeight(),
        //           fromTop = $(this).scrollTop();
        //       var cur = scrollItems.map(function() {
        //           if ($(this).offset().top < fromTop)
        //               return this;
        //       });
        //       cur = cur[cur.length - 1];
        //       var id = cur && cur.length ? cur[0].id : "";
        //       // anchor block fixed on scroll
        //       if (!anchorBlock.hasClass('anchor-block--fixed')) {
        //           blockFromTop = anchorBlock.offset().top
        //       }
        //       if (fromTop >= blockFromTop) {
        //           anchorBlock.addClass('anchor-block--fixed');
        //       } else {
        //           anchorBlock.removeClass('anchor-block--fixed');
        //       }
        //       if (fromTop >= maxScroll) {
        //           anchorBlock.addClass('anchor-block--bottom');
        //       } else {
        //           anchorBlock.removeClass('anchor-block--bottom');
        //       }
        //       // anchor block items active on scroll
        //       if (lastId !== id) {
        //           lastId = id;
        //           menuItems
        //               .closest('.anchor-block__item').removeClass("anchor-block__item--active")
        //               .end().filter("[href=#" + id + "]").closest('.anchor-block__item').addClass("anchor-block__item--active");
        //       }
        //     }
        // });
    }
    // Enables the usage of the initiations outside this file.
    window.site = $.extend(window.site || {}, {
        initWattie: initWattie
    });
    initWattie();
})(jQuery);