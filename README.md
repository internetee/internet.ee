#Front end source code for internet.ee site

##Set up the developing environment
To modify this template [Node Package Manager](https://www.npmjs.org/) (or [Node.js](http://www.nodejs.org/)) must be installed.

To set up the local developing environment, clone this repository and run the following commands:

* Install dependencies: ```npm install```
* Set up the [Voog Developer Toolkit](http://www.voog.com/developers/kit)

##Watch and update modifications
* To watch (and synchronize) modified files in real time (**on the default site**) start the watcher task: ```npm start```
    * Default site is the first site defined in the **.voog** configuration file.
    * If the **.voog** file is missing, the watcher will only update the output files on the local computer.
* To watch **dev site** start the watcher: ```npm run dev```
* To upload all the source files to Voog: ```npm run deploy```

##Remove unused files
```
kit remove stylesheets/ceiro.css stylesheets/ceiro.min.css stylesheets/wattie.css stylesheets/wattie.min.css stylesheets/martin.css stylesheets/martin.min.css stylesheets/main.min.css stylesheets/owl.carousel.min.css javascripts/world-map.min.js javascripts/wattie.js javascripts/wattie.min.js javascripts/martin.js javascripts/maritn.min.js javascripts/mark.min.js javascripts/jquery-tools.min.js javascripts/jquery-3.1.1.min.js javascripts/highcharts.js javascripts/highcharts.min.js javascripts/charts.min.js javascripts/ceiro.js javascripts/ceiro.min.js javascripts/map.js javascripts/map.min.js javascripts/main.min.js javascripts/modernizr.js javascripts/modernizr.min.js javascripts/statistics.js javascripts/statistics.min.js javascripts/slick.min.js
```
