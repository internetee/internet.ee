$(document).ready(function() {
  'use strict';

  var DATA_HOST = '//data.internet.ee';

  var totalGraphData;

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
        marginBottom: 120,
        marginTop: 50,
        width: 100%
      },
      exporting: {
        enabled: false
      },
      colors: ['#FF6E00'],
      title: "",
      subtitle: "Registreeritud domeenide arv",
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

        labels: {
          formatter: function() {
            if (this.value === 25000) {
              return "25 tuh";
            } else if (this.value === 50000) {
              return "50 tuh";
            } else if (this.value === 75000) {
              return "75 tuh";
            } else if (this.value === 100000) {
              return "100 tuh";
            } else {
              return this.value;
            }
          }
        }
      },
      tooltip: {
        backgroundColor: 'rgba(0,0,0,.75)',
        borderRadius: 4,
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
        backgroundColor: '#f2f4f5',
        zoomType: 'x',
        marginBottom: 120,
        marginTop: 50,
        width: 540
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
        backgroundColor: 'rgba(0,0,0,.75)',
        borderRadius: 4,
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
        backgroundColor: '#f2f4f5',
        zoomType: 'x',
        marginBottom: 120,
        marginTop: 50,
        width: 540
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
        backgroundColor: 'rgba(0,0,0,.75)',
        borderRadius: 4,
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
        backgroundColor: '#f2f4f5',
        zoomType: 'x',
        marginBottom: 120,
        marginTop: 50,
        width: 540
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
        backgroundColor: 'rgba(0,0,0,.75)',
        borderRadius: 4,
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
        width: 540,
        height: 320,
        backgroundColor: '#f2f4f5',
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
});
