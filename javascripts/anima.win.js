
var stageWin = createStage('anima-win', 'ad.size');


var startTime = Math.round(performance.now());
var l = new Loader;


//	Good elements Victory
l.add("goodVictoryBody", "images/win-goodVictoryBody.png");
l.add("goodVictoryArm1up", "images/win-goodVictoryArm1up.png");
l.add("goodVictoryArm1down", "images/win-goodVictoryArm1down.png");
l.add("goodVictoryArm2up", "images/win-goodVictoryArm2up.png");
l.add("goodVictoryArm2down", "images/win-goodVictoryArm2down.png");
l.add("goodVictoryLeg1up", "images/win-goodVictoryLeg1up.png");
l.add("goodVictoryLeg1down", "images/win-goodVictoryLeg1down.png");
l.add("goodVictoryLeg2up", "images/win-goodVictoryLeg2up.png");
l.add("goodVictoryLeg2down", "images/win-goodVictoryLeg2down.png");
l.add("goodVictoryShadow", "images/win-goodVictoryShadow.png");


l.load(buildStage)
document.getElementById("out").innerHTML = "start2";


//fixedWidth = true
//maxWidth = false;
// if (window.location.hash.substr(1) == "ignorewidth") maxWidth = true;
// resize();


function buildStage() {
	var endTime = Math.round(performance.now());
		console.log("Magic just happened in " + ((endTime-startTime)/1000) + " sec")
	var layer = new Konva.Layer({ opacity: 0 });
	stageWin.add(layer)


	goodGuyVictory = new Konva.Group({
		x: 40,
		y: 80,
		offset: {
			x: images.goodVictoryShadow.width / 2,
			y: images.goodVictoryShadow.height / 2,
		}
	});
	goodGuyVictory.reposition();
	layer.add(goodGuyVictory);

	goodGuyVictory.shadow = new Konva.Image({
		image: tint(images.goodVictoryShadow, "#dedada"),
		offset: {
			x: 158,
			y: 411
		}
	});
	goodGuyVictory.shadow.reposition();
	goodGuyVictory.add(goodGuyVictory.shadow)

	// ARM1 //////////////////

	goodGuyVictory.arm1 = new Konva.Group({
		offset: {
			x: 205,
			y: 114
		}
	});
	goodGuyVictory.arm1.reposition();
	goodGuyVictory.add(goodGuyVictory.arm1);

	goodGuyVictory.arm1_up = new Konva.Image({
		image: images.goodVictoryArm1up
	});
	goodGuyVictory.arm1.add(goodGuyVictory.arm1_up);

	goodGuyVictory.arm1_down = new Konva.Image({
		image: images.goodVictoryArm1down,
		offset: {
			x: 259,
			y: 75
		}
	});
	goodGuyVictory.arm1_down.reposition()
	goodGuyVictory.arm1.add(goodGuyVictory.arm1_down);


	// ARM2 //////////////////

	goodGuyVictory.arm2 = new Konva.Group({
		offset: {
			x: 128,
			y: 112
		}
	});
	goodGuyVictory.arm2.reposition();
	goodGuyVictory.add(goodGuyVictory.arm2);

	goodGuyVictory.arm2_up = new Konva.Image({
		image: images.goodVictoryArm2up
	});
	goodGuyVictory.arm2.add(goodGuyVictory.arm2_up);

	goodGuyVictory.arm2_down = new Konva.Image({
		image: images.goodVictoryArm2down,
		offset: {
			x: 70,
			y: 73
		}
	});
	goodGuyVictory.arm2_down.reposition()
	goodGuyVictory.arm2.add(goodGuyVictory.arm2_down);



	// LEG 1 //////////////////

	goodGuyVictory.leg1 = new Konva.Group({
		offset: {
			x: 186,
			y: 188
		}
	});
	goodGuyVictory.leg1.reposition();
	goodGuyVictory.add(goodGuyVictory.leg1);

	goodGuyVictory.leg1_up = new Konva.Image({
		image: images.goodVictoryLeg1up
	});
	goodGuyVictory.leg1.add(goodGuyVictory.leg1_up);

	goodGuyVictory.leg1_down = new Konva.Image({
		image: images.goodVictoryLeg1down,
		offset: {
			x: 189,
			y: 274
		}
	});
	goodGuyVictory.leg1_down.reposition()
	goodGuyVictory.leg1.add(goodGuyVictory.leg1_down);


	// LEG 2 //////////////////

	goodGuyVictory.leg2 = new Konva.Group({
		offset: {
			x: 135,
			y: 187
		}
	});
	goodGuyVictory.leg2.reposition();
	goodGuyVictory.add(goodGuyVictory.leg2);

	goodGuyVictory.leg2_up = new Konva.Image({
		image: images.goodVictoryLeg2up
	});
	goodGuyVictory.leg2.add(goodGuyVictory.leg2_up);

	goodGuyVictory.leg2_down = new Konva.Image({
		image: images.goodVictoryLeg2down,
		offset: {
			x: 140,
			y: 264
		}
	});
	goodGuyVictory.leg2_down.reposition()
	goodGuyVictory.leg2.add(goodGuyVictory.leg2_down);


	// BODY //////////////////

	goodGuyVictory.body = new Konva.Group({
		offset: {
			x: 253,
			y: 181
		}
	});
	goodGuyVictory.add(goodGuyVictory.body);
	goodGuyVictory.body.reposition();

	goodGuyVictory.body.add(new Konva.Image({ image: images.goodVictoryBody }))


	let clone = goodGuyVictory.clone({});
	layer.add(clone);
	clone.cache();
	clone.filters([Konva.Filters.Grayscale]);
	clone.moveDown();
	clone.hide();

	/* ---------------------------------------------------------------------------------*/
	/* -------------------------------     ANIMATION   ---------------------------------*/
	/* ---------------------------------------------------------------------------------*/

	delay = 0;
	tl = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "main", paused: false });
	tl.set(layer, { opacity: 1 }, delay);

	delay = 0;
	tlGoodVictoryArms = gsap.timeline({ repeat: -1, repeatDelay: 0.1, name: "good victory arms", paused: false });
	delay += 0.001


	tlGoodVictoryArms.to(goodGuyVictory.arm1, {
		//ease: "none",
		duration: 0.5,
		rotation: 90,
		y: "-=25",
		yoyo: true,
		repeat: 1,
	}, delay);

	tlGoodVictoryArms.to(goodGuyVictory.arm1_down, {
		//ease: "none",
		duration: 0.5,
		rotation: -100,
		x: "-=0",
		y: "+=15",
		yoyo: true,
		repeat: 1,
	}, delay);


	tlGoodVictoryArms.to(goodGuyVictory.arm2, {
		//ease: "none",
		duration: 0.5,
		rotation: 40,
		y: "-=0",
		yoyo: true,
		repeat: 1,
	}, delay);

	tlGoodVictoryArms.to(goodGuyVictory.arm2_down, {
		//ease: "none",
		duration: 0.5,
		rotation: 50,
		x: "-=0",
		y: "+=5",
		yoyo: true,
		repeat: 1,
	}, delay);




	tlGoodVictoryArms.to(goodGuyVictory.leg1, {
		//ease: "none",
		duration: 0.5,
		rotation: -70,
		x: "-=20",
		y: "+=20",
		yoyo: true,
		repeat: 1,
	}, delay);

	//goodGuyVictory.leg2.hide()
	tlGoodVictoryArms.to(goodGuyVictory.leg1_down, {
		//ease: "none",
		duration: 0.5,
		rotation: 90,
		x: "+=28",
		y: "-=5",
		yoyo: true,
		repeat: 1,
	}, delay);



	tlGoodVictoryArms.to(goodGuyVictory.leg2, {
		//ease: "none",
		duration: 0.5,
		rotation: 50,
		x: "+=30",
		y: "+=0",
		yoyo: true,
		repeat: 1,
	}, delay);

	tlGoodVictoryArms.to(goodGuyVictory.leg2_down, {
		//ease: "none",
		duration: 0.5,
		rotation: -90,
		x: "-=18",
		y: "+=15",
		yoyo: true,
		repeat: 1,
	}, delay);


	tlGoodVictoryArms.to(goodGuyVictory, {
		//ease: "none",
		duration: 0.5,
		rotation: 20,
		y: "-=20",
		yoyo: true,
		repeat: 1,
	}, delay);
	tlGoodVictoryArms.to(goodGuyVictory.shadow, {
		//ease: "none",
		duration: 0.5,
		rotation: -20,
		y: "+=15",
		x: "+=80",
		scaleX: 0.8,
		opacity: 0.4,
		yoyo: true,
		repeat: 1,
	}, delay);
}

