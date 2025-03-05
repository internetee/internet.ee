//V1

/*
	l.add("pers", "images/pers.png",{}); //Load regural image
	l.add("Comforter:400"); //Load google font
	l.add("Peeb", "morse.woff2") //Load WOFF2 file
	l.add("Peeb", "morse.ttf") //Load TTF file
*/

var output = "";
var svgData = [];
var images;
class Loader {
	constructor() {
		this.input = [];
		this.output = {};
		this.total_loaded = 0;
	};

	add(name, file, options) {
		output += "- adding file " + name + "<br/>";
		document.getElementById("out").innerHTML = output;
		this.input.push({[name]:file}
        );
	};
	
	test(message, callback){
		if (typeof callback == "function") 
		callback(); 
	}
	

	load(func){
		
        
		
		if (this.total_loaded != this.input.length){
			var cur_name = Object.keys(this.input[this.total_loaded]);
			var cur_file = this.input[this.total_loaded][cur_name];
			
			output += "..loading " + cur_name+ "<br/>";
			document.getElementById("out").innerHTML = output;

			var re = /(?:\.([^.]+))?$/;
			var ext = re.exec(cur_file)[1];

			var font_ext = ["woff", "woff2", "ttf", "otf"]

			var _this = this;
			if (cur_file == undefined || font_ext.indexOf(ext) != -1){	
				var loadCustomFont = false;
				if (font_ext.indexOf(ext) != -1){
					loadCustomFont = true;
					var sheet = window.document.styleSheets[0];
					sheet.insertRule("@font-face {font-family: '" +cur_name+"';src:url('" +cur_file +"');}", sheet.cssRules.length);	
				}
				
				WebFont.load({

					...(loadCustomFont) && {
						custom: {
							families: cur_name,
						},
					},

					...(!loadCustomFont) && {
						google:{
							families: cur_name
						},
					},

					timeout: 2000,
					fontinactive: function(){
						output += "[!] font " +cur_name +" not loded <br/>";
						document.getElementById("out").innerHTML = output;

						console.warn("KONVABANNER: Font " + cur_name + " can't be loaded")

						_this.total_loaded ++;
						_this.load(func);

						
					},
					active: function() {  
						  setTimeout(() => {
							output += "+ font " +cur_name +" loded <br/>";
							document.getElementById("out").innerHTML = output;
							_this.total_loaded ++;
							_this.load(func)
							
						}, 50)
					},
					fontactive: function(familyName, fvd) {

						const el = document.createElement('div');
						el.className = "FONTLOADER_Konva"
						el.innerText = 'рü';//'';
						el.style.fontFamily = familyName;
						el.style.fontWeight = fvd.split("n")[1] * 100;
						el.style.position = 'absolute';
						el.style.left = 0;
						el.style.top = 0;
						
						el.style.width = "1px";
						el.style.height = "1px";
						el.style.overflow = "hidden";
						el.style.opacity = 0;
						
						document.body.appendChild(el);   
					},
				});

			}else{
                var re = /(?:\.([^.]+))?$/;
			    var ext = re.exec(cur_file)[1].toLowerCase();

                if (ext == "svg"){
                    var ajax = js_ajax(cur_file, 'get',  function(obj) {
                        var xml = obj.responseText;
                       // svgData.push({[cur_name]:xml});
                       svgData[cur_name] = xml;
                        loadImage()
                    })
                    
                }else{
                    loadImage()
                }	
			}
		}else{
			if (typeof func == "function"){
				images = this.output;
				func(this.output)
			}
		}

        function loadImage(){
            var img = new Image();
            img.onload = function(){
                output += "+ image " + cur_name +" loded <br/>";
                document.getElementById("out").innerHTML = output;
                _this.total_loaded ++;
                _this.load(func)
            }
            
            img.onerror = function(event){
                output += "error loading " + img.src +"<br/>";
                document.getElementById("out").innerHTML = output;
                _this.output[cur_name] = ""
                _this.total_loaded ++;
                _this.load(func)
            }
        
            if (document.location.toString().substr(0, 7) != "file://"){
                img.setAttribute('crossOrigin', 'Anonymous');
            }
            img.src = cur_file
            _this.output[cur_name] = img;
            //_this.output.push({[cur_name]:img})
        }
	};

   

    
}


function js_ajax(url, method, callback, params = null) {
    var obj;
    try {   
     obj = new XMLHttpRequest();  
    } catch(e){   
      try {     
        obj = new ActiveXObject("Msxml2.XMLHTTP");     
      } catch(e) {     
        try { 
          obj = new ActiveXObject("Microsoft.XMLHTTP");       
        } catch(e) {       
          alert("Your browser does not support Ajax.");       
          return false;       
        }     
      }   
    }
    obj.onreadystatechange = function() {
     if(obj.readyState == 4) {
        callback(obj);
     } 
    }
    obj.open(method, url, true);
    obj.send(params);
    return obj; 
}