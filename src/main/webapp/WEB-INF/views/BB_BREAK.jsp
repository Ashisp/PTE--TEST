<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
//            window.onbeforeunload = function (e) {
//                e = e || window.event;
//
//                // For IE and Firefox prior to version 4
//                if (e) {
//                    e.returnValue = 'You sure?';
//                }
//
//                // For others
//                return 'You sure?';
//            };
            function startTimer(duration, start) {
                var timer = start, minutes, seconds;
                var display = document.querySelector('#time');
                var elapsedTime = document.getElementById("elapsedTime");
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;
                    elapsedTime.value = timer;
                    if (++timer > duration) {
                        timer = duration;
                        document.getElementById("essay").disabled = "true";
                    }
                    //alert("Timer: " + timer);
                }, 1000);
            }
        </script>
    </head>
    <body onload="startTimer(1200, 1)">

        <div class="col-md-10 col-md-offset-1">
            <h1>Break</h1>
            <p class="instruction">You can take a break and relax. Press done button when you're ready again.</p>
            <hr />
            <div class="col-md-5 imageView">
                <img src="../raw_res/image.jpg" alt="image" />
                </sdiv>
                <p class="clear" />


                <form method="POST">
                    <div>

                        <input type="hidden" value="${sectionId}" name="currentSection" />
                        <div>
                            <span id="time">00:00</span>/10:00
                            <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                        </div>
                        <input type="submit" name="submit" value="Next" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>



            <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
            <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