function object(options) {
	if (Konva[Object.keys(options)[0]] == undefined) {
		console.warn("> Konva object not found! <");
		return;
	}

	var group = new Konva.Group(options);

	var element = new Konva[Object.keys(options)[0]](
		options[Object.keys(options)[0]]
	)

	group[Object.keys(options)[0]] = element

	delete options[Object.keys(options)[0]];
	group.add(element);
	return group;
}



function tint(image, col, reg = /{fill:.*?}/g) {
	var ext;
	var re = /(?:\.([^.]+))?$/;
	var returndata;
	var imageName
	for (var i in images) {
		if (images[i] == image) {
			ext = re.exec(images[i].src)[1].toLowerCase();
			imageName = i;
		}
	}

	if (ext == undefined) return;

	if (ext == "svg") {
		var xml = svgData[imageName]

		xml = xml.replace(reg, '{fill:' + col + '}');

		var svg64 = btoa(xml);
		var b64Start = 'data:image/svg+xml;base64,';
		var image64 = b64Start + svg64;
		var img = new Image();

		img.src = image64;
		returndata = img;
	} else {
		var canvas = document.createElement('canvas');
		var ctx = canvas.getContext('2d');

		canvas.width = image.width;
		canvas.height = image.height;
		ctx.fillStyle = col;
		ctx.drawImage(image, 0, 0);
		ctx.fillRect(0, 0, canvas.width, canvas.height);
		ctx.globalCompositeOperation = 'destination-in';
		ctx.drawImage(image, 0, 0);

		returndata = canvas;
	}


	//*************/
	return returndata
}

