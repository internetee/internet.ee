function buildgoodLoser(layer) {
    goodGuyLoser = new Konva.Group({
        x: 500,
        y: 60,
        offset: {
            x: images.goodLoserBody.width / 2,
            y: images.goodLoserBody.height / 2,
        }
    });
    goodGuyLoser.reposition();
    layer.add(goodGuyLoser);

    goodGuyLoser.head = new Konva.Image({
        image: images.goodLoserHead,
        offset: {
            x: 145,
            y: 115
        }
    });
    goodGuyLoser.head.reposition();
    goodGuyLoser.add(goodGuyLoser.head)

    goodGuyLoser.arm1 = new Konva.Image({
        image: images.goodLoserArm1,
        offset: {
            x: 203,
            y: 105
        }
    });
    goodGuyLoser.arm1.reposition();
    goodGuyLoser.add(goodGuyLoser.arm1)

    goodGuyLoser.arm2 = new Konva.Image({
        image: images.goodLoserArm2,
        offset: {
            x: 85,
            y: 105
        }
    });
    goodGuyLoser.arm2.reposition();
    goodGuyLoser.add(goodGuyLoser.arm2)

    goodGuyLoser.body = new Konva.Image({
        image: images.goodLoserBody
    });
    goodGuyLoser.add(goodGuyLoser.body);



    /* ---------------------------------------------------------------------------------*/
    /* -------------------------------     ANIMATION   ---------------------------------*/
    /* ---------------------------------------------------------------------------------*/


    delay = 0;
    tlgoodLooser = gsap.timeline({ repeat: -1, repeatDelay: 0, name: "good looser", paused: false });
    delay += 0.001

    tlgoodLooser.to(goodGuyLoser.head, {
        ease: "none",
        duration: 0.5,
        rotation: -5,
        y: "+=1",
        yoyo: true,
        repeat: 1,
    }, delay);
    tlgoodLooser.to(goodGuyLoser.arm1, {
        ease: "none",
        duration: 0.5,
        rotation: -5,
        yoyo: true,
        repeat: 1,
    }, delay);
    tlgoodLooser.to(goodGuyLoser.arm2, {
        ease: "none",
        duration: 0.5,
        rotation: 5,
        yoyo: true,
        repeat: 1,
    }, delay);
}

