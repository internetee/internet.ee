;(function ($) {
  'use strict';

  var WHOIS_HOST = '//rwhois.internet.ee/v1/';
  var COUNT_HOST = '//data.internet.ee/';

  var initMartin = function initMartin() {
    if ($('.u-content-styles form').length) {
      $('body').on('submit', '.u-content-styles form', function (e) {
        var g_recaptcha_response = grecaptcha.getResponse(window.captchaID);
        if (g_recaptcha_response === "") {
          e.preventDefault();
          $('.g-recaptcha').addClass('error').append('<div class="form_field_error">' + 'Väli on kohustuslik' + '</div>');
        } else {
          $('.g-recaptcha').removeClass('error');
          $('.g-recaptcha').remove('.form_field_error');
        }
      });
    }

    if ($('.js-anchors').length) {
      var showAnchors = false,
          anchors = $('.article--body a[href^="#"],.page--body a[href^="#"]'),
          total = $(anchors).length;
      $(anchors).each(function (i) {
        var anchorName = $(this).attr('href');
        $(this).attr('name', anchorName.substring(1));
        $('.js-anchors .keywords-list').append('<a class="keyword" href="' + anchorName + '">' + anchorName.substring(1) + '</a>');
        if (i === total - 1) {
          showAnchors = true;
        }
      });
      if (showAnchors) {
        $('html').addClass('faq-page');
        $('.js-anchors').fadeIn(100);
      }
    }

    $('.anchors').on('click', '.keyword[href^="#"]', function () {
      $('html, body').animate({
        scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top
      }, 500);
      return false;
    });

    $('[data-close-modal]').click(function (e) {
      e.preventDefault();
      $('.mdl.u-open').removeClass('u-open');
    });

    $(document).keyup(function (e) {
      if (e.keyCode == 27) {
        $('.mdl.u-open').removeClass('u-open');
      }
    });

    $('.type-checkbox label').on('click', '*', function (e) {
      e.stopImmediatePropagation();
    });

    $('body').on('click', '[data-open-modal]', function (e) {
      e.preventDefault();
      var modal = $(this).data('open-modal');
      $('body').addClass('u-modal-open');
      $('[data-modal=' + modal + ']').addClass('u-open');
    });

    $('body').on('click', '[data-search-toggle]', function (e) {
      e.preventDefault();
      $('body').toggleClass('u-site-search-open');
    });

    $('body').on('click', '[data-menu-toggle]', function (e) {
      e.preventDefault();
      $('body').toggleClass('u-menu-open');
    });

    $('body').on('click', '[data-submenu-toggle]', function (e) {
      e.preventDefault();
      $(this).parent().toggleClass('u-submenu-open');
      if ($(this).parent().hasClass('u-submenu-open')) {
        $(this).next('ul').slideDown(200);
      } else {
        $(this).next('ul').slideUp(200);
      }
    });

    if ($('.u-content-styles iframe').length && !$('.u-content-styles iframe').parent('.video-container,.edy-padding-resizer-wrapper').length) {
      $('.u-content-styles iframe').wrap('<div class="video-container" />');
    }
    if ($('.u-content-styles table').length && !$('.u-content-styles table').parent('.table-container').length) {
      $('.u-content-styles table').wrap('<div class="table-container" />');
    }

    if ($('.file-col ul li a').length) {
      $.each($('.file-col ul li a'), function (index, item) {
        var url = $(item).attr('href');
        var request;
        $('i,.file-data', item).remove();
        $('.file-label', item).contents().unwrap();
        if (url.match('^//')) {
          url = url.replace('//media.voog.com/0000/0043/1939', '');
        } else if (url.match('^https://')) {
          url = url.replace('https://media.voog.com/0000/0043/1939', '');
        }
        request = $.ajax({
          cache: false,
          type: "HEAD",
          url: url,
          crossDomain: true,
          processData: false,
          success: function (data) {
            var type = request.getResponseHeader("Content-Type").split('/').pop();
            var kb = (request.getResponseHeader("Content-Length") / 1024).toFixed(2) + 'kb';
            var icon = 'file';
            if (type == 'pdf') {
              icon = 'file-pdf';
            }
            if ($.inArray(type, ['doc', 'docx', 'bdoc', 'ddoc', 'msword']) !== -1) {
              icon = 'file-word';
            }
            if ($.inArray(type, ['png', 'jpg', 'gif', 'jpeg']) !== -1) {
              icon = 'file-image';
            }
            $(item).wrapInner('<span class="file-label" />');
            $(item).prepend('<i class="fas fa-' + icon + '" />');
            $(item).append('<span class="file-data">' + type + ', ' + kb + '</span>');
            $(item).addClass('u-ready');
          }
        });
      });
    }
    if ($('.form_field_file').length && !$('html').hasClass('editmode')) {
      $('.form_field_file').each(function (index) {
        $(this).hide(0);
        $('<div class="uploaded-file" style="display:none"><span></span><button type="button" class="btn btn--remove-file" title="' + window.translations.upload.remove_file + '"><i class="fas fa-times"></i></button></div>').insertAfter($(this));
        $('<button type="button" class="btn btn--add-file btn--small btn--default"><i class="fas fa-folder-open"></i><span>' + window.translations.upload.add_file + '</span></button>').insertAfter($(this));
      });
      $('.form_field').on('change', '.form_field_file', function (e) {
        if (e.target.value) {
          var val = e.target.value.replace(/C:\\fakepath\\/, '');
          $(e.target).nextAll('.uploaded-file').fadeIn(200).find('span').prepend(val);
        } else {
          $(e.target).nextAll('.uploaded-file').fadeOut(200);
        }
      });
      $('.form_field').on('click', '.btn--add-file', function (e) {
        $(this).prev('.form_field_file').click();
      });
      $('.form_field').on('click', '.btn--remove-file', function (e) {
        $(e.target).closest('.form_field').find('.uploaded-file span').empty();
        $(e.target).closest('.form_field').find('.form_field_file').val('').trigger("change");
      });
    }
    if ($('#location-map').length) {
      google.maps.event.addDomListener(window, 'load', initMap);

      function initMap() {
        var mapOptions = {
          zoom: 14,
          disableDefaultUI: true,
          center: new google.maps.LatLng(59.429670, 24.671210),
          styles: [{
            "featureType": "water",
            "elementType": "geometry",
            "stylers": [{"color": "#e9e9e9"}, {"lightness": 17}]
          }, {
            "featureType": "landscape",
            "elementType": "geometry",
            "stylers": [{"color": "#f5f5f5"}, {"lightness": 20}]
          }, {
            "featureType": "road.highway",
            "elementType": "geometry.fill",
            "stylers": [{"color": "#ffffff"}, {"lightness": 17}]
          }, {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [{"color": "#ffffff"}, {"lightness": 29}, {"weight": 0.2}]
          }, {
            "featureType": "road.arterial",
            "elementType": "geometry",
            "stylers": [{"color": "#ffffff"}, {"lightness": 18}]
          }, {
            "featureType": "road.local",
            "elementType": "geometry",
            "stylers": [{"color": "#ffffff"}, {"lightness": 16}]
          }, {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [{"color": "#f5f5f5"}, {"lightness": 21}]
          }, {
            "featureType": "poi.park",
            "elementType": "geometry",
            "stylers": [{"color": "#dedede"}, {"lightness": 21}]
          }, {
            "elementType": "labels.text.stroke",
            "stylers": [{"visibility": "on"}, {"color": "#ffffff"}, {"lightness": 16}]
          }, {
            "elementType": "labels.text.fill",
            "stylers": [{"saturation": 36}, {"color": "#333333"}, {"lightness": 40}]
          }, {"elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {
            "featureType": "transit",
            "elementType": "geometry",
            "stylers": [{"color": "#f2f2f2"}, {"lightness": 19}]
          }, {
            "featureType": "administrative",
            "elementType": "geometry.fill",
            "stylers": [{"color": "#fefefe"}, {"lightness": 20}]
          }, {
            "featureType": "administrative",
            "elementType": "geometry.stroke",
            "stylers": [{"color": "#fefefe"}, {"lightness": 17}, {"weight": 1.2}]
          }]
        };
        var mapElement = document.getElementById('location-map');
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(59.429638, 24.684176),
          map: map,
          icon: '../assets/marker.svg'
        });
      }
    }
  };

  var initResponsive = function initResponsive() {
    var mPortal = $('.menu-portal'),
        mLanguage = $('.menu-language'),
        mUser = $('.menu-user'),
        mMain = $('.menu-main');
    if ($(window).width() < 1025) {
      if (!$('.menu-mobile .menu-main').length) {
        $('.menu-mobile').append(mLanguage, mMain, mPortal, mUser);
      }
      $(window).on('scroll', function () {
        if ($(window).scrollTop() > 0) {
          $('.site-header').addClass('u-fixed');
        } else {
          $('.site-header').removeClass('u-fixed');
        }
      });
    } else {
      $('body.u-menu-open').removeClass('u-menu-open');
      if ($('.menu-mobile .menu-main').length) {
        $('.header-top').append(mPortal, mLanguage, mUser);
        mMain.insertBefore($('.header-actions'));
      }
    }
  };

  // <--- START ACCORDION --->
  var initAccordion = function initAccordion() {
    if ($('.accordion').length) {
      if (window.location.hash) {
        var target = $(window.location.hash);
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top + 5
          }, 500);
          showAccordionItem(target);
        }
      }
      $(window).on('hashchange', function() {
        if (window.location.hash) {
          var target = $(window.location.hash);
          if (target.length) {
            $('html, body').animate({
              scrollTop: target.offset().top + 5
            }, 500);
            showAccordionItem(target);
          }
        }
      });

      var aLink = $('[data-accordion-item]');
      aLink.on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        var urlHash = encodeURI($(this).attr('href'));
        var item = $($(this).data('accordion-item'));

        if ($(item).hasClass('accordion__item--active')) {
          e.preventDefault();
          hideAccordionItem(item);
          history.replaceState('', document.title, window.location.pathname);
        } else {
          showAccordionItem(item);
          if (e.target.nodeName !== 'SPAN') {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
              var target = $(this.hash);
              if (target.length) {
                $('html, body').animate({
                  scrollTop: target.offset().top
                }, 500);
                window.location.hash = $(target).attr('id');
              }
            }
          }
        }
      });
    }
    var anchorBlock = $('.anchor-block'),
        anchorBlockContainer = $('.article--sidebar, .page--sidebar'),
        blockFromTop,
        lastId,
        menuItems = anchorBlock.find(".anchor-block__item > a"),
        scrollItems = menuItems.map(function () {
          var item = $($(this).attr("href"));
          if (item.length) {
            return item;
          }
        });

    menuItems.click(function (e) {
      e.preventDefault();
      var href = $(this).attr("href"),
          offsetTop = href === "#" ? 0 : $(href).offset().top + 1;
      $('html, body').stop().animate({
        scrollTop: offsetTop
      }, 200);
      if ($(this).next('ul').length) {
        $(this).next('ul').slideToggle(200);
      }
    });
    $(window).scroll(function () {
      if ($(anchorBlock).length && $(window).innerWidth() > 1023) {
        var maxScroll = anchorBlockContainer.offset().top + anchorBlockContainer.outerHeight() - anchorBlock.outerHeight(),
            fromTop = $(this).scrollTop();
        var cur = scrollItems.map(function () {
          if ($(this).offset().top < fromTop)
            return this;
        });
        cur = cur[cur.length - 1];
        var id = cur && cur.length ? cur[0].id : "";
        // anchor block fixed on scroll
        if (!anchorBlock.hasClass('anchor-block--fixed')) {
          blockFromTop = anchorBlock.offset().top
        }
        if (fromTop >= blockFromTop) {
          anchorBlock.addClass('anchor-block--fixed');
        } else {
          anchorBlock.removeClass('anchor-block--fixed');
        }
        if (fromTop >= maxScroll) {
          anchorBlock.addClass('anchor-block--bottom');
        } else {
          anchorBlock.removeClass('anchor-block--bottom');
        }
        // anchor block items active on scroll
        if (lastId !== id) {
          lastId = id;
          menuItems
              .closest('.anchor-block__item').removeClass("anchor-block__item--active")
              .end().filter("[href='#" + id + "']").closest('.anchor-block__item').addClass("anchor-block__item--active");
        }
        if (id) {
          var parentElem = $('#' + id).parent();
          if (isScrolledIntoView($(parentElem))) {
            console.log(parentElem);
          }
        }
      }
    });
  };

  var isScrolledIntoView = function isScrolledIntoView(elem) {
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
  };

  var showAccordionItem = function showAccordionItem(item) {
    $(item)
        .addClass('accordion__item--active')
        .find('.accordion__item__body').slideDown(300);
    if ($('[data-accordion-item="#chart-total"]', item).length) {
      initTotalChart();
      initCountryChart();
    } else if ($('[data-accordion-item="#chart-mix"]', item).length) {
      initMixChart();
    } else if ($('[data-accordion-item="#chart-idn"]', item).length) {
      initIdnChart();
    } else if ($('[data-accordion-item="#chart-dns"]', item).length) {
      initDnsChart();
    } else if ($('[data-accordion-item="#chart-sex"]', item).length) {
      initSexChart();
    } else if ($('[data-accordion-item="#chart-text"]', item).length) {
      initTextChart();
    }
  };

  var hideAccordionItem = function hideAccordionItem(item) {
    $(item)
        .removeClass('accordion__item--active')
        .find('.accordion__item__body').slideUp(300);
  };

  var DATA_HOST = '//data.internet.ee';

  var sexChartData = [{
    "y": 0,
    "color": '#0085CA',
    "drilldown": {
      "name": window.translations.sex_chart.men,
      "categories": [],
      "data": []
    }
  },
    {
      "y": 0,
      "color": "#FF6E00",
      "drilldown": {
        "name": window.translations.sex_chart.women,
        "categories": [],
        "data": []
      }
    }];
  var initSexChart = function () {
    $.when(
        $.ajax({type: 'GET', url: DATA_HOST + '/data_sex_year_count.json', dataType: 'JSON'}).done(function (response) {
          $.each(response, function (i, sex) {
            var totalDomains = 0;
            if (i === "man") {
              $.each(sex, function (n, year) {
                totalDomains += year;
                sexChartData[0].drilldown.categories.push(n);
                sexChartData[0].drilldown.data.push(year);
              });
              sexChartData[0].y = totalDomains;
            } else {
              $.each(sex, function (n, year) {
                totalDomains += year;
                sexChartData[1].drilldown.categories.push(n);
                sexChartData[1].drilldown.data.push(year);
              });
              sexChartData[1].y = totalDomains;
            }
          });
        })
    ).then(function () {
      var data = sexChartData,
          years = data[0].drilldown.categories,
          sexData = [],
          menYearData = data[0].drilldown.data,
          womenYearData = data[1].drilldown.data,
          i,
          dataLen = data.length;

      for (i = 0; i < dataLen; i += 1) {
        sexData.push({
          name: data[i].drilldown.name,
          y: data[i].y,
          color: data[i].color
        });
      }
      var sexchart = new Highcharts.Chart({
        chart: {
          renderTo: 'sexchart',
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          zoomType: 'x',
          backgroundColor: '#fff',
          type: 'pie',
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: 'Raleway',
            color: '#212224',
            fontSize: 14
          },
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        title: {
          text: window.translations.sex_chart.title
        },
        labels: {
          items: [{
            html: window.translations.sex_chart.gender_composition,
            style: {
              left: '50px',
              top: '18px'
            }
          }]
        },
        yAxis: {
          min: 0,
          title: {
            text: window.translations.sex_chart.registered_domains
          },
          stackLabels: {
            enabled: true,
            style: {
              fontWeight: 'bold'
            }
          }
        },
        xAxis: {
          categories: years,
          title: {
            text: window.translations.sex_chart.age_group
          },
        },
        plotOptions: {
          column: {
            stacking: 'normal',
            dataLabels: {
              enabled: true,
              color: "#FFF",
            }
          }
        },
        series: [{
          type: 'column',
          name: window.translations.sex_chart.men,
          data: menYearData,
          dataLabels: {
            enabled: false
          },
          id: 'domains',
          color: '#0085CA',
          tooltip: {
            pointFormat: '{series.name}: {point.y}<br/>' + window.translations.sex_chart.total + ': {point.stackTotal}'
          },
        },
          {
            type: 'column',
            name: window.translations.sex_chart.women,
            data: womenYearData,
            dataLabels: {
              enabled: false
            },
            id: 'domains2',
            color: '#FF6E00',
            tooltip: {
              pointFormat: '{series.name}: {point.y}<br/>' + window.translations.sex_chart.total + ': {point.stackTotal}'

            },
          },
          {
            type: 'pie',
            name: window.translations.sex_chart.total_domains,
            data: sexData,
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
              formatter: function () {
                return this.y > 5 ? this.point.name : null;
              },
              color: '#ffffff',
              distance: -30
            }
          }]
      });
    });
  };

  var totalGraphData;
  var initTotalChart = function () {
    $.when(
        $.ajax({type: 'GET', url: DATA_HOST + '/data_domains.json', dataType: 'text'}).done(function (response) {
          totalGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
          $.each(totalGraphData, function (i, array) {
            array[0] = parseInt(array[0] + '000', 10);
          });
        })
    ).then(function () {
      var totalchart = new Highcharts.Chart({
        chart: {
          renderTo: 'totalchart',
          backgroundColor: '#fff',
          zoomType: 'x',
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          style: {
            fontFamily: 'Raleway',
            color: '#212224',
            fontSize: 14
          },
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        exporting: {
          enabled: false
        },
        colors: ['#FF6E00'],
        title: "",
        subtitle: "",
        xAxis: {
          type: 'datetime',
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: '%m.%Y',
            minute: '%H:%M',
            hour: '%H:%M',
            day: '%d.%m',
            week: '%d.%m.%Y',
            month: '%d.%m.%Y',
            year: '%Y'
          },
          title: {
            text: 'Registreeritud .ee domeenide arv',
            margin: 20,
            useHTML: true,
            style: {
              color: '#212224',
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: 500
            }
          },
          labels: {
            style: {
              fontSize: 14,
              color: '#212224'
            },
            step: 2
          },
          endOnTick: false,
          showFirstLabel: true,
          startOnTick: false,
          // tickPixelInterval: 70
        },
        yAxis: {
          title: "",
          min: 0,
          showLastLabel: true,

          labels: {
            formatter: function () {
              if (this.value === 30000) {
                return "30 000";
              } else if (this.value === 60000) {
                return "60 000";
              } else if (this.value === 90000) {
                return "90 000";
              } else if (this.value === 120000) {
                return "120 000";
              } else if (this.value === 150000) {
                return "150 000";
              } else if (this.value === 180000) {
                return "180 000";
              } else {
                return this.value;
              }
            },
            style: {
              color: '#212224',
              fontSize: 14
            }
          }
        },
        tooltip: {
          backgroundColor: '#fff',
          borderRadius: 0,
          borderWidth: 0,
          shadow: false,
          style: {
            color: '#212224',
            boxShadow: '0 0 20px 0 rgba(0,0,0,0.1)'
          },
          formatter: function () {
            return '<strong style="font-weight:900;color:' + this.series.color + '">' + this.y + '</strong>' + '<br>' + Highcharts.dateFormat('%e.%m.%Y', this.x);
          }
        },
        plotOptions: {
          line: {
            marker: {
              radius: 2,
              enabled: false
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2
              }
            },
            threshold: null
          }
        },
        legend: {
          enabled: false
        },
        series: [{
          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Koormus",
          data: totalGraphData
        }]
      });
    });
  };

  var initMixChart = function () {
    var registerGraphData, extendGraphData, deletionGraphData;

    $.when.apply($, [
      $.ajax({type: 'GET', url: DATA_HOST + '/data_create.json', dataType: 'text'}).done(function (response) {
        registerGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(registerGraphData, function (i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      }),
      $.ajax({type: 'GET', url: DATA_HOST + '/data_renew.json', dataType: 'text'}).done(function (response) {
        extendGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(extendGraphData, function (i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      }),
      $.ajax({type: 'GET', url: DATA_HOST + '/data_delete.json', dataType: 'text'}).done(function (response) {
        deletionGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(deletionGraphData, function (i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      })
    ]).then(function () {
      var mixchart = new Highcharts.Chart({
        chart: {
          renderTo: 'mixchart',
          backgroundColor: '#fff',
          zoomType: 'x',
          marginBottom: 120,
          marginTop: 50,
          // spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        exporting: {
          enabled: false
        },
        colors: ['#008fd7', '#ffae31', '#80b35f'],
        title: "",
        subtitle: "",
        xAxis: {
          type: 'datetime',
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: '%m.%Y',
            minute: '%H:%M',
            hour: '%H:%M',
            day: '%d.%m',
            week: '%d.%m.%Y',
            month: '%d.%m.%Y',
            year: '%Y'
          },
          title: {
            text: null
          },
          endOnTick: false,
          showFirstLabel: true,
          startOnTick: false,
          //tickPixelInterval: 70
        },
        yAxis: {
          title: "",
          min: 0,
          showLastLabel: true,
          //endOnTick: false,
          //plotLines: [{
          //  value: 0,
          //width: 1,
          // color: '#808080'
          // }]
        },
        tooltip: {
          backgroundColor: '#fff',
          borderRadius: 0,
          borderWidth: 0,
          style: {
            color: '#000'
          },
          formatter: function () {
            return Highcharts.dateFormat('%e.%m.%Y', this.x) + '<br>' + '<b style="font-weight: 700;color:' + this.series.color + '">' + this.y + '</b>';
          }
        },
        plotOptions: {
          line: {

            marker: {
              radius: 2,
              enabled: false
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2
              }
            },
            threshold: null
          }
        },
        legend: {
          enabled: true,
          floating: true,
          align: 'center',
          verticalAlign: 'top',
          borderWidth: 0,
          itemStyle: {
            color: '#666',
            fontWeight: 'normal',
            fontSize: '12px'
          }
        },
        series: [{
          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Pikendamised",
          data: extendGraphData
        }, {
          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Uued registreeringud",
          data: registerGraphData
        }, {
          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Kustumised",
          data: deletionGraphData
        }]
      });
    });
  };

  var initIdnChart = function () {
    var idnGraphData;

    $.when(
        $.ajax({type: 'GET', url: DATA_HOST + '/data_idn.json', dataType: 'text'}).done(function (response) {
          idnGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
          $.each(idnGraphData, function (i, array) {
            array[0] = parseInt(array[0] + '000', 10);
          });
        })
    ).then(function () {
      var idnchart = new Highcharts.Chart({
        chart: {
          renderTo: 'idnchart',
          backgroundColor: '#fff',
          zoomType: 'x',
          marginBottom: 120,
          marginTop: 50,
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        exporting: {
          enabled: false
        },
        colors: ['#ffae31'],
        title: "",
        subtitle: "",
        xAxis: {
          type: 'datetime',
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: '%m.%Y',
            minute: '%H:%M',
            hour: '%H:%M',
            day: '%d.%m',
            week: '%d.%m.%Y',
            month: '%d.%m.%Y',
            year: '%Y'
          },
          title: {
            text: null
          },

          endOnTick: false,
          showFirstLabel: true,
          startOnTick: false,
          //tickPixelInterval: 70
        },
        yAxis: {
          title: "",
          min: 0,
          //  showLastLabel:true,
          // endOnTick: false,
          //plotLines: [{
          //  value: 0,
          //width: 1,
          // color: '#808080'
          // }]
        },
        tooltip: {
          backgroundColor: '#fff',
          borderRadius: 0,
          borderWidth: 0,
          style: {
            color: '#212224'
          },
          formatter: function () {
            return '<b style="color:' + this.series.color + '">' + this.y + '<br>' + Highcharts.dateFormat('%e.%m.%Y', this.x);
          }
        },
        plotOptions: {
          line: {

            marker: {
              radius: 2,
              enabled: false

            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2
              }
            },
            threshold: null
          }
        },

        legend: {
          enabled: false
        },
        series: [{
          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Koormus",
          data: idnGraphData
        }]
      });
    });
  };

  var initDnsChart = function () {
    var dnssecGraphData;

    $.when(
        $.ajax({type: 'GET', url: DATA_HOST + '/data_dnssec.json', dataType: 'text'}).done(function (response) {
          dnssecGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
          $.each(dnssecGraphData, function (i, array) {
            array[0] = parseInt(array[0] + '000', 10);
          });
        })
    ).then(function () {
      var dnssecchart = new Highcharts.Chart({
        chart: {
          renderTo: 'dnssecchart',
          backgroundColor: '#fff',
          zoomType: 'x',
          marginBottom: 120,
          marginTop: 50,
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        exporting: {
          enabled: false
        },
        colors: ['#ffae31'],
        title: "",
        subtitle: "",
        xAxis: {
          type: 'datetime',
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: '%m.%Y',
            minute: '%H:%M',
            hour: '%H:%M',
            day: '%d.%m',
            week: '%d.%m.%Y',
            month: '%d.%m.%Y',
            year: '%Y'
          },
          title: {
            text: null
          },
          endOnTick: false,
          showFirstLabel: true,
          startOnTick: false,
          //tickPixelInterval: 70
        },
        yAxis: {
          title: "",
          min: 0,
          showLastLabel: true,
          //endOnTick: false,
          //plotLines: [{
          //  value: 0,
          //width: 1,
          // color: '#808080'
          // }]
        },
        tooltip: {
          backgroundColor: '#fff',
          borderRadius: 0,
          borderWidth: 0,
          style: {
            color: '#212224'
          },
          formatter: function () {
            return '<b style="color:' + this.series.color + '">' + this.y + '<br>' + Highcharts.dateFormat('%e.%m.%Y', this.x);
          }
        },
        plotOptions: {
          line: {

            marker: {
              radius: 2,
              enabled: false
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2
              }
            },
            threshold: null
          }
        },

        legend: {
          enabled: false
        },
        series: [{

          //pointInterval:12 * 3600 * 100,
          pointInterval: 24 * 3600 * 1000,
          name: "Koormus",

          data: dnssecGraphData
        }]
      });
    });
  };

  var initCountryChart = function () {
    var mapGraphData;

    $.when(
        $.get(DATA_HOST + '/country_count.json', function (response) {
          mapGraphData = response;
        })
    ).done(function () {
      // Initiate the chart
      $('#countrychart').highcharts('Map', {

        title: {
          text: null
        },

        mapNavigation: {
          enabled: true,
          buttonOptions: {
            verticalAlign: 'bottom'
          }
        },
        exporting: {
          enabled: false
        },
        legend: {
          layout: 'horizontal',
          floating: true

        },
        colorAxis: {
          min: 1,
          max: 200000,
          type: 'logarithmic',
          minColor: '#A4D09F',
          maxColor: '#32712C',
          endOnTick: false,
          minorTickInterval: 1,
          labels: {
            formatter: function () {
              if (this.value === 10000) {
                return "10 tuh";
              } else if (this.value === 1000000) {
                return "1 mln";
              } else {
                return this.value;
              }
            }
          }

        },
        chart: {
          backgroundColor: '#fff',
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        credits: {
          enabled: false
        },
        tooltip: {
          borderRadius: 1,
          borderWidth: 1,

          formatter: function () {
            return this.point.name + ': <b>' + this.point.value + '</b>';
          }
        },
        series: [{
          data: mapGraphData,
          //mapData: Highcharts.geojson(Highcharts.maps['custom/world']),
          mapData: Highcharts.maps.world,
          joinBy: 'code',
          //joinBy: ['iso-a2', 'code'],

          states: {
            hover: {
              color: '#f69240'
            }
          },
          tooltip: {
            borderRadius: 1,
            borderWidth: 1
          }
        }]
      });
    });
  };

  var initTextChart = function () {
    var textChartData = {
      categories: [],
      data: []
    }
    $.when(
        $.ajax({type: 'GET', url: DATA_HOST + '/domain-count-by-registrant.json', dataType: 'JSON'}).done(function (response) {
          $.each(response, function (i, count) {
            textChartData.categories.push(i);
            textChartData.data.push(count);
          });
        })
    ).then(function () {
      console.log(textChartData);
      var textchart = new Highcharts.Chart({
        chart: {
          renderTo: 'textchart',
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          zoomType: 'x',
          backgroundColor: '#fff',
          type: 'pie',
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: 'Raleway',
            color: '#212224',
            fontSize: 14
          },
          resetZoomButton: {
            relativeTo: 'chart',
            position: {
              x: -1,
              y: 0
            },
          }
        },
        title: {
          text: 'Registreerijatele kuuluvate domeenide arv'
        },
        xAxis: {
          categories: textChartData.categories
        },
        labels: {
          items: [{
            html: 'Koguarv',
            style: {
              left: '50px',
              top: '18px'
            }
          }]
        },
        plotOptions: {
          column: {
            colorByPoint: true
          }
        },
        colors: ['#00BABE', '#00BDF2'],
        series: [{
          type: 'column',
          name: 'Registreerijate arv',
          data: textChartData.categories.data
        },
          {
            type: 'spline',
            name: 'Keskmine',
            data: textChartData.categories.data,
            color: '#051729',
            marker: {
              lineWidth: 2,
              lineColor: '#051729',
              fillColor: 'white',
            }
          }, {
            type: 'pie',
            name: 'Domeenide arv',
            data: [{
              name: '1 registreerija',
              y: 15151,
              color: Highcharts.getOptions().colors[0]
            }, {
              name: '2 registreerijat',
              y: 2415,
              color: Highcharts.getOptions().colors[1]
            }, {
              name: '3 registreerijat',
              y: 5015,
              color: Highcharts.getOptions().colors[2]
            }, {
              name: '4 registreerijat',
              y: 11051,
              color: Highcharts.getOptions().colors[3]
            }, {
              name: '5 registreerijat',
              y: 9521,
              color: Highcharts.getOptions().colors[4]
            }, {
              name: '6-10 registreerijat',
              y: 3515,
              color: Highcharts.getOptions().colors[5]
            }, {
              name: '11 - 25 registreerijat',
              y: 5910,
              color: Highcharts.getOptions().colors[6]
            }, {
              name: '26 - 50 registreerijat',
              y: 14105,
              color: Highcharts.getOptions().colors[7]
            }, {
              name: '51 - 100 registreerijat',
              y: 5019,
              color: Highcharts.getOptions().colors[8]
            }, {
              name: '101 - 250 registreerijat',
              y: 5034,
              color: Highcharts.getOptions().colors[9]
            }, {
              name: '251 - 500 registreerijat',
              y: 10258,
              color: Highcharts.getOptions().colors[10]
            }, {
              name: '501 - 1000 registreerijat',
              y: 21011,
              color: Highcharts.getOptions().colors[11]
            }, {
              name: '1001 või enam registreerijat',
              y: 25014,
              color: Highcharts.getOptions().colors[12]
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
              enabled: false
            }
          }]
      });
    });
  };

  // <--- END ACCORDION --->

  var initArticlePage = function initArticlePage() {
    $('body').on('change', 'input[name="article[topic]"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        'topic': value
      });
    });
    $('body').on('change', 'input[name="article[type]"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        'type': value
      });
    });
    $('body').on('keyup', 'input[name="article[topic]"],input[name="article[type]"]', function (event) {
      if (event.keycode == 13) {
        event.preventDefault();
        this.blur();
        alert('Salvestatud!');
      }
    });
  };

  var loadDomainData = function loadDomainData() {
    var url = COUNT_HOST + 'count.json';
    $.get(url, function (response) {
      $('.domain-stats .all > span').text(response.total);
      $('.domain-stats .today > span').text(response.total_today);
    });
  };

  var initFrontPage = function initFrontPage() {
    loadDomainData();
    $('.hero-slider-slides').owlCarousel({
      items: 1,
      loop: true,
      nav: false,
      autoplay: true,
      autoplayTimeout: 10000,
      animateOut: 'fadeOut',
      animateIn: 'fadeIn',
    });

    $('#domain-search').on('submit', function (e) {
      var val = $('#searchw').val();
      var action = $(e.target).attr('action');
      $(e.target).attr('action', action + val);
    });

    $('body').on('change', 'input[name="statistics_link"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        'statisticsLink': value
      });
      alert('Salvestatud!');
    });
  };

  var initTabs = function initTabs() {
    if ($('.content-tabs').length) {
      $('.content-tabs--nav .item').click(function (e) {
        e.preventDefault();
        var tabIndex = $(e.currentTarget).index();
        var tab = $('.content-tabs--item').get(tabIndex);
        if ($(tab).hasClass('u-active')) {
          return false;
        } else {
          $(e.currentTarget).parent().find('.u-active').removeClass('u-active');
          $(e.currentTarget).addClass('u-active');
          $(tab).parent().find('.u-active').removeClass('u-active');
          $(tab).addClass('u-active');
        }
      });
    }
  };

  $(window).resize(function () {
    initResponsive();
  });

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    initMartin: initMartin,
    initFrontPage: initFrontPage,
    initArticlePage: initArticlePage,
    initAccordion: initAccordion
  });
  initMartin();
  initAccordion();
  initTabs();
  initResponsive();
})(jQuery);