function getScale(width_from, width_to) {
	return width_to / width_from;
}
function getRandom(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}


function getClip(image) {
	var iWidth = image.width;
	var iHeight = image.height;

	var testLayer = new Konva.Layer({
		x: width,
	});
	stageWin.add(testLayer);

	var image = new Konva.Image({
		image: image
	});
	testLayer.add(image)

	var c = image.toCanvas().getContext('2d');

	var clipX = 0;
	var clipY = 0;
	var clipWidth = 0;
	var clipHeight = 0;

	for (var y = 1; y <= iHeight; y++) {
		var p = c.getImageData(1, y, iWidth, 1).data;
		var sum = 0;
		for (var i = 0; i < p.length; i++) {
			sum += p[i];
		}
		if (sum != 0 && clipY == 0) {
			clipY = y;
		}
		if (sum != 0) {
			clipHeight = y;
		}
	}

	for (var x = 1; x <= iWidth; x++) {
		var p = c.getImageData(x, 1, 1, iHeight).data;
		var sum = 0;
		for (var i = 0; i < p.length; i++) {
			sum += p[i];
		}
		if (sum != 0 && clipX == 0) {
			clipX = x;
		}
		if (sum != 0) {
			clipWidth = x;
		}
	}
	clipX -= 1;
	clipY -= 1;
	clipHeight = clipHeight - clipY + 2;
	clipWidth = clipWidth - clipX + 2;
	testLayer.remove()
	return {
		x: clipX,
		y: clipY,
		width: clipWidth,
		height: clipHeight
	};
}


function radian(a) {
	return a * Math.PI / 180;
}