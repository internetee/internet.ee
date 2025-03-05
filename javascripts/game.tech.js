//	V2
var anim_layer;
function animate(layers) {
	anim_layer = layers;



	updateAnimation()
	detect_konva_timeline();
}
var detect_attempts = 0
function detect_konva_timeline() {
	if (typeof begin_timeline === "function") {
		begin_timeline();
	} else {
		if (detect_attempts < 3) {
			setTimeout(() => {
				detect_attempts++;
				detect_konva_timeline();
			}, 100);
		}
	}

}

function updateAnimation() {
	if (typeof stats != "undefined") stats.begin();
	if (typeof parent.stats != "undefined") parent.stats.begin();



	if (anim_layer instanceof Array) {
		for (var i = 0; i < anim_layer.length; i++) {
			anim_layer[i].batchDraw()
		}
	} else {
		anim_layer.batchDraw()
	}



	requestAnimationFrame(updateAnimation);
	if (typeof stats != "undefined") stats.end();
	if (typeof parent.stats != "undefined") parent.stats.end();
}




var maxWidth = true;
var fixedWidth = false;
var bgSmall = false;

var width = Number(getMeta("game.size").split("width=")[1].split(",")[0]);
var height = Number(getMeta("game.size").split("height=")[1].split(",")[0]);

if (document.getElementById("bgSmall") != undefined) {
	bgSmall = true;
	document.getElementById("bgSmall").style.width = width + "px";
	document.getElementById("bgSmall").style.height = height + "px";
}

document.getElementById("container").style.width = width + "px";
document.getElementById("container").style.height = height + "px";

var stage = new Konva.Stage({
	container: 'container',
	width: width,
	height: height
});



window.onresize = function (event) {
	resize();
};
function resize() {
	var win = window,
		d = document,
		e = d.documentElement,
		g = d.getElementsByTagName('body')[0],
		w = win.innerWidth || e.clientWidth || g.clientWidth,
		h = win.innerHeight || e.clientHeight || g.clientHeight;

	sx = 1;
	sx = Math.min(
		w / width,
		h / height
	);
	if (maxWidth) {
		if (w < width) {
			sx = w / width;
		} else if (w >= width) {
			sx = 1;
		}
	}
	if (fixedWidth) {
		sx = 1;
	}
	document.getElementById("container").style.transform = "translateX(-50%) " + "scale(" + sx + ")"


	if (bgSmall) {
		if (window.innerHeight < 105) { //105
			document.getElementById("bgSmall").style.display = "block"
		} else if (window.innerHeight > 105) {
			document.getElementById("bgSmall").style.display = "none"
		};
	}
}
resize();



function getMeta(metaName) {
	const metas = document.getElementsByTagName('meta');

	for (let i = 0; i < metas.length; i++) {
		if (metas[i].getAttribute('name') === metaName) {
			return metas[i].getAttribute('content');
		}
	}

	return '';
}

/*************************************
************ MIXD ********************
*************************************/


var bgcol = window.getComputedStyle(document.getElementById("container"), null).getPropertyValue("background-color")
console.log('%c MADE WITH ❤ // MIXD.EE', 'background: ' + bgcol + '; color: ' + invert(bgcol) + ';padding:10px; border-radius:3px;');

function invert(rgb) {
	rgb = [].slice.call(arguments).join(",").replace(/rgb\(|\)|rgba\(|\)|\s/gi, '').split(',');
	if ((rgb[0] * 0.299 + rgb[1] * 0.587 + rgb[2] * 0.114) > 186) {
		return "#000000";
	} else {
		return "#ffffff";
	}

}