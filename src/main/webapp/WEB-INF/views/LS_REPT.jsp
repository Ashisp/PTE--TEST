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
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
            window.onbeforeunload = function (e) {
                e = e || window.event;

                // For IE and Firefox prior to version 4
                if (e) {
                    e.returnValue = 'You sure?';
                }

                // For others
                return 'You sure?';
            };


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
        </script>
    </head>
    <body onload="init();
            playAudio();
            loadLibrary();">
        <c:forEach var="question" items="${listOfQuestions}">
            <table>
                <tr>

                </tr>
            </table>

            <div class="col-md-10 col-md-offset-1">
                <h1>Repeat sentence</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" src="<c:url value='/static/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <hr/>
                <c:set var="offset" value="${offset}" />
                <div class="recorderSpace" style="float:left;">
                    <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                    <input type="hidden" id="stopsIn" name="stopsIn" value="<c:out value="${question.sectionId.maxRecordingTime}" />" />
                    <input type="hidden" id="startsIn" name="startsIn" value="<c:out value="${question.sectionId.startRecordAfter}" />	" />

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
                <form method="post">
                     <input type="hidden" value="${sectionId}" name="currentSection" />
                    <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
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

            function stopRecording() {
                recorder && recorder.stop();
                //button.disabled = true;
                //button.previousElementSibling.disabled = false;
                __log('Stopped recording.\nUploading please wait...');


                // create WAV download link using audio data blob
                createDownloadLink();

                recorder.clear();
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
                    if (initialStopCount >= stops) {
                        stopRecording();
                        clearInterval(endInterval);
                    }
                    document.getElementById("endsIn").innerHTML = initialStopCount;

                    initialStopCount++;
                }, 1000);
            }

            function loadLibrary() {
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
            }
        </script>
        <script src="<c:url value='/static/js/jquery.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>

        <script src="<c:url value="/static/js/recordmp3.js" />"></script>
</html>
