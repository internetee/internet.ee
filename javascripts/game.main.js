var startTime = Math.round(performance.now());
var l = new Loader;

//	main elements

l.add("kesees", "images/game.kesees.png?v=2");
l.add("textStart", "images/game.text1.png?v=2");
l.add("textRun", "images/game.text2.png?v=2");
l.add("url", "images/game.url.png?v=2");
l.add("road", "images/game.road.png?v=2");
l.add("buttonRun", "images/game.buttonRun.png?v=2");
l.add("textChoose", "images/game.textChoose.png?v=2");

l.add("textWin1", "images/game.textWin1.png?v=2");
l.add("textWin2", "images/game.textWin2.png?v=2");
l.add("textLose1", "images/game.textLose1.png?v=2");
l.add("textLose2", "images/game.textLose2.png?v=2");
l.add("cta", "images/game.cta.png?v=2");


//	bad elements
l.add("badBody", "images/game.run.badBody.png?v=2");
l.add("badArm1up", "images/game.run.badArm1up.png?v=2");
l.add("badArm1down", "images/game.run.badArm1down.png?v=2");
l.add("badArm2up", "images/game.run.badArm2up.png?v=2");
l.add("badArm2down", "images/game.run.badArm2down.png?v=2");
l.add("badLeg1up", "images/game.run.badLeg1up.png?v=2");
l.add("badLeg1down", "images/game.run.badLeg1down.png?v=2");
l.add("badLeg2up", "images/game.run.badLeg2up.png?v=2");
l.add("badLeg2down", "images/game.run.badLeg2down.png?v=2");
l.add("badTie", "images/game.run.badTie.png?v=2");
l.add("badShadow", "images/game.run.badShadow.png?v=2");


//	Good elements
l.add("goodBody", "images/game.run.goodBody.png?v=2");
l.add("goodArm1up", "images/game.run.goodArm1up.png?v=2");
l.add("goodArm1down", "images/game.run.goodArm1down.png?v=2");
l.add("goodArm2up", "images/game.run.goodArm2up.png?v=2");
l.add("goodArm2down", "images/game.run.goodArm2down.png?v=2");
l.add("goodLeg1up", "images/game.run.goodLeg1up.png?v=2");
l.add("goodLeg1down", "images/game.run.goodLeg1down.png?v=2");
l.add("goodLeg2up", "images/game.run.goodLeg2up.png?v=2");
l.add("goodLeg2down", "images/game.run.goodLeg2down.png?v=2");
l.add("goodTie", "images/game.run.goodTie.png?v=2");
l.add("goodShadow", "images/game.run.goodShadow.png?v=2");

//	Good elements Victory
l.add("goodVictoryBody", "images/game.victory.goodVictoryBody.png?v=2");
l.add("goodVictoryArm1up", "images/game.victory.goodVictoryArm1up.png?v=2");
l.add("goodVictoryArm1down", "images/game.victory.goodVictoryArm1down.png?v=2");
l.add("goodVictoryArm2up", "images/game.victory.goodVictoryArm2up.png?v=2");
l.add("goodVictoryArm2down", "images/game.victory.goodVictoryArm2down.png?v=2");
l.add("goodVictoryLeg1up", "images/game.victory.goodVictoryLeg1up.png?v=2");
l.add("goodVictoryLeg1down", "images/game.victory.goodVictoryLeg1down.png?v=2");
l.add("goodVictoryLeg2up", "images/game.victory.goodVictoryLeg2up.png?v=2");
l.add("goodVictoryLeg2down", "images/game.victory.goodVictoryLeg2down.png?v=2");
l.add("goodVictoryShadow", "images/game.victory.goodVictoryShadow.png?v=2");


