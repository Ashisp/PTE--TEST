<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Express Edu.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />

        <style type="text/css">


            h1 {
                text-align: center;
            }

            html, body {
                width: 100%;
                height: 100%;
            }

            .clear {
                clear: both;
            }

            #container {
                position: fixed;
                width: 500px;
                height: 280px;
                top: 50%;
                left: 50%;
                margin-top: -170px;
                margin-left: -250px;
                background-color: white;
            }

            #username {
                margin-top: 30px;
                background-color: #d3d3d3;
                padding: 10px;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }

            p {
                text-align: center;
            }

            p a {
                font-size: 15px;
                color: #CB0012;
                float: right;
                margin-top: -13px;
            }

            p a:hover {
                color: #555;
            }

            input {
                padding-left: 10px;
                /*margin-left: 19px;*/
                width: 80px;
                height: 40px;
                border: none;
                font-size: 15px;
                top: 50%;
                left: 50%;
                margin-left: 209px;
                margin-top: 21px;
            }


            #time, #tot_time{
                font-size: 100px;
            }
        </style>



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

        <link rel="icon" type="image/png" href="<c:out value='/assets/images/favicon.png'/>">

    </head>
    <body onload="startTimer(1200, 1)">

        <div id = "container">
            <h1>Break</h1>
            <p class="instruction">You can have an optional 10 mins break. Click next when you are ready.</p>
            <hr />
            <p class="clear" />
            <form method="POST">
                <div>
                    <input type="hidden" value="${sectionId}" name="currentSection" />
                    <div>
                        <span id="time">00:00</span><span id="tot_time">/10:00</span>
                        <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                    </div>
                    <input type="submit" name="submit" value="Next" class="btn btn-primary" style="float:none" />
                </div>
            </form>
        </div>



        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
