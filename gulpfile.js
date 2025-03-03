const { src, dest, watch, series } = require("gulp");
const notify = require("gulp-notify");
const sass = require("gulp-sass")(require("sass"));
const postcss = require("gulp-postcss");
const autoprefixer = require("autoprefixer");
const cssnano = require("cssnano");
const uglify = require("gulp-uglify");
const concat = require("gulp-concat");

const paths = {
  dist: {
    css: "stylesheets/",
    js: "javascripts/",
  },
  scss: "sources/stylesheets/main.scss",
  styles: "sources/stylesheets/**/*.scss",
  scripts: "sources/javascripts/**/*.js",
  js: {
    main: "sources/javascripts/main.js",
    charts: [
      "sources/javascripts/charts/highcharts.js",
      "sources/javascripts/charts/map.js",
      "sources/javascripts/charts/data.js",
      "sources/javascripts/charts/highcharts-options.js",
      "sources/javascripts/charconst sass = require('gulp-sass')(require('sass'));ts/world-map.js",
    ],
  },
  print: "sources/stylesheets/print.css",
  voogFiles: [
    "assets/",
    "components/",
    "images/",
    "javascripts/",
    "layouts/",
    "stylesheets/",
  ],
};

function styles() {
  return src(paths.scss)
    .pipe(sass())
    .pipe(postcss([autoprefixer(), cssnano()]))
    .pipe(dest(paths.dist.css))
    .pipe(notify({ title: "Compile", message: "Styles" }));
}

function print() {
  return src(paths.print)
    .pipe(postcss([autoprefixer(), cssnano()]))
    .pipe(dest(paths.dist.css))
    .pipe(notify({ title: "Compile", message: "Print styles" }));
}

function scripts() {
  return src(paths.js.main)
    .pipe(uglify())
    .pipe(dest(paths.dist.js))
    .pipe(notify({ title: "Compile", message: "Scripts" }));
}

function charts() {
  return src(paths.js.charts)
    .pipe(uglify())
    .pipe(concat("charts.js"))
    .pipe(dest(paths.dist.js))
    .pipe(notify({ title: "Compile", message: "Charts" }));
}

exports.styles = styles;
exports.scripts = scripts;
exports.charts = charts;
exports.print = print;
exports.watch = () => {
  watch(paths.styles, styles);
  watch(paths.scripts, scripts);
  watch(paths.js.charts, charts);
};
exports.default = series(styles, scripts, charts, print);
