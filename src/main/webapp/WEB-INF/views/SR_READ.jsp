<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />

        <script src="<c:url value='/static/js/mytimer.js' />"></script>
        <script type="text/javascript">
            var GLOBAL_IS_AUDIO_SAVED = false;
            var IS_STOPPED = false;
            
            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
        </script>

    </head>
    <body onload="readyRecording();
            startExamTimer();">
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

            }


        %>





        <c:forEach items="${listOfQuestions}" var="question">


            <c:set var="test" value="${offset+1}"/>
            <%    int resp = previous_count;
                int test = Integer.parseInt(pageContext.getAttribute("test").toString());
                resp = resp + test;
                pageContext.setAttribute("resp", resp);

            %>
            <div class="col-md-10 col-md-offset-1">
                <h1>Read aloud</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div>
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                <div>
                    <span id="quesion"><c:out value="<%=(resp)%>" /></span> of <span id="quesions"> <c:out value="<%= (count_questions)%>"  /></span>
                </div>  
                <form method="post" onsubmit="return imDone();">
                    <div class="recorderSpace" style="float:left;">
                        <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                        <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                        <input type="hidden" id="elapsedTime" name="elapsedTime" value="" />

                        <!-- NEEDS TO SEND THIS VALUE TO THE TIME LIMIT VARIABLE OF THE RECORDING LIBRARY -->
                        <input type="hidden" id="stopsIn" name="stopsIn" value="<c:out value="${question.sectionId.maxRecordingTime}" />" />
                        <input type="hidden" id="startsIn" name="startsIn" value="<c:out value="${question.sectionId.startRecordAfter}" />" />
                        <input type="hidden" value="<c:out default="0" value="${offset}" />" name="offset" />
                        <input type="hidden" value="<c:out value="${question.questionId}" />" name="questionId" />
                        <input type="hidden" name="filename" id="filename" value="" />

                        <div class="form-group">
                            <p class="clear" />
                            <div class="col-sm-6 control-label">
                                Starts in <span id="recordsIn"></span><br/>
                                Recording time <span id="endsIn"></span>/<span id="totalRecordTime"></span>
                            </div>
                            <div class="col-sm-9">
                                <h2>Log</h2>
                                <pre id="log"></pre>
                            </div>
                            <!--<div class="col-sm-6"><span id="date-time" class="text-info"></span></div>-->
                        </div>
                    </div>
                    <p class="clear"/>
                    <div class="question">
                        <p>
                            <c:out value="${question.passage}" />
                        </p>
                    </div>

                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                    <div>           
                        <input type="submit" name="done" value="Next"  class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>
            <!--<div class="form-group">
                <div class="col-sm-3 control-label"><span id="recording" class="text-danger hidden"><strong>RECORDING</strong></span>&nbsp; <span id="time-display">00:00</span></div>
                <div class="col-sm-3">
                    <button id="record" class="btn btn-danger">RECORD</button>

                </div>

            </div>-->

        </c:forEach>


        <script>

            function imDone() {
                if (audioRecorder.isRecording() && !IS_STOPPED) {
                    recordStartStop();
                    IS_STOPPED = true;
                    if(document.getElementById("filename").value !== ""){
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

                var starts = 5;//parseInt(document.getElementById("startsIn").value);
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
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <!-- NEW RECORDING LIBRARY -->
        <script src="<c:url value='/static/js/WebAudioRecorder.js' />"></script>
        <script src="<c:url value='/static/js/RecorderDemo.js' />"></script>
    </body>
</html>
