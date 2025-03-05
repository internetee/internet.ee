function buildbadLoser(layer) {
    badGuyLoser = new Konva.Group({
        x: 500,
        y: 60,
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

