;(function($) {
  'use strict';

  var initCeiro = function initCeiro(opts) {
  	$('.closebtn').click(function(){
  		$('.mdl').removeClass('u-open');
  	});

  // var initAccordion = function initAccordion() {
  //   if($('.accordion').length) {
  //     var aLink = $('[data-accordion-item]');
  //     aLink.on('click', function(e) {
  //       e.preventDefault();
  //       e.stopPropagation();
  //       var item = $(this).data('accordion-item');
  //       if ($(item).hasClass('accordion__item--active')) {
  //         hideAccordionItem(item);
  //       } else {
  //         showAccordionItem(item);          
  //       }
  //     });
  //   }
  // }

  // var showAccordionItem = function showAccordionItem(item) {
  //   $(item)
  //     .addClass('accordion__item--active')
  //     .find('.accordion__item__body').slideDown(300);      
  // }

  // var hideAccordionItem = function hideAccordionItem(item) {
  //   $(item)
  //     .removeClass('accordion__item--active')
  //     .find('.accordion__item__body').slideUp(300);
  // }
  $('[data-accordion-item]').click(function(){
    if($(this).data('accordion-item') == 'chart-total'){
      initTotalChart();
      initCountryChart();
    } else if ($(this).data('accordion-item') == 'chart-mix'){
      initMixChart();
    } else if ($(this).data('accordion-item') == 'chart-idn'){
      initIdnChart();
    } else if ($(this).data('accordion-item') == 'chart-dns'){
      initDnsChart();
    }
  });

  var DATA_HOST = '//data.internet.ee';

  var totalGraphData;
  var rda = '<div class="rda-container"><span class="rda-block"></span>Registreeritud domeenide arv</div>';

  var initTotalChart = function(){
      $.when(
      $.ajax({type: 'GET', url: DATA_HOST + '/data_domains.json', dataType: 'text'}).success(function(response) {
        totalGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(totalGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      })
    ).then(function() {
      var totalchart = new Highcharts.Chart({
        chart: {
          renderTo: 'totalchart',
          backgroundColor: '#fff',
          zoomType: 'x',
          // marginBottom: 120,
          // marginTop: 50,
          spacingTop: 40,
          spacingRight: 40,
          spacingBottom: 40,
          spacingLeft: 40,
          style: {
            fontFamily: 'Raleway',
            color: '#212224',
            fontSize: 14
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
            text: rda,
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
            formatter: function() {
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
          formatter: function() {
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
  }

  var initMixChart = function(){
    var registerGraphData, extendGraphData, deletionGraphData;

    $.when.apply($, [
      $.ajax({type: 'GET', url: DATA_HOST + '/data_create.json', dataType: 'text'}).success(function(response) {
        registerGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(registerGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      }),
      $.ajax({type: 'GET', url: DATA_HOST + '/data_renew.json', dataType: 'text'}).success(function(response) {
        extendGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(extendGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      }),
      $.ajax({type: 'GET', url: DATA_HOST + '/data_delete.json', dataType: 'text'}).success(function(response) {
        deletionGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(deletionGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      })
    ]).then(function() {
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
          spacingLeft: 40
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
            color: '#fff'
          },
          formatter: function() {
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
  }

  var initIdnChart = function(){
    var idnGraphData;

    $.when(
      $.ajax({type: 'GET', url: DATA_HOST + '/data_idn.json', dataType: 'text'}).success(function(response) {
        idnGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(idnGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      })
    ).then(function() {
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
          spacingLeft: 40
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
          formatter: function() {
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
  }
  
  var initDnsChart = function(){
    var dnssecGraphData;

    $.when(
      $.ajax({type: 'GET', url: DATA_HOST + '/data_dnssec.json', dataType: 'text'}).success(function(response) {
        dnssecGraphData = JSON.parse(response.replace(/\][\w\n]*,[\w\n]*\]/, "]]"));
        $.each(dnssecGraphData, function(i, array) {
          array[0] = parseInt(array[0] + '000', 10);
        });
      })
    ).then(function() {
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
          spacingLeft: 40
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
          formatter: function() {
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
  }

  var initCountryChart = function(){
    var mapGraphData;

    $.when(
      $.get(DATA_HOST + '/country_count.json').success(function(response, xhr) {
        mapGraphData = response;
      })
    ).done(function() {
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
            formatter: function() {
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
          spacingLeft: 40
        },
        credits: {
          enabled: false
        },
        tooltip: {
          borderRadius: 1,
          borderWidth: 1,

          formatter: function() {
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
  }


  }
  // Enables the usage of the initiations outside this file.
  window.site = $.extend(window.site || {}, {
    initCeiro: initCeiro
  });
  initCeiro();
})(jQuery);