$(document).ready(function() {

    var $btnQuestion1 = $("#btnQuestion1");
    var $btnQuestion2 = $("#btnQuestion2");
    var $btnQuestion3 = $("#btnQuestion3");
    var $btnQuestion4 = $("#btnQuestion4");

    console.log('Millionaire JS')

    $btnQuestion1.click(
        function() {
            console.log('btn1 clicked')
            updateQuestions()
        }
    )


    $btnQuestion2.click(
        function() {
            console.log('btn2 clicked')
            updateQuestions()
        }
    );

    $btnQuestion3.click(
        function() {
            console.log('btn3 clicked')
            updateQuestions()
        }
    );

    $btnQuestion4.click(
        function() {
            console.log('btn4 clicked')
            updateQuestions()
        }
    );

    function updateQuestions() {
        var a = document.getElementById("btnQuestion1")
        var b = document.getElementById("btnQuestion2")
        var c = document.getElementById("btnQuestion3")
        var d = document.getElementById("btnQuestion4")

        if (answer === 'a') {
            a.classList.toggle("btn-success")

            b.classList.toggle("btn-danger")
            c.classList.toggle("btn-danger")
            d.classList.toggle("btn-danger")
        } else if (answer === 'b') {
            b.classList.toggle("btn-success")

            a.classList.toggle("btn-danger")
            c.classList.toggle("btn-danger")
            d.classList.toggle("btn-danger")
        } else if (answer === 'c') {
            c.classList.toggle("btn-success")

            a.classList.toggle("btn-danger")
            b.classList.toggle("btn-danger")
            d.classList.toggle("btn-danger")
        } else if (answer === 'd') {
            d.classList.toggle("btn-success")

            a.classList.toggle("btn-danger")
            b.classList.toggle("btn-danger")
            c.classList.toggle("btn-danger")
        }
    }

});
