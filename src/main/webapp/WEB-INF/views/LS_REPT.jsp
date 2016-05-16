<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
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

        <script src="<c:url value='/static/js/mytimer.js' />"></script>
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
            if (e.which == 8 && elm !== 'input' && elm  !== 'textarea') {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        });
    }

})(jQuery, window);
            var GLOBAL_IS_AUDIO_SAVED = false;
            var IS_STOPPED = false;

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
                        clearInterval();
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
    <body onload="noBack();init();
            startExamTimer();
            playAudio();">


        <%
            int startTime = 0;

            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());

            }
            int count_ques = 0;

            if ((session.getAttribute("question_count") != "") && (session.getAttribute("question_count") != null)) {
                count_ques = Integer.parseInt(session.getAttribute("question_count").toString());
            }
            int previous_count = 0;

            if ((session.getAttribute("previous_count") != "") && (session.getAttribute("previous_count") != null)) {

                previous_count = Integer.parseInt(session.getAttribute("previous_count").toString());
            }

            if (previous_count >= count_ques) {

                previous_count = count_ques;
            }
        %>


        <c:set var="test" value="${offset+1}"/>
        <%
            int resp = previous_count;
            int test = Integer.parseInt(pageContext.getAttribute("test").toString());
            resp = resp + test;
            pageContext.setAttribute("resp", resp);

        %>


        <c:forEach var="question" items="${listOfQuestions}">
            <table>
                <tr>

                </tr>
            </table>

            <div class="col-md-10 col-md-offset-1">
                <h1>Repeat sentence</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div>
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                <div>
                    <span id="question"><c:out value="${resp}" /></span> 0f <span id="quesions"> <c:out value="<%= (count_ques)%>" /></span>
                </div>

                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" onended="readyRecording();" src="<c:url value='../media/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <hr/>
                <form method="post"  onsubmit="return imDone();">

                    <div class="recorderSpace" style="float:left;">
                        <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                        <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                        <input type="hidden" id="elapsedTime" name="elapsedTime" value="" />

                        <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                        <input type="hidden" id="previous_count" name="previous_count" value="<c:out value="${resp}" />" />

                        <input type="hidden" id="stopsIn" name="stopsIn" value="<c:out value="${question.sectionId.maxRecordingTime}" />" />
                        <input type="hidden" id="startsIn" name="startsIn" value="<c:out value="${question.sectionId.startRecordAfter}" />	" />
                        <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                        <input type="hidden" value="<c:out value="${question.questionId}" />" name="questionId" />
                        <input type="hidden" name="filename" id="filename" value="" />

                        <div class="form-group">
                            <p class="clear" />
                            <div class="col-sm-12 control-label">
                                <span id="sHide">Starts in <span id="recordsIn"></span></span>
                                <span class="recordEndDisplay"><span id="endsIn">00</span>/<span id="totalRecordTime">00</span></span>
                            </div>
                            <div class="col-sm-12">
                                <img id="mic" src="<c:url value="static/images/mic.png" />" />
                            </div>
                            <!--<div class="col-sm-6"><span id="date-time" class="text-info"></span></div>-->
                        </div>
                    </div>

                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    <div>
                        <input type="submit" name="done" value="Next"  class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>
        </c:forEach>
        <div id="recording-list"></div>



        <script>
            function imDone() {
                if (audioRecorder.isRecording() && !IS_STOPPED) {
                    recordStartStop();
                    IS_STOPPED = true;
                    if (document.getElementById("filename").value !== "") {
                        return true;
                    }
                } else {
                    return true;
                }
            }

            function readyRecording() {
                document.getElementById("totalRecordTime").innerHTML = document.getElementById("stopsIn").value;
                document.getElementById("recordsIn").innerHTML = document.getElementById("startsIn").value;
                var fileNameHaita = document.getElementById("filename");
                fileNameHaita.value = "recording" + new Date().getTime() + ".mp3";

              var starts = parseInt(document.getElementById("startsIn").value);
                var interval = setInterval(function () {
                    if (starts < 0) {

                        recordStartStop();   // GOT INTO PROBLEM? RETHINK ABOUT THIS LINK (MIGHT SOLVE BY ADDING SOMETHING HERE clearInterval and stoprec.
                        clearInterval(interval);
                        endRecording();
                    } else {
                        document.getElementById("recordsIn").innerHTML = starts;
                    }
                    starts--;
                }, 1000);
            }

            function endRecording() {
                var stops = document.getElementById("stopsIn").value;
                var initialStopCount = 0;
                var endInterval = setInterval(function () {
                    if (IS_STOPPED) {
                        clearInterval(endInterval);
                    }
                    if (initialStopCount >= stops) {
                        IS_STOPPED = true;
                        recordStartStop();    // should call the function to stop the recording here.
                        clearInterval(endInterval);
                    }
                    document.getElementById("endsIn").innerHTML = initialStopCount;

                    initialStopCount++;
                }, 1000);
            }
        </script>
        <script src="<c:url value='/static/js/jquery.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>

        <!-- NEW RECORDING LIBRARY -->
        <script src="<c:url value='/static/js/WebAudioRecorder.js' />"></script>
        <script src="<c:url value='/static/js/RecorderDemo.js' />"></script>
</html>
