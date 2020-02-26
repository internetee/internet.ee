module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Builds custom modernizr script.
    modernizr: {
      build: {
        'devFile' : 'bower_components/modernizr/modernizr.js',
        'outputFile' : 'javascripts/modernizr.js',
        'tests': [
          'flexbox',
          'svg'
        ],
        'uglify' : false
      }
    },

    // Copies the javascript source files to the javascripts folder.
    copy: {
      main: {
        src: 'sources/javascripts/statistics.js',
        dest: 'javascripts/statistics.js'
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'bower_components/moment/min/moment-with-locales.min.js',
          'node_modules/punycode/punycode.js',
          'sources/javascripts/promise.min.js',
          'sources/javascripts/object-assign.min.js',
          'sources/javascripts/base.js'
        ],
        dest: 'javascripts/main.js'
      },

      libs: {
        src: [
          'sources/javascripts/highcharts.js',
          'sources/javascripts/map.js',
          'sources/javascripts/data.js',
          'sources/javascripts/highcharts-options.js',
          'sources/javascripts/world-map.js'
        ],
        dest: 'javascripts/charts.js'
      },

      print: {
        src: 'sources/stylesheets/print.css',
        dest: 'stylesheets/print.css'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: 'main.js',
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      },

      libs: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            'charts.js',
            'modernizr.js',
            'statistics.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build: {
        options: {
          style: 'expanded'
        },
        files: [{
          expand: true,
          cwd: 'sources/stylesheets',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      },

      print: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          'print.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    autoprefixer: {
      build: {
        options: {
          browsers: ['last 2 versions', 'ie 11']
        },
        files: [{
          expand: true,
          cwd: 'stylesheets',
          src: 'main.css',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },
    },

    // Executes the Voog Kit toolkit manifest generation and file upload commands.
    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },

      kit: {
        cmd: function(file) {
          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + file;
          } else {
            return 'kit push ' + file;
          }
        }
      },

      pushJS: {
        cmd: function() {
          var src = [
            'javascripts/main.js',
            'javascripts/main.min.js'
          ];

          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + src.join(' ');
          } else {
            return 'kit push ' + src.join(' ');
          }
        }
      }
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      jsMain: {
        files: [
          'sources/javascripts/base.js'
        ],
        tasks: ['concat:build', 'uglify:build', 'exec:pushJS']
      },

      jsLibs: {
        files: [
          'sources/javascripts/highcharts.js',
          'sources/javascripts/map.js',
          'sources/javascripts/data.js',
          'sources/javascripts/world-map.js'
        ],
        tasks: ['concat:libs', 'uglify:libs', 'exec:kit:javascripts/*.js']
      },

      scss: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss'
        ],
        tasks: ['sass:build', 'cssmin:build', 'autoprefixer:build', 'exec:kit:stylesheets/*.css']
      },

      css: {
        files: ['sources/stylesheets/*.css'],
        tasks: ['concat:print', 'cssmin:print', 'exec:kit:stylesheets/*.css']
      },

      voog: {
        files: ['layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-autoprefixer');

  grunt.registerTask('default', ['modernizr', 'copy', 'concat', 'uglify', 'sass', 'cssmin']);

  grunt.event.on('watch', function(action, filepath, target) {
    var tasks = ['voog'];
    if (tasks.indexOf(target) > -1) {
      if (action == 'added' || action == 'deleted') {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (grunt.file.exists('.voog')) {
        if (action != 'deleted') {
          grunt.task.run([('exec:kit:' + filepath)]);
        }
      }
    }
  });
};