//	Bad elements Victory
l.add("badVictoryBody", "images/game.victory.badVictoryBody.png?v=2");
l.add("badVictoryArm1up", "images/game.victory.badVictoryArm1up.png?v=2");
l.add("badVictoryArm1down", "images/game.victory.badVictoryArm1down.png?v=2");
l.add("badVictoryArm2up", "images/game.victory.badVictoryArm2up.png?v=2");
l.add("badVictoryArm2down", "images/game.victory.badVictoryArm2down.png?v=2");
l.add("badVictoryLeg1up", "images/game.victory.badVictoryLeg1up.png?v=2");
l.add("badVictoryLeg1down", "images/game.victory.badVictoryLeg1down.png?v=2");
l.add("badVictoryLeg2up", "images/game.victory.badVictoryLeg2up.png?v=2");
l.add("badVictoryLeg2down", "images/game.victory.badVictoryLeg2down.png?v=2");
l.add("badVictoryShadow", "images/game.victory.badVictoryShadow.png?v=2");


//	Bad elements lose
l.add("badLoserBody", "images/game.loser.badLoserBody.png?v=2");
l.add("badLoserHead", "images/game.loser.badLoserHead.png?v=2");
l.add("badLoserArm1", "images/game.loser.badLoserArm1.png?v=2");
l.add("badLoserArm2", "images/game.loser.badLoserArm2.png?v=2");

//	Good elements lose
l.add("goodLoserBody", "images/game.loser.goodLoserBody.png?v=2");
l.add("goodLoserHead", "images/game.loser.goodLoserHead.png?v=2");
l.add("goodLoserArm1", "images/game.loser.goodLoserArm1.png?v=2");
l.add("goodLoserArm2", "images/game.loser.goodLoserArm2.png?v=2");

l.load(buildStage)
document.getElementById("out").innerHTML = "start2";


let goodGuy;
let badGuy;
let goodGuyVictory;
let badGuyVictory;
let badGuyLoser;
let goodGuyLoser;

let goodGuyTimeline;
let badGuyTimeline;

//fixedWidth = true
//maxWidth = false;
if (window.location.hash.substr(1) == "ignorewidth") maxWidth = true;
resize();


