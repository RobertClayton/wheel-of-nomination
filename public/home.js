// luckywheel animation with Greensock  ---------------------------------

$(document).ready(function() {
    //  Setup variables
    var wheel = $(".wheel"),
        active = $(".active"),
        $btnPlay = $("#btnPlay"),
        $btnSlowMo = $("#btnSlowMo");
        $btnQuestion1 = $("#btnQuestion1");
        $btnQuestion2 = $("#btnQuestion2");
        $btnQuestion3 = $("#btnQuestion3");
        $btnQuestion4 = $("#btnQuestion4");

    //  Random degree
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    //  Creating the Timeline

    var indicator = new TimelineMax();
    var spinWheel = new TimelineMax();

    function animate() {
        var deg = getRandomInt(360, 2160);
        console.log("deg");
        console.log(deg);


        indicator.to(active, .13, {rotation: -10, transformOrigin: "65% 36%", ease: Power1.easeOut})
            .to(active, .13, {rotation: 3, ease: Power4.easeOut})
            .add("end");

        //  Luckywheel animation
        spinWheel.to(wheel, 10, {rotation: deg, transformOrigin: "50% 50%", ease: Power4.easeOut}).add("end");
    }

    //   Buttons
    $btnPlay.click(
        function(){
            indicator.clear();
            spinWheel.clear();

            animate();
            indicator.timeScale(1).seek(0);
            spinWheel.timeScale(1).seek(0);
        }
    );

    $btnSlowMo.click(
        function(){
            indicator.clear()
            spinWheel.clear()

            animate();
            indicator.timeScale(.2).seek(0.5);
            spinWheel.timeScale(.2).seek(0.5);
        }
    );

    $btnQuestion1.click(
        function() {
            var elem = document.getElementById("btnQuestion1");
            console.log(elem.innerText)

            if (correct_answer === elem.innerText) {
                elem.classList.toggle("btn-success")
            } else {
                elem.classList.toggle("btn-danger")
            }
        }
    );

    $btnQuestion2.click(
        function() {
            var elem = document.getElementById("btnQuestion2");
            console.log(elem.innerText)

            if (correct_answer === elem.innerText) {
                elem.classList.toggle("btn-success")
            } else {
                elem.classList.toggle("btn-danger")
            }
        }
    );

    $btnQuestion3.click(
        function() {
            var elem = document.getElementById("btnQuestion3");
            console.log(elem.innerText)

            if (correct_answer === elem.innerText) {
                elem.classList.toggle("btn-success")
            } else {
                elem.classList.toggle("btn-danger")
            }
        }
    );

    $btnQuestion4.click(
        function() {
            var elem = document.getElementById("btnQuestion4");
            console.log(elem.innerText)

            if (correct_answer === elem.innerText) {
                elem.classList.toggle("btn-success")
            } else {
                elem.classList.toggle("btn-danger")
            }
        }
    );

});
