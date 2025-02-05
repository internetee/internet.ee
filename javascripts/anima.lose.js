var stageLose = createStage('anima-lose', 'ad.size');



var startTime = Math.round(performance.now());
var l = new Loader;

//	Bad elements lose
l.add("badLoserBody", "images/lose-badLoserBody.png");
l.add("badLoserHead", "images/lose-badLoserHead.png");
l.add("badLoserArm1", "images/lose-badLoserArm1.png");
l.add("badLoserArm2", "images/lose-badLoserArm2.png");

l.load(buildLoseStage)
document.getElementById("out").innerHTML = "start2";


//fixedWidth = true
//maxWidth = false;
// if (window.location.hash.substr(1) == "ignorewidth") maxWidth = true;
// resize();


function buildLoseStage() {
	var endTime = Math.round(performance.now());
	//	console.log("Magic just happened in " + ((endTime-startTime)/1000) + " sec")
	var layer = new Konva.Layer({ opacity: 0 });
	stageLose.add(layer)

	badGuyLoser = new Konva.Group({
		x: 40,
		y: 70,
		offset: {
			x: images.badLoserBody.width / 2,
			y: images.badLoserBody.height / 2,
		}
	});
	badGuyLoser.reposition();
	layer.add(badGuyLoser);

	badGuyLoser.head = new Konva.Image({
		image: images.badLoserHead,
		offset: {
			x: 145,
			y: 115
		}
	});
	badGuyLoser.head.reposition();
	badGuyLoser.add(badGuyLoser.head)

	badGuyLoser.arm1 = new Konva.Image({
		image: images.badLoserArm1,
		offset: {
			x: 203,
			y: 105
		}
	});
	badGuyLoser.arm1.reposition();
	badGuyLoser.add(badGuyLoser.arm1)

	badGuyLoser.arm2 = new Konva.Image({
		image: images.badLoserArm2,
		offset: {
			x: 85,
			y: 105
		}
	});
	badGuyLoser.arm2.reposition();
	badGuyLoser.add(badGuyLoser.arm2)

	badGuyLoser.body = new Konva.Image({
		image: images.badLoserBody
	});
	badGuyLoser.add(badGuyLoser.body);



	/* ---------------------------------------------------------------------------------*/
	/* -------------------------------     ANIMATION   ---------------------------------*/
	/* ---------------------------------------------------------------------------------*/

	delay = 0;
	tl = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "main", paused: false });
	tl.set(layer, { opacity: 1 }, delay);

	delay = 0;
	tlBadLooser = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "bad looser", paused: false });
	delay += 0.001

	tlBadLooser.to(badGuyLoser.head, {
		ease: "none",
		duration: 0.5,
		rotation: -5,
		y: "+=1",
		yoyo: true,
		repeat: 1,
	}, delay);
	tlBadLooser.to(badGuyLoser.arm1, {
		ease: "none",
		duration: 0.5,
		rotation: -5,
		yoyo: true,
		repeat: 1,
	}, delay);
	tlBadLooser.to(badGuyLoser.arm2, {
		ease: "none",
		duration: 0.5,
		rotation: 5,
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
	stageLose.add(testLayer);

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