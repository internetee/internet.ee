(function ($) {
  "use strict";

  var COUNT_HOST = "//data.internet.ee/";

  $.fn.andSelf = function () {
    return this.addBack.apply(this, arguments);
  };

  var initMain = function initMain() {
    const originalTitle = document.title;
    if ($(".u-content-styles form").length) {
      $("body").on("submit", ".u-content-styles form", function (e) {
        var g_recaptcha_response = grecaptcha.getResponse(window.captchaID);

        if (g_recaptcha_response === "") {
          e.preventDefault();
          $(".g-recaptcha")
            .addClass("error")
            .append(
              '<div class="form_field_error">' +
                "Väli on kohustuslik" +
                "</div>"
            );
        } else {
          $(".g-recaptcha").removeClass("error");
          $(".g-recaptcha").remove(".form_field_error");
        }
      });
    }

    if ($(".js-anchors").length) {
      var showAnchors = false,
        anchors = $('.article--body a[href^="#"],.page--body a[href^="#"]'),
        total = $(anchors).length;
      $(anchors).each(function (i) {
        var anchorName = $(this).attr("href");
        $(this).attr("name", anchorName.substring(1));
        $(".js-anchors .keywords-list").append(
          '<a class="keyword" href="' +
            anchorName +
            '">' +
            anchorName.substring(1) +
            "</a>"
        );
        if (i === total - 1) {
          showAnchors = true;
        }
      });
      if (showAnchors) {
        $("html").addClass("faq-page");
        $(".js-anchors").fadeIn(100);
      }
    }

    $(".anchors").on("click", '.keyword[href^="#"]', function () {
      $("html, body").animate(
        {
          scrollTop: $(
            '[name="' + $.attr(this, "href").substr(1) + '"]'
          ).offset().top,
        },
        500
      );
      return false;
    });

    $("[data-close-modal]").click(function (e) {
      e.preventDefault();
      $(".mdl.u-open").removeClass("u-open");
    });

    $(document).keyup(function (e) {
      if (e.keyCode == 27) {
        document.title = originalTitle;
        $(".mdl.u-open").removeClass("u-open");
      }
    });

    $(".type-checkbox label").on("click", "*", function (e) {
      e.stopImmediatePropagation();
    });

    $("body").on("click", "[data-open-modal]", function (e) {
      e.preventDefault();
      var modal = $(this).data("open-modal");
      $("body").addClass("u-modal-open");
      $("[data-modal=" + modal + "]").addClass("u-open");
    });

    $("body").on("click", "[data-search-toggle]", function (e) {
      e.preventDefault();
      $("body").toggleClass("u-site-search-open");
    });

    $("body").on("click", "[data-menu-toggle]", function (e) {
      e.preventDefault();
      $("body").toggleClass("u-menu-open");
    });

    $("body").on("click", "[data-submenu-toggle]", function (e) {
      e.preventDefault();
      $(this).parent().toggleClass("u-submenu-open");
      if ($(this).parent().hasClass("u-submenu-open")) {
        $(this).next("ul").slideDown(200);
      } else {
        $(this).next("ul").slideUp(200);
      }
    });

    if (
      $(".u-content-styles iframe").length &&
      !$(".u-content-styles iframe").parent(
        ".video-container,.edy-padding-resizer-wrapper"
      ).length
    ) {
      $(".u-content-styles iframe").wrap('<div class="video-container" />');
    }
    if (
      $(".u-content-styles table").length &&
      !$(".u-content-styles table").parent(".table-container").length
    ) {
      $(".u-content-styles table").wrap('<div class="table-container" />');
    }

    if ($(".file-col ul li a").length) {
      $.each($(".file-col ul li a"), function (index, item) {
        var url = $(item).attr("href");
        var request;
        $("i,.file-data", item).remove();
        $(".file-label", item).contents().unwrap();
        if (url.match("^//media.voog.com")) {
          url = url.replace("//media.voog.com/0000/0043/1939", "");
        } else if (url.match("^https://media.voog.com")) {
          url = url.replace("https://media.voog.com/0000/0043/1939", "");
        }
        if (url.match("^//meedia.internet.ee")) {
          url = url.replace("//meedia.internet.ee", "");
        } else if (url.match("^https://meedia.internet.ee")) {
          url = url.replace("https://internet.ee", "");
        }
        request = $.ajax({
          cache: false,
          type: "HEAD",
          url: url,
          crossDomain: true,
          processData: false,
          success: function (data) {
            var type = request
              .getResponseHeader("Content-Type")
              .split("/")
              .pop();
            var kb =
              (request.getResponseHeader("Content-Length") / 1024).toFixed(2) +
              "kb";
            var icon = "file";
            if (type == "pdf") {
              icon = "file-pdf";
            }
            if (
              $.inArray(type, ["doc", "docx", "bdoc", "ddoc", "msword"]) !== -1
            ) {
              icon = "file-word";
            }
            if ($.inArray(type, ["png", "jpg", "gif", "jpeg"]) !== -1) {
              icon = "file-image";
            }
            $(item).wrapInner('<span class="file-label" />');
            $(item).prepend('<i class="fas fa-' + icon + '" />');
            $(item).append(
              '<span class="file-data">' + type + ", " + kb + "</span>"
            );
            $(item).addClass("u-ready");
          },
        });
      });
    }
    if ($(".form_field_file").length && !$("html").hasClass("editmode")) {
      $(".form_field_file").each(function (index) {
        $(this).hide(0);
        $(
          '<div class="uploaded-file" style="display:none"><span></span><button type="button" class="btn btn--remove-file" title="' +
            window.translations.upload.remove_file +
            '"><i class="fas fa-times"></i></button></div>'
        ).insertAfter($(this));
        $(
          '<button type="button" class="btn btn--add-file btn--small btn--default"><i class="fas fa-folder-open"></i><span>' +
            window.translations.upload.add_file +
            "</span></button>"
        ).insertAfter($(this));
      });
      $(".form_field").on("change", ".form_field_file", function (e) {
        if (e.target.value) {
          var val = e.target.value.replace(/C:\\fakepath\\/, "");
          $(e.target)
            .nextAll(".uploaded-file")
            .fadeIn(200)
            .find("span")
            .prepend(val);
        } else {
          $(e.target).nextAll(".uploaded-file").fadeOut(200);
        }
      });
      $(".form_field").on("click", ".btn--add-file", function (e) {
        $(this).prev(".form_field_file").click();
      });
      $(".form_field").on("click", ".btn--remove-file", function (e) {
        $(e.target).closest(".form_field").find(".uploaded-file span").empty();
        $(e.target)
          .closest(".form_field")
          .find(".form_field_file")
          .val("")
          .trigger("change");
      });
    }
    if ($("#location-map").length) {
      google.maps.event.addDomListener(window, "load", initMap);

      function initMap() {
        var mapOptions = {
          zoom: 14,
          disableDefaultUI: true,
          center: new google.maps.LatLng(59.42967, 24.67121),
          styles: [
            {
              featureType: "water",
              elementType: "geometry",
              stylers: [{ color: "#e9e9e9" }, { lightness: 17 }],
            },
            {
              featureType: "landscape",
              elementType: "geometry",
              stylers: [{ color: "#f5f5f5" }, { lightness: 20 }],
            },
            {
              featureType: "road.highway",
              elementType: "geometry.fill",
              stylers: [{ color: "#ffffff" }, { lightness: 17 }],
            },
            {
              featureType: "road.highway",
              elementType: "geometry.stroke",
              stylers: [
                { color: "#ffffff" },
                { lightness: 29 },
                { weight: 0.2 },
              ],
            },
            {
              featureType: "road.arterial",
              elementType: "geometry",
              stylers: [{ color: "#ffffff" }, { lightness: 18 }],
            },
            {
              featureType: "road.local",
              elementType: "geometry",
              stylers: [{ color: "#ffffff" }, { lightness: 16 }],
            },
            {
              featureType: "poi",
              elementType: "geometry",
              stylers: [{ color: "#f5f5f5" }, { lightness: 21 }],
            },
            {
              featureType: "poi.park",
              elementType: "geometry",
              stylers: [{ color: "#dedede" }, { lightness: 21 }],
            },
            {
              elementType: "labels.text.stroke",
              stylers: [
                { visibility: "on" },
                { color: "#ffffff" },
                { lightness: 16 },
              ],
            },
            {
              elementType: "labels.text.fill",
              stylers: [
                { saturation: 36 },
                { color: "#333333" },
                { lightness: 40 },
              ],
            },
            { elementType: "labels.icon", stylers: [{ visibility: "off" }] },
            {
              featureType: "transit",
              elementType: "geometry",
              stylers: [{ color: "#f2f2f2" }, { lightness: 19 }],
            },
            {
              featureType: "administrative",
              elementType: "geometry.fill",
              stylers: [{ color: "#fefefe" }, { lightness: 20 }],
            },
            {
              featureType: "administrative",
              elementType: "geometry.stroke",
              stylers: [
                { color: "#fefefe" },
                { lightness: 17 },
                { weight: 1.2 },
              ],
            },
          ],
        };
        var mapElement = document.getElementById("location-map");
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(59.429638, 24.684176),
          map: map,
          icon: "../assets/marker.svg",
        });
      }
    }

    // START Mark search results
    const pageSearchParams = new URL(document.location).searchParams;
    if (pageSearchParams.get("mark-keys")) {
      const pageContent = document.querySelector("main.page-content");

      var searchKeys = [];
      (function () {
        const array = pageSearchParams
          .get("mark-keys")
          .split(/[~]|  +/)
          .filter(Boolean);
        array.forEach(function (e) {
          e = e.trim();
          if (e.length > 1) {
            searchKeys.push(e);
          }
        });
      })();

      function selectMarkResults() {
        const markResults = pageContent.querySelectorAll("mark");
        if (markResults.length) {
          jumpToMark(markResults[0]);
        }
      }

      function jumpToMark(firstResult) {
        const accordionItem = firstResult.closest("[data-accordion-item]");
        if (accordionItem) {
          const item = $($(this).data("accordion-item"));
          showAccordionItem(item);
        } else if ($(".accordion__item")) {
          showAllAccordionItems();
        }

        window.setTimeout(function () {
          const position = firstResult.getBoundingClientRect().top - 100;
          window.scrollTo(0, position);
        }, 300);
      }

      const markInstance = new Mark(pageContent);
      markInstance.mark(searchKeys, {
        separateWordSearch: false,
        acrossElements: true,
        exclude: [".btn *"],
        done: function () {
          selectMarkResults();
        },
      });
    }
    // END Mark search results

    // START Back to Top Button
    var backToTopButton = $("#js-back-to-top");

    $(window).scroll(function () {
      if ($(window).scrollTop() > 1000) {
        backToTopButton.addClass("show-btn");
      } else {
        backToTopButton.removeClass("show-btn");
      }
    });

    backToTopButton.on("click", function (e) {
      e.preventDefault();
      $("html, body").animate({ scrollTop: 0 }, "300");
    });
    // END Back to Top Button
  };

  var initResponsive = function initResponsive() {
    var mPortal = $(".menu-portal"),
      mLanguage = $(".menu-language"),
      mUser = $(".menu-user"),
      mMain = $(".menu-main"),
      mSocial = $(".menu-social.u-h");
    if ($(window).width() < 1025) {
      if (!$(".menu-mobile .menu-main").length) {
        $(".menu-mobile").append(mLanguage, mMain, mPortal, mUser, mSocial);
      }
      $(window).on("scroll", function () {
        if ($(window).scrollTop() > 0) {
          $(".site-header").addClass("u-fixed");
        } else {
          $(".site-header").removeClass("u-fixed");
        }
      });
    } else {
      $("body.u-menu-open").removeClass("u-menu-open");
      if ($(".menu-mobile .menu-main").length) {
        $(".header-top").append(mPortal, mLanguage, mUser);
        mMain.insertBefore($(".header-actions"));
        $(".header-bottom").append(mSocial);
      }
    }
  };

  // <--- START ACCORDION --->
  var initAccordion = function initAccordion() {
    if ($(".accordion").length) {
      $(".btn--toggle").click(function () {
        $(this).toggleClass("active");
        if ($(this).hasClass("active")) {
          showAllAccordionItems();
        } else {
          hideAllAccordionItems();
        }
      });
      $(document).keydown(function (event) {
        if ((event.ctrlKey || event.metaKey) && event.which === 70) {
          showAllAccordionItems();
          $(".btn--toggle").addClass("active");
        }
      });
      if (window.location.hash) {
        var target = $(window.location.hash);
        if (target.length) {
          $("html, body").animate(
            {
              scrollTop: target.offset().top + 5,
            },
            500
          );
          showAccordionItem(target);
        }
      }
      $(window).on("hashchange", function () {
        if (window.location.hash) {
          var target = $(window.location.hash);
          if (target.length) {
            $("html, body").animate(
              {
                scrollTop: target.offset().top + 5,
              },
              500
            );
            showAccordionItem(target);
          }
        }
      });

      var aLink = $("[data-accordion-item]");
      // aLink.on("click", function (e) {
      //   e.preventDefault();
      //   e.stopPropagation();
      //   var urlHash = encodeURI($(this).attr("href"));
      //   var item = $($(this).data("accordion-item"));

      //   if ($(item).hasClass("accordion__item--active")) {
      //     e.preventDefault();
      //     hideAccordionItem(item);
      //     history.replaceState("", document.title, window.location.pathname);
      //   } else {
      //     showAccordionItem(item);
      //     if (e.target.nodeName !== "SPAN") {
      //       if (
      //         location.pathname.replace(/^\//, "") ==
      //           this.pathname.replace(/^\//, "") &&
      //         location.hostname == this.hostname
      //       ) {
      //         var target = $(this.hash);
      //         if (target.length) {
      //           $("html, body").animate(
      //             {
      //               scrollTop: target.offset().top,
      //             },
      //             500
      //           );
      //           window.location.hash = $(target).attr("id");
      //         }
      //       }
      //     }
      //   }
      // });
    }
    var anchorBlock = $(".anchor-block"),
      anchorBlockContainer = $(".article--sidebar, .page--sidebar"),
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
      $("html, body").stop().animate(
        {
          scrollTop: offsetTop,
        },
        200
      );
      if ($(this).next("ul").length) {
        $(this).toggleClass("u-active");
        $(this).next("ul").slideToggle(200);
      }
    });
    $(window).scroll(function () {
      if ($(anchorBlock).length && $(window).innerWidth() > 1023) {
        var maxScroll =
            anchorBlockContainer.offset().top +
            anchorBlockContainer.outerHeight() -
            anchorBlock.outerHeight(),
          fromTop = $(this).scrollTop();
        var cur = scrollItems.map(function () {
          if ($(this).offset().top < fromTop) return this;
        });
        cur = cur[cur.length - 1];
        var id = cur && cur.length ? cur[0].id : "";
        // anchor block fixed on scroll
        if (!anchorBlock.hasClass("anchor-block--fixed")) {
          blockFromTop = anchorBlock.offset().top;
        }
        if (fromTop >= blockFromTop) {
          anchorBlock.addClass("anchor-block--fixed");
        } else {
          anchorBlock.removeClass("anchor-block--fixed");
        }
        if (fromTop >= maxScroll) {
          anchorBlock.addClass("anchor-block--bottom");
        } else {
          anchorBlock.removeClass("anchor-block--bottom");
        }
        // anchor block items active on scroll
        if (lastId !== id) {
          lastId = id;
          menuItems
            .closest(".anchor-block__item")
            .removeClass("anchor-block__item--active")
            .end()
            .filter("[href='#" + id + "']")
            .closest(".anchor-block__item")
            .addClass("anchor-block__item--active");
        }
        if (id) {
          var parentElem = $("#" + id).parent();
          if (isScrolledIntoView($(parentElem))) {
            //console.log(parentElem);
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

    return elemBottom <= docViewBottom && elemTop >= docViewTop;
  };

  var showAccordionItem = function showAccordionItem(item) {
    $(item)
      .addClass("accordion__item--active")
      .find(".accordion__item__body")
      .slideDown(300);
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
    } else if ($('[data-accordion-item="#chart-org"]', item).length) {
      initOrgChart();
    } else if ($('[data-accordion-item="#chart-renew"]', item).length) {
      initRenewChart();
    }
  };

  var showAllAccordionItems = function showAllAccordionItems() {
    $(".accordion__item")
      .addClass("accordion__item--active")
      .find(".accordion__item__body")
      .slideDown(300);
  };

  var hideAllAccordionItems = function hideAllAccordionItems() {
    $(".accordion__item")
      .removeClass("accordion__item--active")
      .find(".accordion__item__body")
      .slideUp(300);
  };

  var hideAccordionItem = function hideAccordionItem(item) {
    $(item)
      .removeClass("accordion__item--active")
      .find(".accordion__item__body")
      .slideUp(300);
  };

  var DATA_HOST = "//data.internet.ee";

  var initSexChart = function () {
    var sexChartData = [
      {
        y: 0,
        color: "#0085CA",
        drilldown: {
          name: window.translations.sex_chart.men,
          categories: [],
          data: [],
        },
      },
      {
        y: 0,
        color: "#FF6E00",
        drilldown: {
          name: window.translations.sex_chart.women,
          categories: [],
          data: [],
        },
      },
    ];
    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/data_sex_year_count.json",
        dataType: "JSON",
      }).done(function (response) {
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
          color: data[i].color,
        });
      }
      var sexchart = new Highcharts.Chart({
        chart: {
          renderTo: "sexchart",
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          zoomType: "x",
          backgroundColor: "#fff",
          type: "pie",
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: "Raleway",
            color: "#212224",
            fontSize: 14,
          },
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
        },
        title: {
          text: window.translations.sex_chart.title,
        },
        labels: {
          items: [
            {
              html: window.translations.sex_chart.gender_composition,
              style: {
                left: "50px",
                top: "18px",
              },
            },
          ],
        },
        yAxis: {
          min: 0,
          title: {
            text: window.translations.sex_chart.registered_domains,
          },
          stackLabels: {
            enabled: true,
            style: {
              fontWeight: "bold",
            },
          },
        },
        xAxis: {
          categories: years,
          title: {
            text: window.translations.sex_chart.age_group,
          },
        },
        plotOptions: {
          column: {
            stacking: "normal",
            dataLabels: {
              enabled: true,
              color: "#FFF",
            },
          },
        },
        series: [
          {
            type: "column",
            name: window.translations.sex_chart.men,
            data: menYearData,
            dataLabels: {
              enabled: false,
            },
            id: "domains",
            color: "#0085CA",
            tooltip: {
              pointFormat:
                "{series.name}: {point.y}<br/>" +
                window.translations.sex_chart.total +
                ": {point.stackTotal}",
            },
          },
          {
            type: "column",
            name: window.translations.sex_chart.women,
            data: womenYearData,
            dataLabels: {
              enabled: false,
            },
            id: "domains2",
            color: "#FF6E00",
            tooltip: {
              pointFormat:
                "{series.name}: {point.y}<br/>" +
                window.translations.sex_chart.total +
                ": {point.stackTotal}",
            },
          },
          {
            type: "pie",
            name: window.translations.sex_chart.total_domains,
            data: sexData,
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
              formatter: function () {
                return this.y > 5 ? this.point.name : null;
              },
              color: "#ffffff",
              distance: -30,
            },
          },
        ],
      });
    });
  };

  var totalGraphData;
  var initTotalChart = function () {
    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/data_domains.json",
        dataType: "text",
      }).done(function (response) {
        totalGraphData = JSON.parse(
          response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
        );
        $.each(totalGraphData, function (i, array) {
          array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
        });
      })
    ).then(function () {
      var totalchart = new Highcharts.Chart({
        chart: {
          renderTo: "totalchart",
          backgroundColor: "#fff",
          zoomType: "x",
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          style: {
            fontFamily: "Raleway",
            color: "#212224",
            fontSize: 14,
          },
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
        },
        exporting: {
          enabled: false,
        },
        colors: ["#FF6E00"],
        title: "",
        subtitle: "",
        xAxis: {
          type: "datetime",
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: "%m.%Y",
            minute: "%H:%M",
            hour: "%H:%M",
            day: "%d.%m",
            week: "%d.%m.%Y",
            month: "%d.%m.%Y",
            year: "%Y",
          },
          title: {
            text: window.translations.total_chart.title,
            margin: 20,
            useHTML: true,
            style: {
              color: "#212224",
              fontSize: 14,
              fontFamily: "Raleway",
              fontWeight: 500,
            },
          },
          labels: {
            style: {
              fontSize: 14,
              color: "#212224",
            },
            step: 2,
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
              color: "#212224",
              fontSize: 14,
            },
          },
        },
        tooltip: {
          backgroundColor: "#fff",
          borderRadius: 0,
          borderWidth: 0,
          shadow: false,
          style: {
            color: "#212224",
            boxShadow: "0 0 20px 0 rgba(0,0,0,0.1)",
          },
          formatter: function () {
            return (
              '<strong style="font-weight:900;color:' +
              this.series.color +
              '">' +
              this.y +
              "</strong>" +
              "<br>" +
              Highcharts.dateFormat("%e.%m.%Y", this.x)
            );
          },
        },
        plotOptions: {
          line: {
            marker: {
              radius: 2,
              enabled: false,
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2,
              },
            },
            threshold: null,
          },
        },
        legend: {
          enabled: false,
        },
        series: [
          {
            //pointInterval:12 * 3600 * 100,
            pointInterval: 24 * 3600 * 1000,
            name: "Koormus",
            data: totalGraphData,
          },
        ],
      });
    });
  };

  var initMixChart = function () {
    var registerGraphData, extendGraphData, deletionGraphData;

    $.when
      .apply($, [
        $.ajax({
          type: "GET",
          url: DATA_HOST + "/data_create.json",
          dataType: "text",
        }).done(function (response) {
          registerGraphData = JSON.parse(
            response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
          );
          $.each(registerGraphData, function (i, array) {
            array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
          });
        }),
        $.ajax({
          type: "GET",
          url: DATA_HOST + "/data_renew.json",
          dataType: "text",
        }).done(function (response) {
          extendGraphData = JSON.parse(
            response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
          );
          $.each(extendGraphData, function (i, array) {
            array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
          });
        }),
        $.ajax({
          type: "GET",
          url: DATA_HOST + "/data_delete.json",
          dataType: "text",
        }).done(function (response) {
          deletionGraphData = JSON.parse(
            response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
          );
          $.each(deletionGraphData, function (i, array) {
            array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
          });
        }),
      ])
      .then(function () {
        var mixchart = new Highcharts.Chart({
          chart: {
            renderTo: "mixchart",
            backgroundColor: "#fff",
            zoomType: "x",
            marginBottom: 120,
            marginTop: 50,
            // spacingTop: 40,
            spacingRight: 40,
            spacingBottom: 40,
            spacingLeft: 40,
            resetZoomButton: {
              relativeTo: "chart",
              position: {
                x: -1,
                y: 0,
              },
            },
          },
          exporting: {
            enabled: false,
          },
          colors: ["#008fd7", "#ffae31", "#80b35f"],
          title: "",
          subtitle: "",
          xAxis: {
            type: "datetime",
            minRange: 14 * 24 * 3600000, // fourteen days
            dateTimeLabelFormats: {
              second: "%m.%Y",
              minute: "%H:%M",
              hour: "%H:%M",
              day: "%d.%m",
              week: "%d.%m.%Y",
              month: "%d.%m.%Y",
              year: "%Y",
            },
            title: {
              text: null,
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
            backgroundColor: "#fff",
            borderRadius: 0,
            borderWidth: 0,
            style: {
              color: "#000",
            },
            formatter: function () {
              return (
                Highcharts.dateFormat("%e.%m.%Y", this.x) +
                "<br>" +
                '<b style="font-weight: 700;color:' +
                this.series.color +
                '">' +
                this.y +
                "</b>"
              );
            },
          },
          plotOptions: {
            line: {
              marker: {
                radius: 2,
                enabled: false,
              },
              lineWidth: 2,
              states: {
                hover: {
                  lineWidth: 2,
                },
              },
              threshold: null,
            },
          },
          legend: {
            enabled: true,
            floating: true,
            align: "center",
            verticalAlign: "top",
            borderWidth: 0,
            itemStyle: {
              color: "#666",
              fontWeight: "normal",
              fontSize: "12px",
            },
          },
          series: [
            {
              //pointInterval:12 * 3600 * 100,
              pointInterval: 24 * 3600 * 1000,
              name: window.translations.mix_chart.renewals,
              data: extendGraphData,
            },
            {
              //pointInterval:12 * 3600 * 100,
              pointInterval: 24 * 3600 * 1000,
              name: window.translations.mix_chart.registrations,
              data: registerGraphData,
            },
            {
              //pointInterval:12 * 3600 * 100,
              pointInterval: 24 * 3600 * 1000,
              name: window.translations.mix_chart.deletions,
              data: deletionGraphData,
            },
          ],
        });
      });
  };

  var initIdnChart = function () {
    var idnGraphData;

    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/data_idn.json",
        dataType: "text",
      }).done(function (response) {
        idnGraphData = JSON.parse(
          response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
        );
        $.each(idnGraphData, function (i, array) {
          array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
        });
      })
    ).then(function () {
      var idnchart = new Highcharts.Chart({
        chart: {
          renderTo: "idnchart",
          backgroundColor: "#fff",
          zoomType: "x",
          marginBottom: 120,
          marginTop: 50,
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
        },
        exporting: {
          enabled: false,
        },
        colors: ["#ffae31"],
        title: "",
        subtitle: "",
        xAxis: {
          type: "datetime",
          minRange: 14 * 24 * 3600000, // fourteen days
          dateTimeLabelFormats: {
            second: "%m.%Y",
            minute: "%H:%M",
            hour: "%H:%M",
            day: "%d.%m",
            week: "%d.%m.%Y",
            month: "%d.%m.%Y",
            year: "%Y",
          },
          title: {
            text: null,
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
          backgroundColor: "#fff",
          borderRadius: 0,
          borderWidth: 0,
          style: {
            color: "#212224",
          },
          formatter: function () {
            return (
              '<b style="color:' +
              this.series.color +
              '">' +
              this.y +
              "<br>" +
              Highcharts.dateFormat("%e.%m.%Y", this.x)
            );
          },
        },
        plotOptions: {
          line: {
            marker: {
              radius: 2,
              enabled: false,
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2,
              },
            },
            threshold: null,
          },
        },

        legend: {
          enabled: false,
        },
        series: [
          {
            //pointInterval:12 * 3600 * 100,
            pointInterval: 24 * 3600 * 1000,
            name: "Koormus",
            data: idnGraphData,
          },
        ],
      });
    });
  };

  var initDnsChart = function () {
    var dnssecGraphData,
      totalGraphData,
      dnssecCompositionData = [];

    $.when
      .apply($, [
        $.ajax({
          type: "GET",
          url: DATA_HOST + "/data_dnssec.json",
          dataType: "text",
        }).done(function (response) {
          dnssecGraphData = JSON.parse(
            response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
          );
          $.each(dnssecGraphData, function (i, array) {
            array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
          });
        }),
        $.ajax({
          type: "GET",
          url: DATA_HOST + "/data_domains.json",
          dataType: "text",
        }).done(function (response) {
          totalGraphData = JSON.parse(
            response.replace(/\][\w\n]*,[\w\n]*\]/, "]]")
          );
          $.each(totalGraphData, function (i, array) {
            array[0] = parseInt(array[0] - 21 * 60 * 59 + "000", 10);
          });
        }),
      ])
      .then(function () {
        dnssecCompositionData = [
          {
            name: window.translations.dnssec_chart.dnssec_domains,
            y: dnssecGraphData[dnssecGraphData.length - 1][1],
            color: "#48A23F",
          },
          {
            name: window.translations.dnssec_chart.regular_domains,
            y:
              totalGraphData[totalGraphData.length - 1][1] -
              dnssecGraphData[dnssecGraphData.length - 1][1],
            color: "#FF6E00",
          },
        ];

        var dnssecchart = new Highcharts.Chart({
          chart: {
            renderTo: "dnssecchart",
            backgroundColor: "#fff",
            zoomType: "x",
            marginBottom: 120,
            marginTop: 50,
            spacingTop: 40,
            spacingRight: 40,
            spacingBottom: 40,
            spacingLeft: 40,
            resetZoomButton: {
              relativeTo: "chart",
              position: {
                x: -1,
                y: 0,
              },
            },
          },
          exporting: {
            enabled: false,
          },
          colors: ["#ffae31"],
          title: "",
          subtitle: "",
          labels: {
            items: [
              {
                html: window.translations.dnssec_chart.dnssec_proportion,
                style: {
                  left: "50px",
                  top: "18px",
                },
              },
            ],
          },
          xAxis: {
            type: "datetime",
            minRange: 14 * 24 * 3600000, // fourteen days
            dateTimeLabelFormats: {
              second: "%m.%Y",
              minute: "%H:%M",
              hour: "%H:%M",
              day: "%d.%m",
              week: "%d.%m.%Y",
              month: "%d.%m.%Y",
              year: "%Y",
            },
            title: {
              text: null,
            },
            endOnTick: false,
            showFirstLabel: true,
            startOnTick: false,
          },
          yAxis: {
            title: "",
            min: 0,
            showLastLabel: true,
          },
          plotOptions: {
            line: {
              marker: {
                radius: 2,
                enabled: false,
              },
              lineWidth: 2,
              states: {
                hover: {
                  lineWidth: 2,
                },
              },
              threshold: null,
            },
          },
          legend: {
            enabled: false,
          },
          series: [
            {
              //pointInterval:12 * 3600 * 100,
              pointInterval: 24 * 3600 * 1000,
              name: window.translations.dnssec_chart.dnssec_total_domains,
              data: dnssecGraphData,
              tooltip: {
                xDateFormat: "%e.%m.%Y",
              },
            },
            {
              type: "pie",
              name: window.translations.dnssec_chart.total_domains,
              data: dnssecCompositionData,
              center: [100, 80],
              size: 100,
              showInLegend: false,
              dataLabels: {
                formatter: function () {
                  console.log(this.point);
                  return this.y > 5
                    ? Number(this.point.percentage).toFixed(2) +
                        "% " +
                        this.point.name
                    : null;
                },
                color: "#ffffff",
                distance: -30,
              },
            },
          ],
        });
      });
  };

  var initCountryChart = function () {
    var mapGraphData;

    $.when(
      $.get(DATA_HOST + "/country_count.json", function (response) {
        mapGraphData = response;
      })
    ).done(function () {
      // Initiate the chart
      $("#countrychart").highcharts("Map", {
        title: {
          text: null,
        },

        mapNavigation: {
          enabled: true,
          buttonOptions: {
            verticalAlign: "bottom",
          },
        },
        exporting: {
          enabled: false,
        },
        legend: {
          layout: "horizontal",
          floating: true,
        },
        colorAxis: {
          min: 1,
          max: 200000,
          type: "logarithmic",
          minColor: "#A4D09F",
          maxColor: "#32712C",
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
            },
          },
        },
        chart: {
          backgroundColor: "#fff",
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
        },
        credits: {
          enabled: false,
        },
        tooltip: {
          borderRadius: 1,
          borderWidth: 1,
          formatter: function () {
            return this.point.name + "<br><b>" + this.point.value + "</b>";
          },
        },
        series: [
          {
            data: mapGraphData,
            mapData: Highcharts.maps.world,
            joinBy: "code",
            states: {
              hover: {
                color: "#f69240",
              },
            },
            tooltip: {
              borderRadius: 1,
              borderWidth: 1,
            },
          },
        ],
      });
    });
  };

  var initTextChart = function () {
    var textChartData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/domain-count-by-registrant.json",
        dataType: "JSON",
      }).done(function (response) {
        if (response) {
          Object.keys(response).map(function (key) {
            var value = parseFloat(response[key]);
            var count = parseFloat(key);
            if (count === 1) {
              textChartData[0] = value;
            } else if (count === 2) {
              textChartData[1] = value;
            } else if (count === 3) {
              textChartData[2] = value;
            } else if (count === 4) {
              textChartData[3] = value;
            } else if (count === 5) {
              textChartData[4] = value;
            } else if (count > 5 && count < 11) {
              textChartData[5] += value;
            } else if (count > 10 && count < 26) {
              textChartData[6] += value;
            } else if (count > 25 && count < 51) {
              textChartData[7] += value;
            } else if (count > 50 && count < 101) {
              textChartData[8] += value;
            } else if (count > 100 && count < 201) {
              textChartData[9] += value;
            } else if (count > 200 && count < 501) {
              textChartData[10] += value;
            } else if (count > 500 && count < 1001) {
              textChartData[11] += value;
            } else if (count > 1000 && count < 2001) {
              textChartData[12] += value;
            } else if (count > 2000) {
              textChartData[13] += value;
            }
          });
        }
      })
    ).then(function () {
      var textchart = new Highcharts.Chart({
        chart: {
          renderTo: "textchart",
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          zoomType: "x",
          backgroundColor: "#fff",
          type: "pie",
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: "Raleway",
            color: "#212224",
            fontSize: 14,
          },
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
          options3d: {
            enabled: true,
            alpha: 45,
            beta: 0,
          },
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: "pointer",
            showInLegend: true,
            depth: 35,
            dataLabels: {
              enabled: true,
              format: "{point.name}",
            },
          },
        },
        tooltip: {
          pointFormat: "{series.name}: <b>{point.y}</b>",
        },
        title: {
          text: window.translations.registrations_chart.title,
        },
        series: [
          {
            type: "pie",
            name: window.translations.registrations_chart.legend_title,
            data: [
              {
                name: window.translations.registrations_chart.text_1_domain,
                y: textChartData[0],
                color: "#0085CA",
              },
              {
                name: window.translations.registrations_chart.text_2_domains,
                y: textChartData[1],
                color: "#48A23F",
              },
              {
                name: window.translations.registrations_chart.text_3_domains,
                y: textChartData[2],
                color: "#ECAC56",
              },
              {
                name: window.translations.registrations_chart.text_4_domains,
                y: textChartData[3],
                color: "#00BDF2",
              },
              {
                name: window.translations.registrations_chart.text_5_domains,
                y: textChartData[4],
                color: "#A7A8AA",
              },
              {
                name: window.translations.registrations_chart
                  .text_6_to_10_domains,
                y: textChartData[5],
                color: "#003D63",
              },
              {
                name: window.translations.registrations_chart
                  .text_11_to_25_domains,
                y: textChartData[6],
                color: "#3EB54C",
              },
              {
                name: window.translations.registrations_chart
                  .text_26_to_50_domains,
                y: textChartData[7],
                color: "#00BABE",
              },
              {
                name: window.translations.registrations_chart
                  .text_51_to_100_domains,
                y: textChartData[8],
                color: "#FBAA19",
              },
              {
                name: window.translations.registrations_chart
                  .text_101_to_200_domains,
                y: textChartData[9],
                color: "#FF6E00",
              },
              {
                name: window.translations.registrations_chart
                  .text_201_to_500_domains,
                y: textChartData[10],
                color: "#447BBF",
              },
              {
                name: window.translations.registrations_chart
                  .text_501_to_1000_domains,
                y: textChartData[11],
                color: "#3A3794",
              },
              {
                name: window.translations.registrations_chart
                  .text_1001_to_2000_domains,
                y: textChartData[12],
                color: "#009DE1",
              },
              {
                name: window.translations.registrations_chart
                  .text_2001_or_more_domains,
                y: textChartData[13],
                color: "#000",
              },
            ],
          },
        ],
      });
    });
  };

  var initOrgChart = function () {
    var orgChartData = [];
    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/data_org_type.json",
        dataType: "JSON",
      }).done(function (response) {
        if (response) {
          for (var key in response) {
            if (response.hasOwnProperty(key)) {
              orgChartData.push(response[key]);
            }
          }
        }
      })
    ).then(function () {
      var orgchart = new Highcharts.Chart({
        chart: {
          renderTo: "orgchart",
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          zoomType: "x",
          backgroundColor: "#fff",
          type: "pie",
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: "Raleway",
            color: "#212224",
            fontSize: 14,
          },
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 0,
            },
          },
          options3d: {
            enabled: true,
            alpha: 45,
            beta: 0,
          },
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: "pointer",
            showInLegend: true,
            depth: 35,
            dataLabels: {
              enabled: true,
              format: "{point.name}",
            },
          },
        },
        tooltip: {
          pointFormat: "{series.name}: <b>{point.y}</b>",
        },
        title: {
          text: window.translations.org_chart.title,
        },
        series: [
          {
            type: "pie",
            name: window.translations.org_chart.legend_title,
            data: [
              {
                name: window.translations.org_chart.t1,
                y: parseFloat(orgChartData[0]),
                color: "#0085CA",
              },
              {
                name: window.translations.org_chart.t7,
                y: parseFloat(orgChartData[1]),
                color: "#48A23F",
              },
              {
                name: window.translations.org_chart.t8,
                y: parseFloat(orgChartData[2]),
                color: "#003D63",
              },
              {
                name: window.translations.org_chart.t9,
                y: parseFloat(orgChartData[3]),
                color: "#FF6E00",
              },
            ],
          },
        ],
      });
    });
  };

  var initRenewChart = function () {
    var renewGraphData = {
      categories: [],
      y: {
        3: [],
        6: [],
        9: [],
        12: [],
        24: [],
        36: [],
        48: [],
        60: [],
        72: [],
        84: [],
        96: [],
        108: [],
        120: [],
      },
    };

    $.when(
      $.ajax({
        type: "GET",
        url: DATA_HOST + "/dump-create-renew-hist.json",
        dataType: "JSON",
      }).done(function (response) {
        $.each(response, function (date, data) {
          renewGraphData["categories"].push(date);
          $.each(data, function (key, value) {
            if (!renewGraphData["y"].hasOwnProperty(key)) {
              return;
            }
            renewGraphData["y"][key].push(value);
          });
        });
      })
    ).then(function () {
      var renewchart = new Highcharts.Chart({
        chart: {
          renderTo: "renewchart",
          backgroundColor: "#fff",
          zoomType: "x",
          marginBottom: 120,
          marginTop: 70,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          height: 600,
          style: {
            fontFamily: "Raleway",
            color: "#212224",
            fontSize: 14,
          },
          resetZoomButton: {
            relativeTo: "chart",
            position: {
              x: -1,
              y: 60,
            },
          },
        },
        exporting: {
          enabled: false,
        },
        colors: [
          "#0085CA",
          "#48A23F",
          "#ECAC56",
          "#00BDF2",
          "#A7A8AA",
          "#003D63",
          "#3EB54C",
          "#00BABE",
          "#FBAA19",
          "#FF6E00",
          "#447BBF",
          "#3A3794",
          "#009DE1",
        ],
        title: "",
        subtitle: "",
        xAxis: {
          categories: renewGraphData["categories"],
          tickmarkPlacement: "on",
        },
        yAxis: {
          title: {
            text: window.translations.renew_chart.y_axis,
          },
          min: 0,
          showLastLabel: true,
        },
        plotOptions: {
          line: {
            marker: {
              radius: 2,
              enabled: false,
            },
            lineWidth: 2,
            states: {
              hover: {
                lineWidth: 2,
              },
            },
            threshold: null,
          },
        },
        legend: {
          enabled: true,
          floating: true,
          align: "center",
          verticalAlign: "top",
          borderWidth: 0,
          itemStyle: {
            fontWeight: "bold",
          },
          itemMarginBottom: 8,
        },
        series: [
          {
            name: "3 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["3"],
          },
          {
            name: "6 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["6"],
          },
          {
            name: "9 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["9"],
          },
          {
            name: "12 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["12"],
          },
          {
            name: "24 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["24"],
          },
          {
            name: "36 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["36"],
          },
          {
            name: "48 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["48"],
          },
          {
            name: "60 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["60"],
          },
          {
            name: "72 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["72"],
          },
          {
            name: "84 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["84"],
          },
          {
            name: "96 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["96"],
          },
          {
            name: "108 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["108"],
          },
          {
            name: "120 " + window.translations.renew_chart.months,
            data: renewGraphData["y"]["120"],
          },
        ],
      });
    });
  };

  // <--- END ACCORDION --->

  var initArticlePage = function initArticlePage() {
    $("body").on("change", 'input[name="article[topic]"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        topic: value,
      });
    });

    $("body").on(
      "change",
      'select[name="article[topicselect]"]',
      function (event) {
        var value = $(event.target).val();
        $('input[name="article[topic]"]').val(value).change();
      }
    );

    $("body").on("change", 'select[name="article[type]"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        type: value,
      });
    });

    $("body").on("change", 'input[name="article[type]"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        type: value,
      });
    });
    $("body").on(
      "keyup",
      'input[name="article[topic]"],input[name="article[type]"]',
      function (event) {
        if (event.keycode == 13) {
          event.preventDefault();
          this.blur();
          alert("Salvestatud!");
        }
      }
    );
  };

  var loadDomainData = function loadDomainData() {
    var url = COUNT_HOST + "count.json";
    $.get(url, function (response) {
      $(".domain-stats .all > span").text(response.total);
      $(".domain-stats .today > span").text(response.total_today);
    });
  };

  var initFrontPage = function initFrontPage() {
    loadDomainData();

    $(".hero-slider-slides").owlCarousel({
      items: 1,
      loop: true,
      nav: false,
      autoplay: true,
      autoplayTimeout: 10000,
      animateOut: "fadeOut",
      animateIn: "fadeIn",
    });

    $("#domain-search").on("submit", function (e) {
      var val = $("#searchw").val();
      var action = $(e.target).attr("action");
      $(e.target).attr("action", action + val);
    });

    $("body").on("change", 'input[name="statistics_link"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        statisticsLink: value,
      });
      alert("Salvestatud!");
    });

    $("body").on("change", 'input[name="auctions_link"]', function (event) {
      var value = $(event.target).val();
      pageData.set({
        auctionsLink: value,
      });
      alert("Salvestatud!");
    });
  };

  var initTabs = function initTabs() {
    if ($(".content-tabs").length) {
      $(".content-tabs--nav .item").click(function (e) {
        e.preventDefault();
        var tabIndex = $(e.currentTarget).index();
        var tab = $(".content-tabs--item").get(tabIndex);
        if ($(tab).hasClass("u-active")) {
          return false;
        } else {
          $(e.currentTarget).parent().find(".u-active").removeClass("u-active");
          $(e.currentTarget).addClass("u-active");
          $(tab).parent().find(".u-active").removeClass("u-active");
          $(tab).addClass("u-active");
        }
      });
    }
  };

  // header search
  const initHeaderSearch = () => {
    const $searchForm = $(".js-search-form");
    if ($searchForm.length > 0) {
      const $searchResultsModal = $(".js-voog-search-modal");
      const $searchResults = $(".js-voog-search-result");
      const $searchInput = $searchForm.find(".js-search-form-input");

      $searchInput.on("focus", function () {
        if ($searchResultsModal.hasClass("has-results")) {
          $searchResultsModal.show();
        }
      });

      $searchForm.on("submit", function (e) {
        e.preventDefault();
        const query = $searchInput.val();
        $searchResultsModal.removeClass("has-results");
        $searchResultsModal.show();
        $searchResults.html(
          '<div class="search-loader-wrap"><div class="search-loader"></div></div>'
        );

        $.ajax({
          url: "/admin/api/search",
          method: "GET",
          data: {
            q: query,
            type: "page,article",
            per_page: 200,
            order: "updated_at desc",
            lang: window.pageLanguage,
          },
          success: function (data) {
            console.log(data);
            $searchResults.html("");
            if (data.result.length === 0) {
              const noResultsText = $searchResultsModal.data("noresults");
              $searchResults.html(
                `<div style="color: #212224">${noResultsText}</div>`
              );
            } else {
              $searchResultsModal.addClass("has-results");
              const orderedResults = data.result.sort((a, b) => {
                if (a.updated_at > b.updated_at) {
                  return -1;
                }
                if (a.updated_at < b.updated_at) {
                  return 1;
                }
                return 0;
              });
              orderedResults.forEach((item) => {
                $searchResults.append(`
									<div class="voog-search-modal-result"><h3><a href="${item.path}">${item.title}</a></h3></div>
								`);
              });
            }
          },
        });
      });

      $("body").on("click", function (e) {
        if (!$(e.target).closest(".js-search-toolbar").length) {
          $searchResultsModal.hide();
        }
      });

      $(".js-search-toggle").on("click", function (e) {
        $(".js-search").toggleClass("is-open");
      });
    }
  };

  $(window).resize(function () {
    initResponsive();
  });

  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    initMain: initMain,
    initFrontPage: initFrontPage,
    initArticlePage: initArticlePage,
    initAccordion: initAccordion,
  });
  initMain();
  initAccordion();
  initTabs();
  initResponsive();
  initHeaderSearch();
})(jQuery);
