function buildBad(layer) {
    badGuy = new Konva.Group({
        offset: {
            x: images.badShadow.width / 2,
            y: images.badShadow.height / 2,
        }
    });
    badGuy.reposition();
    layer.add(badGuy);

    badGuy.shadow = new Konva.Image({
        image: images.badShadow,
        offset: {
            x: 230,
            y: 460
        }
    });
    badGuy.shadow.reposition();
    badGuy.add(badGuy.shadow)

    // ARM1 //////////////////

    badGuy.arm1 = new Konva.Group({
        offset: {
            x: 370,
            y: 115
        }
    });
    badGuy.arm1.reposition();
    badGuy.add(badGuy.arm1);

    badGuy.arm1_up = new Konva.Image({
        image: images.badArm1up
    });
    badGuy.arm1.add(badGuy.arm1_up);

    badGuy.arm1_down = new Konva.Image({
        image: images.badArm1down,
        offset: {
            x: 439,
            y: 129
        }
    });
    badGuy.arm1_down.reposition()
    badGuy.arm1.add(badGuy.arm1_down);



    // LEGS //////////////////

    badGuy.leg1 = new Konva.Group({
        offset: {
            x: 268,
            y: 193
        }
    });
    badGuy.leg1.reposition();
    badGuy.add(badGuy.leg1);

    badGuy.leg1_up = new Konva.Image({
        image: images.badLeg1up
    });
    badGuy.leg1.add(badGuy.leg1_up);

    badGuy.leg1_down = new Konva.Image({
        image: images.badLeg1down,
        offset: {
            x: 401,
            y: 201
        }
    });
    badGuy.leg1_down.reposition()
    badGuy.leg1.add(badGuy.leg1_down);



    badGuy.leg2 = new Konva.Group({
        offset: {
            x: 273,
            y: 166
        }
    });
    badGuy.leg2.reposition();
    badGuy.add(badGuy.leg2);

    badGuy.leg2_up = new Konva.Image({
        image: images.badLeg2up
    });
    badGuy.leg2.add(badGuy.leg2_up);

    badGuy.leg2_down = new Konva.Image({
        image: images.badLeg2down,
        offset: {
            x: 213,
            y: 246
        }
    });
    badGuy.leg2_down.reposition()
    badGuy.leg2.add(badGuy.leg2_down);



    // BODY //////////////////

    badGuy.body = new Konva.Group({
        offset: {
            x: 292,
            y: 159
        }
    });
    badGuy.add(badGuy.body);
    badGuy.body.reposition();

    badGuy.body.add(new Konva.Image({ image: images.badBody }))

    badGuy.tie = new Konva.Image({
        image: images.badTie,
        offset: {
            x: 290,
            y: 127
        }
    });
    badGuy.body.add(badGuy.tie);
    badGuy.tie.reposition();

    // ARM 2 //////////////////

    badGuy.arm2 = new Konva.Group({
        offset: {
            x: 302,
            y: 95
        }
    });
    badGuy.arm2.reposition();
    badGuy.add(badGuy.arm2);

    badGuy.arm2_up = new Konva.Image({
        image: images.badArm2up
    });
    badGuy.arm2.add(badGuy.arm2_up);

    badGuy.arm2_down = new Konva.Image({
        image: images.badArm2down,
        offset: {
            x: 206,
            y: 97
        }
    });
    badGuy.arm2_down.reposition()
    badGuy.arm2.add(badGuy.arm2_down);



    delay = 0;
    tlBadArmas = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "bad arms", paused: true });
    delay += 0.001

    let badArmDur = 0.3;

    tlBadArmas.to(badGuy.arm1, {
        ease: "none",
        duration: badArmDur,
        rotation: 130,
        yoyo: true,
        repeat: 1,
    }, delay);
    tlBadArmas.to(badGuy.arm1_down, {
        ease: "none",
        duration: badArmDur,
        rotation: 50,
        yoyo: true,
        repeat: 1,
    }, delay);

    tlBadArmas.to(badGuy.arm2, {
        ease: "none",
        duration: badArmDur,
        rotation: -180,
        yoyo: true,
        repeat: 1,
        y: "+=20",
        x: "+=20"
    }, delay);

    tlBadArmas.to(badGuy.arm2_down, {
        ease: "none",
        duration: badArmDur,
        rotation: 30,
        yoyo: true,
        repeat: 1,
    }, delay);
    tlBadArmas.to(badGuy.tie, {
        ease: "none",
        duration: badArmDur,
        rotation: -40,
        yoyo: true,
        repeat: 1,
    }, delay);

    delay = 0;
    tlBadLegs = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "bad legs", paused: true });
    delay += 0.001

    let badLegDur = 0.25;


    tlBadLegs.to(badGuy.leg1, {
        ease: "none",
        duration: badLegDur,
        rotation: 130,
        y: "-=40",
        x: "+=40"
    }, delay);

    tlBadLegs.to(badGuy.leg1_down, {
        ease: "none",
        duration: badLegDur,
        rotation: -130,

    }, delay);

    tlBadLegs.to(badGuy.leg2, {
        ease: "none",
        duration: badLegDur,
        rotation: -130,
        y: "+=50",
        x: "+=20"
    }, delay);

    tlBadLegs.to(badGuy.leg2_down, {
        ease: "none",
        duration: badLegDur,
        rotation: 130,

    }, delay);

    tlBadLegs.to(badGuy, {
        ease: "none",
        duration: badLegDur / 2,
        y: "-=10",
        yoyo: true,
        repeat: 1
    }, delay);

    tlBadLegs.to(badGuy.body, {
        ease: "none",
        duration: badLegDur / 2,
        rotation: -5,
        yoyo: true,
        repeat: 1
    }, delay);

    tlBadLegs.to(badGuy.shadow, {
        ease: "none",
        duration: badLegDur / 2,
        y: "+=10",
        scaleX: 0.5,
        yoyo: true,
        repeat: 1
    }, delay);



    badGuyTimeline = [tlBadArmas, tlBadLegs];
}