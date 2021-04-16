$(document).ready(function() {
    //  Setup variables
    var $btnJeopardyAnswer = $("#btnJeopardyAnswer");

    $btnJeopardyAnswer.click(
        function() {
            var elem = document.getElementById("btnJeopardyAnswer");
            console.log(elem.innerText)
            console.log("CLICKED")

            elem.classList.toggle("btn-success")
            elem.innerText = answer
        }
    );
});
