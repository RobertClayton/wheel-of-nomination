$(document).ready(function() {

    var $btnQuestion1 = $("#btnQuestion1");
    var $btnQuestion2 = $("#btnQuestion2");
    var $btnQuestion3 = $("#btnQuestion3");
    var $btnQuestion4 = $("#btnQuestion4");
    var $fiftyFifty = $("#powerUpFiftyFifty");
    var $phoneAFriend = $("#powerUpPhoneAFriend");
    var $askTheTeam = $("#powerUpAskTheTeam");
    var a = document.getElementById("btnQuestion1")
    var b = document.getElementById("btnQuestion2")
    var c = document.getElementById("btnQuestion3")
    var d = document.getElementById("btnQuestion4")

    console.log('Millionaire JS')

    setUpFiftyfifty()
    setUpPhoneAFriend()
    setUpAskTheTeam()

    $btnQuestion1.click(
        function() {
            updateQuestions()
        }
    )

    $btnQuestion2.click(
        function() {
            updateQuestions()
        }
    );

    $btnQuestion3.click(
        function() {
            updateQuestions()
        }
    );

    $btnQuestion4.click(
        function() {
            updateQuestions()
        }
    );

    function updateQuestions() {
        if (answer === 'a') {
            a.classList.toggle("btn-success")

            if (b.classList.contains("btn-secondary") === false) {
                b.classList.toggle("btn-danger")
            }
            if (c.classList.contains("btn-secondary") === false) {
                c.classList.toggle("btn-danger")
            }
            if (d.classList.contains("btn-secondary") === false) {
                d.classList.toggle("btn-danger")
            }
        } else if (answer === 'b') {
            b.classList.toggle("btn-success")

            if (a.classList.contains("btn-secondary") === false) {
                a.classList.toggle("btn-danger")
            }
            if (c.classList.contains("btn-secondary") === false) {
                c.classList.toggle("btn-danger")
            }
            if (d.classList.contains("btn-secondary") === false) {
                d.classList.toggle("btn-danger")
            }
        } else if (answer === 'c') {
            c.classList.toggle("btn-success")

            if (a.classList.contains("btn-secondary") === false) {
                a.classList.toggle("btn-danger")
            }
            if (b.classList.contains("btn-secondary") === false) {
                b.classList.toggle("btn-danger")
            }
            if (d.classList.contains("btn-secondary") === false) {
                d.classList.toggle("btn-danger")
            }
        } else if (answer === 'd') {
            d.classList.toggle("btn-success")

            if (a.classList.contains("btn-secondary") === false) {
                a.classList.toggle("btn-danger")
            }
            if (b.classList.contains("btn-secondary") === false) {
                b.classList.toggle("btn-danger")
            }
            if (c.classList.contains("btn-secondary") === false) {
                c.classList.toggle("btn-danger")
            }
        }
    }

    $fiftyFifty.click(
        function() {
            if (fiftyFiftyUsed === 'false') {
                toggleFiftyfifty()
                updateFiftyfiftyHiddenValue()

                if (fiftyfifty1 === 'a') {
                    a.classList.toggle("btn-secondary")
                } else if (fiftyfifty1 === 'b') {
                    b.classList.toggle("btn-secondary")
                } else if (fiftyfifty1 === 'c') {
                    c.classList.toggle("btn-secondary")
                } else if (fiftyfifty1 === 'd') {
                    d.classList.toggle("btn-secondary")
                }

                if (fiftyfifty2 === 'a') {
                    a.classList.toggle("btn-secondary")
                } else if (fiftyfifty2 === 'b') {
                    b.classList.toggle("btn-secondary")
                } else if (fiftyfifty2 === 'c') {
                    c.classList.toggle("btn-secondary")
                } else if (fiftyfifty2 === 'd') {
                    d.classList.toggle("btn-secondary")
                }
            }
        }
    )

    function setUpFiftyfifty() {
        if (fiftyFiftyUsed === 'true') {
            toggleFiftyfifty()
        }
    }

    function toggleFiftyfifty() {
        document.getElementById("powerUpFiftyFifty").classList.toggle("btn-dark")
    }

    function updateFiftyfiftyHiddenValue() {
        document.getElementById("fifty_fifty").value = document.getElementById("powerUpFiftyFifty").classList.contains("btn-dark")
    }

    $phoneAFriend.click(
        function() {
            if (phoneAFriendUsed === 'false') {
                togglePhoneAFriend()
                updatePhoneAFriendHiddenValue()
            }
        }
    )

    function setUpPhoneAFriend() {
        if (phoneAFriendUsed === 'true') {
            togglePhoneAFriend()
        }
    }

    function togglePhoneAFriend() {
        document.getElementById("powerUpPhoneAFriend").classList.toggle("btn-dark")
    }

    function updatePhoneAFriendHiddenValue() {
        document.getElementById("phone_a_friend").value = document.getElementById("powerUpPhoneAFriend").classList.contains("btn-dark")
    }

    $askTheTeam.click(
        function() {
            if (askTheTeamUsed === 'false') {
                toggleAskTheTeam()
                updateAskTheTeamHiddenValue()
            }
        }
    )

    function setUpAskTheTeam() {
        if (askTheTeamUsed === 'true') {
            toggleAskTheTeam()
        }
    }

    function toggleAskTheTeam() {
        document.getElementById("powerUpAskTheTeam").classList.toggle("btn-dark")
    }

    function updateAskTheTeamHiddenValue() {
        document.getElementById("ask_the_team").value = document.getElementById("powerUpAskTheTeam").classList.contains("btn-dark")
    }

});
