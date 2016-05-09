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
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/static/js/mytimer.js' />"></script>
        <script type="text/javascript">
            var GLOBAL_IS_AUDIO_SAVED = false;
            var IS_STOPPED = false;
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
            /*window.onbeforeunload = function (e) {
             e = e || window.event;
             
             // For IE and Firefox prior to version 4
             if (e) {
             e.returnValue = 'You sure?';
             }
             
             // For others
             return 'You sure?';
             };*/
            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
        </script>

    </head>
    <body>
        <%
            int startTime = 0;
            if ((session.getAttribute("startTime") != "") &&(session.getAttribute("startTime") != null)){
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());
            }
        %>
        <c:forEach items="${listOfQuestions}" var="question">

            <div class="col-md-10 col-md-offset-1">
                <h1>Read aloud</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div>
                   
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                <form method="post" onsubmit="return imDone();">
                    <div class="recorderSpace" style="float:left;">
                        <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                        <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                        <input type="hidden" id="elapsedTime" name="elapsedTime" value="" />

                        <input type="hidden" id="stopsIn" name="stopsIn" value="<c:out value="${question.sectionId.maxRecordingTime}" />" />
                        <input type="hidden" id="startsIn" name="startsIn" value="<c:out value="${question.sectionId.startRecordAfter}" />	" />
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
                        <input type="submit" name="done" value="Done"  class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>

        </c:forEach>
        <div id="recording-list"></div>



        <script>
            function __log(e, data) {
                log.innerHTML += "\n" + e + " " + (data || '');
            }

            var audio_context;
            var recorder;

            function startUserMedia(stream) {
                var input = audio_context.createMediaStreamSource(stream);
                //__log('Media stream created.');
                //__log("input sample rate " + input.context.sampleRate);

                // Feedback!
                //input.connect(audio_context.destination);
                //__log('Input connected to audio context destination.');

                recorder = new Recorder(input, {
                    numChannels: 1
                });
                __log('Recorder initialised.');
            }

            function startRecording() {
                recorder && recorder.record();
                /*button.disabled = true;
                 button.nextElementSibling.disabled = false;*/
                __log('Recording...');
            }

            function imDone() {
                if (!IS_STOPPED) {
                    IS_STOPPED = true;
                    stopRecording();
                }
                return GLOBAL_IS_AUDIO_SAVED;
            }

            function stopRecording() {
                recorder && recorder.stop();
                //button.disabled = true;
                //button.previousElementSibling.disabled = false;
                __log('Stopped recording.\nUploading please wait...');


                // create WAV download link using audio data blob
                createDownloadLink();

                recorder.clear();
                return true;
            }

            function createDownloadLink() {
                recorder && recorder.exportWAV(function (blob) {
                    //alert("Created DownloadLink");
                    /*var url = URL.createObjectURL(blob);
                     var li = document.createElement('li');
                     var au = document.createElement('audio');
                     var hf = document.createElement('a');
                     
                     au.controls = true;
                     au.src = url;
                     hf.href = url;
                     hf.download = new Date().toISOString() + '.wav';
                     hf.innerHTML = hf.download;
                     li.appendChild(au);
                     li.appendChild(hf);
                     recordingslist.appendChild(li);*/
                });
            }

            function readyRecording() {
                var starts = parseInt(document.getElementById("startsIn").value);
                var interval = setInterval(function () {
                    if (starts < 0) {
                        startRecording();
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
                        stopRecording();
                        clearInterval(endInterval);
                    }
                    document.getElementById("endsIn").innerHTML = initialStopCount;

                    initialStopCount++;
                }, 1000);
            }

            window.onload = function init() {
                try {
                    // webkit shim
                    window.AudioContext = window.AudioContext || window.webkitAudioContext;
                    navigator.getUserMedia = (navigator.getUserMedia ||
                            navigator.webkitGetUserMedia ||
                            navigator.mozGetUserMedia ||
                            navigator.msGetUserMedia);
                    window.URL = window.URL || window.webkitURL;

                    audio_context = new AudioContext;
                    //__log('Audio context set up.');
                    //__log('navigator.getUserMedia ' + (navigator.getUserMedia ? 'available.' : 'not present!'));

                } catch (e) {
                    alert('No web audio support in this browser!');
                }

                navigator.getUserMedia({audio: true}, startUserMedia, function (e) {
                    __log('No live audio input: ' + e);
                });
                document.getElementById("totalRecordTime").innerHTML = document.getElementById("stopsIn").value;
                document.getElementById("recordsIn").innerHTML = document.getElementById("startsIn").value;
                readyRecording();
                startExamTimer();
            };
        </script>
        <script src="<c:url value='/static/js/jquery.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>

        <script src="<c:url value="/static/js/recordmp3.js" />"></script>
        <script>
            /*var fd = new FormData();
             //console.log("mp3name = " + mp3Name);
             fd.append('fname', 'nikesh');
             fd.append('audio', 'yynikesh');
             fd.append('data', 'dd');
             //alert("Form DATA: " + fd.get('data'));
             $.ajax({
             type: 'POST',
             url: '/ptetest/RecordingHandle',
             data: fd,
             processData: false,
             contentType: false
             }).done(function (data) {
             //console.log(data);
             log.innerHTML += "\n" + "Done uploading.";
             });*/
        </script>
    </body>
</html>
