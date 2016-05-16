<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Express Edu.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script type="text/javascript" src="<c:url value='static/js/mytimer.js' />"></script>
        <script type="text/javascript">

            (function ($, global) {

                var _hash = "!",
                        noBackPlease = function () {
                            global.location.href += "#";

                            setTimeout(function () {
                                global.location.href += "!";
                            }, 50);
                        };

                global.setInterval(function () {
                    if (global.location.hash != _hash) {
                        global.location.hash = _hash;
                    }
                }, 100);

                global.onload = function () {
                    noBackPlease();

                    // disables backspace on page except on input fields and textarea..
                    $(document.body).keydown(function (e) {
                        var elm = e.target.nodeName.toLowerCase();
                        if (e.which == 8 && elm !== 'input' && elm !== 'textarea') {
                            e.preventDefault();
                        }
                        // stopping event bubbling up the DOM tree..
                        e.stopPropagation();
                    });
                }

            })(jQuery, window);
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/


            /*function callTimer() {
             var timeFromDb = document.getElementById("timeDb").value;
             var startTime = document.getElementById("startTime").value;
             //startTimer(timeFromDb, startTime);
             }*/

            var time, counter;
            function init() {
                time = parseInt(document.getElementById("audioPlayAfter").value) * 1000;
                counter = time / 1000 - 1;
            }

            function playAudio() {
                var interval = setInterval(function () {
                    //alert(counter);
                    if (counter >= 0) {
                        document.getElementById("playsIn").innerHTML = counter;
                    }
                    counter--;
                    if (counter < 0) {
                        clearInterval(interval);
                        //clearInterval();
                        document.getElementById("playing").innerHTML = "Playing...";
                    }
                }, 1000);
                setTimeout(function () {
                    document.getElementById('audiotag1').play();
                }, time);
            }

            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
            
            function noBack(){window.history.forward();}
        </script>
    </head>
    <body onload="noBack();startExamTimer();
            init();
            playAudio();">

        <%
            int startTime = 0;

            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());

            }

            int count_questions = 0;
            int previous_count = 0;

            if ((session.getAttribute("question_count") != "") && (session.getAttribute("question_count") != null)) {
                count_questions = Integer.parseInt(session.getAttribute("question_count").toString());

            }

            if ((session.getAttribute("previous_count") != "") && (session.getAttribute("previous_count") != null)) {

                previous_count = Integer.parseInt(session.getAttribute("previous_count").toString());
                ;

            }


        %>

        <c:forEach var="question" items="${listOfQuestions}">

            <c:set var="test" value="${offset+1}"/> 
            <c:set var="time_total" value="${question.catId.totalTime/60}"/> 

            <%                        int resp = previous_count;
                int test = Integer.parseInt(pageContext.getAttribute("test").toString());
                resp = resp + test;
                pageContext.setAttribute("resp", resp);
                


            %>
            <div id="logo_place_header">
            </div>
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-7"><h3>Select Missing Word</h3>
                </div>
                <div class="pull-right" id="time_display_box">
                    Time: <span id="time">00:00</span>/<span id="duration"> time_total:00</span>
                </div>
                <div class="pull-right" id="num_of_num">
                    <span id="question"><c:out value="<%=(resp)%>" /></span> of <span id="questions"> <c:out value="<%= (count_questions)%>"  /></span>
                </div>
                <div class="clear"></div>
                <hr/>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>



                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<br/><span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" src="<c:url value='../media/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <form method="post">
                    <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                    <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                    <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                    <input type="hidden" id="previous_count" name="previous_count" value="<c:out value="${resp}" />" />
                    <input type="hidden" id="catTime" name="catTime" value="${question.catId.totalTime}" />
                    <input type="hidden" id="catId" name="catId" value="${question.catId.catId}" />
                    <!--<input type="hidden" name="startTime" id="startTime" value="c:out value="${startTime}" default="1" />" />-->
                    <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                    <input type="hidden" id="timeDb" name="timeDb" value="${question.sectionId.time}" />
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                    <input type="hidden" name="count" value="${count}" />
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                    <div class="userspace">
                        <input type="radio" name="missing" value="_" checked class="hide" />
                        <c:forEach items="${question.answerOptionsCollection}" var="answerOption" >

                            <input type="radio" name="missing" value="<c:out value='${answerOption.ansOption}' />"> &nbsp; <c:out value="${answerOption.ansOption}" /><br/>


                        </c:forEach>
                    </div>
                    <hr/>
                    <div>
                        <input type="submit" name="done" value="Next"  class="btn btn-primary" style="float:right" />
                    </div>
                </form>

            </div>

        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>

</html>
