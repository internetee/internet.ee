function buildbadVictory(layer) {

    badGuyVictory = new Konva.Group({
        x: 500,
        y: 60,
        offset: {
            x: images.badVictoryShadow.width / 2,
            y: images.badVictoryShadow.height / 2,
        }
    });
    badGuyVictory.reposition();
    layer.add(badGuyVictory);



    badGuyVictory.shadow = new Konva.Image({
        image: images.badVictoryShadow,
        offset: {
            x: 158,
            y: 411 + 20
        }
    });
    badGuyVictory.shadow.reposition();
    badGuyVictory.add(badGuyVictory.shadow)

    // ARM1 //////////////////

    badGuyVictory.arm1 = new Konva.Group({
        offset: {
            x: 205,
            y: 114 + 20
        }
    });
    badGuyVictory.arm1.reposition();
    badGuyVictory.add(badGuyVictory.arm1);

    badGuyVictory.arm1_up = new Konva.Image({
        image: images.badVictoryArm1up
    });
    badGuyVictory.arm1.add(badGuyVictory.arm1_up);

    badGuyVictory.arm1_down = new Konva.Image({
        image: images.badVictoryArm1down,
        offset: {
            x: 259,
            y: 75 + 20
        }
    });
    badGuyVictory.arm1_down.reposition()
    badGuyVictory.arm1.add(badGuyVictory.arm1_down);


    // ARM2 //////////////////

    badGuyVictory.arm2 = new Konva.Group({
        offset: {
            x: 128,
            y: 112 + 20
        }
    });
    badGuyVictory.arm2.reposition();
    badGuyVictory.add(badGuyVictory.arm2);

    badGuyVictory.arm2_up = new Konva.Image({
        image: images.badVictoryArm2up
    });
    badGuyVictory.arm2.add(badGuyVictory.arm2_up);

    badGuyVictory.arm2_down = new Konva.Image({
        image: images.badVictoryArm2down,
        offset: {
            x: 70,
            y: 73 + 20
        }
    });
    badGuyVictory.arm2_down.reposition()
    badGuyVictory.arm2.add(badGuyVictory.arm2_down);



    // LEG 1 //////////////////

    badGuyVictory.leg1 = new Konva.Group({
        offset: {
            x: 186,
            y: 188 + 20
        }
    });
    badGuyVictory.leg1.reposition();
    badGuyVictory.add(badGuyVictory.leg1);

    badGuyVictory.leg1_up = new Konva.Image({
        image: images.badVictoryLeg1up
    });
    badGuyVictory.leg1.add(badGuyVictory.leg1_up);

    badGuyVictory.leg1_down = new Konva.Image({
        image: images.badVictoryLeg1down,
        offset: {
            x: 189,
            y: 274 + 20
        }
    });
    badGuyVictory.leg1_down.reposition()
    badGuyVictory.leg1.add(badGuyVictory.leg1_down);


    // LEG 2 //////////////////

    badGuyVictory.leg2 = new Konva.Group({
        offset: {
            x: 135,
            y: 187 + 20
        }
    });
    badGuyVictory.leg2.reposition();
    badGuyVictory.add(badGuyVictory.leg2);

    badGuyVictory.leg2_up = new Konva.Image({
        image: images.badVictoryLeg2up
    });
    badGuyVictory.leg2.add(badGuyVictory.leg2_up);

    badGuyVictory.leg2_down = new Konva.Image({
        image: images.badVictoryLeg2down,
        offset: {
            x: 140,
            y: 264 + 20
        }
    });
    badGuyVictory.leg2_down.reposition()
    badGuyVictory.leg2.add(badGuyVictory.leg2_down);


    // BODY //////////////////

    badGuyVictory.body = new Konva.Group({
        offset: {
            x: 253,
            y: 181 + 20
        }
    });
    badGuyVictory.add(badGuyVictory.body);
    badGuyVictory.body.reposition();

    badGuyVictory.body.add(new Konva.Image({ image: images.badVictoryBody }))


    let clone = badGuyVictory.clone({});
    layer.add(clone);
    clone.cache();
    clone.filters([Konva.Filters.Grayscale]);
    clone.moveDown();
    clone.hide();


    /* ---------------------------------------------------------------------------------*/
    /* -------------------------------     ANIMATION   ---------------------------------*/
    /* ---------------------------------------------------------------------------------*/


    delay = 0;
    tlbadVictoryArms = gsap.timeline({ repeat: -1, repeatDelay: 0.1, name: "bad victory arms", paused: false });
    delay += 0.001


    tlbadVictoryArms.to(badGuyVictory.arm1, {
        //ease: "none",
        duration: 0.5,
        rotation: 90,
        y: "-=25",
        yoyo: true,
        repeat: 1,
    }, delay);

    tlbadVictoryArms.to(badGuyVictory.arm1_down, {
        //ease: "none",
        duration: 0.5,
        rotation: -100,
        x: "-=0",
        y: "+=15",
        yoyo: true,
        repeat: 1,
    }, delay);


    tlbadVictoryArms.to(badGuyVictory.arm2, {
        //ease: "none",
        duration: 0.5,
        rotation: -90,
        y: "-=10",
        yoyo: true,
        repeat: 1,
    }, delay);

    tlbadVictoryArms.to(badGuyVictory.arm2_down, {
        //ease: "none",
        duration: 0.5,
        rotation: 100,
        x: "-=0",
        y: "+=5",
        yoyo: true,
        repeat: 1,
    }, delay);





    tlbadVictoryArms.to(badGuyVictory.leg1, {
        //ease: "none",
        duration: 0.5,
        rotation: -70,
        x: "-=20",
        y: "+=20",
        yoyo: true,
        repeat: 1,
    }, delay);

    //badGuyVictory.leg2.hide()
    tlbadVictoryArms.to(badGuyVictory.leg1_down, {
        //ease: "none",
        duration: 0.5,
        rotation: 90,
        x: "+=30",
        y: "-=10",
        yoyo: true,
        repeat: 1,
    }, delay);



    tlbadVictoryArms.to(badGuyVictory.leg2, {
        //ease: "none",
        duration: 0.5,
        rotation: 70,
        x: "+=30",
        y: "+=0",
        yoyo: true,
        repeat: 1,
    }, delay);

    tlbadVictoryArms.to(badGuyVictory.leg2_down, {
        //ease: "none",
        duration: 0.5,
        rotation: -90,
        x: "-=20",
        y: "+=10",
        yoyo: true,
        repeat: 1,
    }, delay);


    tlbadVictoryArms.to(badGuyVictory, {
        //ease: "none",
        duration: 0.5,
        rotation: 0,
        y: "-=40",
        yoyo: true,
        repeat: 1,
    }, delay);
    tlbadVictoryArms.to(badGuyVictory.shadow, {
        //ease: "none",
        duration: 0.5,
        y: "+=40",
        scaleX: 0.8,
        opacity: 0.4,
        yoyo: true,
        repeat: 1,
    }, delay);

}