function buildStage() {

	function clicked() {

	}

	var endTime = Math.round(performance.now());
	//	console.log("Magic just happened in " + ((endTime-startTime)/1000) + " sec")
	var layerRun = new Konva.Layer({ opacity: 0 });
	stage.add(layerRun)

	var layerWin = new Konva.Layer({ opacity: 0, listening: false });
	stage.add(layerWin)

	var layerLoser = new Konva.Layer({ opacity: 0, listening: false });
	stage.add(layerLoser);


	let road = new object({
		Image: {
			image: images.road
		},
		clip: {
			x: 0,
			y: 0,
			width: images.road.width,
			height: images.road.height
		}
	});
	layerRun.add(road);

	let url = new Konva.Image({ image: images.url });
	layerRun.add(url);

	let kesees = new Konva.Image({ image: images.kesees });
	layerRun.add(kesees);

	let textStart = new Konva.Image({ image: images.textStart });
	layerRun.add(textStart);

	let textRun = new Konva.Image({ image: images.textRun });
	layerRun.add(textRun);

	let textChoose = new Konva.Image({ image: images.textChoose });
	layerRun.add(textChoose);

	let buttonRun = new Konva.Image({
		image: images.buttonRun,
		width: width,
		height: height,
		offset: {
			x: 167,
			y: 295,
		},
	});
	buttonRun.reposition();
	layerRun.add(buttonRun)


	buttonRun.on('mousedown', function () {
		if (gameStart) {
			this.scaleX(0.9);
			this.scaleY(0.9);
		}
	});
	buttonRun.on('mouseup', function () {
		if (gameStart) {
			this.scaleX(1);
			this.scaleY(1);
		}
	});
	buttonRun.on('click', function () {
		if (gameStart) {

			if (doRun) run();
		}
	});

	buttonRun.on("tap", function () {
		if (gameStart) {

			if (doRun) run();
		}
	});



	///	LAYER WIN

	let textWin1 = new Konva.Image({ image: images.textWin1 });
	layerWin.add(textWin1);

	let textWin2 = new Konva.Image({ image: images.textWin2 });
	layerWin.add(textWin2);

	let ctaWin = new object({
		Image: {
			image: images.cta,
		},
		offset: {
			x: 160,
			y: 330,
		},
	})
	ctaWin.reposition();
	layerWin.add(ctaWin);
	layerWin.add(new Konva.Rect({ width: width, height: height, fill: "rgba(0,0,0,0)" }));
	layerWin.on('click', function () {
		clicked();
	});




	///	LAYER LOSE


	let textLose1 = new Konva.Image({ image: images.textLose1 });
	layerLoser.add(textLose1);

	let textLose2 = new Konva.Image({ image: images.textLose2 });
	layerLoser.add(textLose2);

	let ctaLose = ctaWin.clone({});
	//ctaLose.reposition();
	layerLoser.add(ctaLose);
	layerLoser.add(new Konva.Rect({ width: width, height: height, fill: "rgba(0,0,0,0)" }));
	layerLoser.on('click', function () {
		clicked();
	});


	buildGoodVictory(layerWin);
	buildbadVictory(layerWin);

	buildGood(layerRun);
	buildBad(layerRun);

	buildbadLoser(layerLoser);
	buildgoodLoser(layerLoser)

	let goodMaxScale = 0.6;
	let badMaxScale = 0.6;
	let scaleFactoronmove = 0.1;

	let player = { obj: undefined, anim: undefined, timeline: [] };
	let npc = { obj: undefined, anim: undefined, timeline: [] };

	let gameStart = false;
	let doRun = false;

	let npcTime = 7; //15
	let finish = 1150;

	let speed = 50; //20








	goodGuy.scale({ x: goodMaxScale, y: goodMaxScale });
	badGuy.scale({ x: badMaxScale, y: badMaxScale });


	goodGuyVictory.scale({ x: 0.7, y: 0.7 });
	badGuyVictory.scale({ x: 0.7, y: 0.7 });

	goodGuyVictory.position({ x: 800, y: 200 });
	badGuyVictory.position({ x: 800, y: 200 });

	badGuyLoser.scale({ x: 0.75, y: 0.75 });
	badGuyLoser.position({ x: 800, y: 190 });

	goodGuyLoser.scale({ x: 0.75, y: 0.75 });
	goodGuyLoser.position({ x: 800, y: 190 });




	goodGuy.cache();
	badGuy.cache();

	function setClicks() {
		goodGuy.clearCache();
		badGuy.clearCache();


		goodGuy.clicker = new Konva.Rect({
			width: images.goodShadow.width,
			height: images.goodShadow.height,
			fill: `rgba(255,0,0,0)`
		});
		goodGuy.add(goodGuy.clicker);
		badGuy.clicker = new Konva.Rect({
			width: images.badShadow.width,
			height: images.badShadow.height,
			fill: `rgba(255,0,0,0)`
		});
		badGuy.add(badGuy.clicker);

		goodGuy.clicker.on('mouseenter', function () {
			if (!gameStart) {
				gsap.to(goodGuy, {
					ease: "power3.out",
					duration: 0.5,
					scaleX: goodMaxScale + scaleFactoronmove,
					scaleY: goodMaxScale + scaleFactoronmove,
				});
			}
		});

		goodGuy.clicker.on('mouseleave', function () {
			if (!gameStart) {
				gsap.to(goodGuy, {
					ease: "power3.out",
					duration: 0.5,
					scaleX: goodMaxScale,
					scaleY: goodMaxScale,
				});
			}
		});
		goodGuy.clicker.on('click', function () {
			if (!gameStart) {
				startTheRace("good")
			}
		});
		goodGuy.clicker.on("tap", function () {
			if (!gameStart) {
				startTheRace("good")
			}
		});






		badGuy.clicker.on('mouseenter', function () {
			if (!gameStart) {
				gsap.to(badGuy, {
					ease: "power3.out",
					duration: 0.5,
					scaleX: badMaxScale + scaleFactoronmove,
					scaleY: badMaxScale + scaleFactoronmove,
				});
			}
		});

		badGuy.clicker.on('mouseleave', function () {
			if (!gameStart) {
				gsap.to(badGuy, {
					ease: "power3.out",
					duration: 0.5,
					scaleX: badMaxScale,
					scaleY: badMaxScale,
				});
			}
		});
		badGuy.clicker.on('click', function () {
			if (!gameStart) {
				startTheRace("bad")
			}
		});
		badGuy.clicker.on("tap", function () {
			if (!gameStart) {
				startTheRace("bad")
			}
		});
	}

	function startTheRace(chosenOne) {

		goodGuy.listening(false);
		badGuy.listening(false);

		gameStart = true;
		doRun = true;
		player.obj = goodGuy;
		player.timeline = goodGuyTimeline

		npc.obj = badGuy;
		npc.timeline = badGuyTimeline;

		if (chosenOne == "bad") {
			player.obj = badGuy;
			npc.obj = goodGuy;

			player.timeline = badGuyTimeline;
			npc.timeline = goodGuyTimeline;
		}

		let lastIndex = layerRun.children.at(-1).zIndex();
		player.obj.zIndex(lastIndex);
		npc.obj.zIndex(lastIndex - 1);

		gsap.to(npc.obj, {
			ease: "power3.out",
			duration: 1,
			scaleX: "-=0.3",
			scaleY: "-=0.3",
			x: 450,
			y: 120
		});

		gsap.to(player.obj, {
			ease: "power3.out",
			duration: 1,
			scaleX: "-=0.28",
			scaleY: "-=0.28",
			x: 450,
			y: 170,
			onComplete: function () {

				npc.timeline.forEach(f => f.play());

				npc.anim = gsap.to(npc.obj, {
					ease: "none",
					duration: npcTime,
					x: finish,
					onComplete: function () {
						npc.timeline.forEach(f => f.pause());
					},
					onUpdate: function () {
						checkpos()
					}
				});
			}
		});



		tlRace.play();
	}



	function run() {
		if (player.anim != undefined) {
			player.anim.kill();
		}
		player.anim = gsap.to(player.obj, {
			ease: "power3.out",
			duration: 0.5,
			x: "+=" + speed,
			onComplete: function () {
				player.timeline.forEach(f => f.pause());
			},
			onUpdate: function () {
				checkpos()
			}
		});
		player.timeline.forEach(f => f.play());

	}
	function checkpos() {
		if (player.obj.x() >= finish) {
			endRun();
			showWin();
		}
		if (npc.obj.x() >= finish) {
			endRun();
			showLoose();
		}
	}
	function endRun() {
		if (player.anim != undefined) player.anim.kill();
		player.timeline.forEach(f => f.pause());
		if (npc.anim != undefined) npc.anim.kill();
		npc.timeline.forEach(f => f.pause());

		goodGuy.cache();
		badGuy.cache();
		doRun = false;
	}
	function showWin() {
		//console.log("player win");
		if (player.obj == goodGuy) {
			badGuyVictory.hide();
		} else {
			goodGuyVictory.hide();
		}
		tlWin.play();
	};
	function showLoose() {
		//console.log("npc win")
		if (npc.obj == badGuy) {
			badGuyLoser.hide();
		} else {
			goodGuyLoser.hide();
		}
		tlLose.play();
	}


	/* ---------------------------------------------------------------------------------*/
	/* -------------------------------     ANIMATION   ---------------------------------*/
	/* ---------------------------------------------------------------------------------*/

	delay = 0;
	tlStart = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "start", paused: false });
	//tlStart.timeScale(3);

	tlStart.set([layerRun], { opacity: 1 }, delay);
	tlStart.set(goodGuy, { x: "+=280", y: "-=50" }, delay);
	tlStart.set(badGuy, { x: "+=680", y: "-=20" }, delay);

	tlStart.set(goodGuy, { x: "+=30", opacity: 0 }, delay);
	tlStart.set(badGuy, { x: "-=30", opacity: 0 }, delay);

	tlStart.set(road, { clipWidth: 100 }, delay);
	tlStart.set(textRun, { opacity: 0 }, delay);
	tlStart.set(buttonRun, { opacity: 0 }, delay);
	delay += 0.001

	tlStart.from([kesees, textStart], {
		ease: "power3.out",
		duration: 1,
		opacity: 0,
		y: "+=30",
		stagger: 0.1,
	}, delay);
	delay += 0.2;
	tlStart.from(url, {
		ease: "power3.out",
		duration: 1,
		opacity: 0,
		x: "-=30",
		stagger: 0.1,
	}, delay);

	delay += 0.2;
	tlStart.to(goodGuy, {
		ease: "power3.out",
		duration: 1,
		opacity: 1,
		x: "-=30",
	}, delay);
	delay += 0.1;
	tlStart.to(badGuy, {
		ease: "power3.out",
		duration: 1,
		opacity: 1,
		x: "+=30",
	}, delay);

	delay += 0.3;

	tlStart.from(textChoose, {
		ease: "power3.out",
		duration: 1,
		opacity: 0,
		y: "-=10",
		onComplete: setClicks
	}, delay);


	//// TL RUN


	delay = 0;
	tlRace = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "race", paused: true });
	tlRace.to(textStart, {
		ease: "power3.in",
		duration: 0.5,
		opacity: 0,
		y: "-=20",
	}, delay);
	tlRace.to(textChoose, {
		ease: "power3.in",
		duration: 0.5,
		opacity: 0,
		y: "+=20",
	}, delay);
	delay += 0.5;
	tlRace.from(textRun, {
		ease: "power3.out",
		duration: 1,
		opacity: 0,
		y: "+=30",
	}, delay);
	tlRace.to(road, {
		ease: "power1.out",
		duration: 1,
		clipWidth: width
	}, delay);
	delay += 0.4;

	tlRace.from(buttonRun, {
		ease: "power3.out",
		duration: 1,
		opacity: 0,
		y: "-=20"
	}, delay);



	delay = 0;
	tlWin = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "win", paused: true });
	tlWin.to(layerRun, {
		duration: 0.5,
		opacity: 0,
	}, delay);

	tlWin.to(layerWin, {
		duration: 0.001,
		opacity: 1,
	}, delay);

	tlWin.from([textWin1, textWin2, ctaWin], {
		ease: "power2.out",
		duration: 1,
		opacity: 0,
		y: "+=20",
		stagger: 0.1,
	}, delay);
	tlWin.from([goodGuyVictory, badGuyVictory], {
		duration: 1,
		x: "+=20",
		onComplete: function () {
			layerWin.listening(true)
		}
	}, delay);

	tlWin.to(ctaWin, {
		duration: 1,
		scaleX: 0.9,
		scaleY: 0.9,
		yoyo: true,
		repeat: -1
	}, delay);



	delay = 0;
	tlLose = gsap.timeline({ repeat: 0, repeatDelay: 0, name: "lose", paused: true });
	tlLose.to(layerRun, {
		duration: 0.5,
		opacity: 0,
	}, delay);

	tlLose.to(layerLoser, {
		duration: 0.001,
		opacity: 1,
	}, delay);

	tlLose.from([textLose1, textLose2, ctaLose], {
		ease: "power2.out",
		duration: 1,
		opacity: 0,
		y: "+=20",
		stagger: 0.1,
	}, delay);
	tlLose.from([goodGuyLoser, badGuyLoser], {
		duration: 1,
		x: "+=20",
		onComplete: function () {
			layerWin.listening(true)
		}
	}, delay);

	tlLose.to(ctaLose, {
		ease: "none",
		duration: 0.5,
		scaleX: 1.05,
		scaleY: 1.05,
		yoyo: true,
		repeat: -1
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
	stage.add(testLayer);

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