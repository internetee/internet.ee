function buildGoodVictory(layer) {

    goodGuyVictory = new Konva.Group({
        x: 100,
        y: 60,
        offset: {
            x: images.goodVictoryShadow.width / 2,
            y: images.goodVictoryShadow.height / 2,
        }
    });
    goodGuyVictory.reposition();
    layer.add(goodGuyVictory);

    goodGuyVictory.shadow = new Konva.Image({
        image: images.goodVictoryShadow,
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