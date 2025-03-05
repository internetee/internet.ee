function buildGood(layer) {
    goodGuy = new Konva.Group({
        offset: {
            x: images.goodShadow.width / 2,
            y: images.goodShadow.height / 2,
        }
    });
    goodGuy.reposition();
    layer.add(goodGuy);

    goodGuy.shadow = new Konva.Image({
        image: images.goodShadow,
        offset: {
            x: 230,
            y: 460
        }
    });
    goodGuy.shadow.reposition();
    goodGuy.add(goodGuy.shadow)

    // ARM1 //////////////////

    goodGuy.arm1 = new Konva.Group({
        offset: {
            x: 312,
            y: 121
        }
    });
    goodGuy.arm1.reposition();
    goodGuy.add(goodGuy.arm1);

    goodGuy.arm1_up = new Konva.Image({
        image: images.goodArm1up
    });
    goodGuy.arm1.add(goodGuy.arm1_up);

    goodGuy.arm1_down = new Konva.Image({
        image: images.goodArm1down,
        offset: {
            x: 371,
            y: 145
        }
    });
    goodGuy.arm1_down.reposition()
    goodGuy.arm1.add(goodGuy.arm1_down);



    // LEGS //////////////////

    goodGuy.leg1 = new Konva.Group({
        offset: {
            x: 260,
            y: 205
        }
    });
    goodGuy.leg1.reposition();
    goodGuy.add(goodGuy.leg1);

    goodGuy.leg1_up = new Konva.Image({
        image: images.goodLeg1up
    });
    goodGuy.leg1.add(goodGuy.leg1_up);

    goodGuy.leg1_down = new Konva.Image({
        image: images.goodLeg1down,
        offset: {
            x: 368,
            y: 280
        }
    });
    goodGuy.leg1_down.reposition()
    goodGuy.leg1.add(goodGuy.leg1_down);



    goodGuy.leg2 = new Konva.Group({
        offset: {
            x: 234,
            y: 193
        }
    });
    goodGuy.leg2.reposition();
    goodGuy.add(goodGuy.leg2);

    goodGuy.leg2_up = new Konva.Image({
        image: images.goodLeg2up
    });
    goodGuy.leg2.add(goodGuy.leg2_up);

    goodGuy.leg2_down = new Konva.Image({
        image: images.goodLeg2down,
        offset: {
            x: 241,
            y: 296
        }
    });
    goodGuy.leg2_down.reposition()
    goodGuy.leg2.add(goodGuy.leg2_down);



    // BODY //////////////////

    goodGuy.body = new Konva.Group({
        offset: {
            x: 253,
            y: 181
        }
    });
    goodGuy.add(goodGuy.body);
    goodGuy.body.reposition();

    goodGuy.body.add(new Konva.Image({ image: images.goodBody }))

    goodGuy.tie = new Konva.Image({
        image: images.goodTie,
        offset: {
            x: 290,
            y: 127
        }
    });
    goodGuy.body.add(goodGuy.tie);
    goodGuy.tie.reposition();

    // ARM 2 //////////////////

    goodGuy.arm2 = new Konva.Group({
        offset: {
            x: 252,
            y: 111
        }
    });
    goodGuy.arm2.reposition();
    goodGuy.add(goodGuy.arm2);

    goodGuy.arm2_up = new Konva.Image({
        image: images.goodArm2up
    });
    goodGuy.arm2.add(goodGuy.arm2_up);

    goodGuy.arm2_down = new Konva.Image({
        image: images.goodArm2down,
        offset: {
            x: 185,
            y: 89
        }
    });
    goodGuy.arm2_down.reposition()
    goodGuy.arm2.add(goodGuy.arm2_down);







    delay = 0;
    tlGoodArms = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "good arms", paused: true });
    delay += 0.001

    let goodArmDur = 0.3;
    let goodLegDur = 0.3;


    tlGoodArms.to(goodGuy.arm1, {
        ease: "none",
        duration: goodArmDur,
        rotation: 130,
        yoyo: true,
        repeat: 1,
    }, delay);
    tlGoodArms.to(goodGuy.arm1_down, {
        ease: "none",
        duration: goodArmDur,
        rotation: 50,
        yoyo: true,
        repeat: 1,
    }, delay);

    tlGoodArms.to(goodGuy.arm2, {
        ease: "none",
        duration: goodArmDur,
        rotation: -180,
        yoyo: true,
        repeat: 1,
        y: "+=5"
    }, delay);

    tlGoodArms.to(goodGuy.arm2_down, {
        ease: "none",
        duration: goodArmDur,
        rotation: 30,
        yoyo: true,
        repeat: 1,
    }, delay);
    tlGoodArms.to(goodGuy.tie, {
        ease: "none",
        duration: goodArmDur,
        rotation: -40,
        yoyo: true,
        repeat: 1,
    }, delay);

    delay = 0;
    tlGoodLegs = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "good legs", paused: true });
    delay += 0.001

    tlGoodLegs.to(goodGuy.leg1, {
        ease: "none",
        duration: goodLegDur,
        rotation: 90,
        keyframes: [
            { y: "-=50", rotation: 50 },
            { y: "+=50", rotation: 90 },
        ],
    }, delay);

    tlGoodLegs.to(goodGuy.leg1_down, {
        ease: "none",
        duration: goodLegDur,
        keyframes: [
            { rotation: "-30" },
            { rotation: "20" },
        ],
    }, delay);


    tlGoodLegs.to(goodGuy.leg2, {
        ease: "none",
        duration: goodLegDur,
        rotation: -60,
        x: "+=20",
    }, delay);

    tlGoodLegs.to(goodGuy.leg2_down, {
        ease: "none",
        duration: goodLegDur,
        keyframes: [
            { rotation: "-20" },
            { rotation: "-50" },
        ],
    }, delay);

    tlGoodLegs.to(goodGuy, {
        ease: "none",
        duration: goodLegDur / 2,
        y: "-=10",
        yoyo: true,
        repeat: 1
    }, delay);

    tlGoodLegs.to(goodGuy.body, {
        ease: "none",
        duration: goodLegDur / 2,
        rotation: 5,
        yoyo: true,
        repeat: 1
    }, delay);

    tlGoodLegs.to(goodGuy.shadow, {
        ease: "none",
        duration: goodLegDur / 2,
        y: "+=10",
        scaleX: 0.9,
        yoyo: true,
        repeat: 1
    }, delay);


    goodGuyTimeline = [tlGoodArms, tlGoodLegs]
}