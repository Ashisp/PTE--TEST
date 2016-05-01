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
    </head>
    <body>
        <div class="col-md-10 col-md-offset-1">
            <h1>Repeat sentence</h1>
            <p class="instruction">You will hear a sentence. Please repeat the sentence exactly as you hear it. You will hear the sentence only once.</p>
            <hr />
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src="../raw_res/audio.mp3" onended="alert(\"ended\")"></audio>
            </div>
            <p class="clear" />
            <hr/>
            <div class="recorderSpace" style="float:left;">
                <input id="time-limit" type="range" min="1" max="10" value="10" class="hidden"><br/>
                <input id="encoding-option" type="range" min="0" max="11" value="6" class="hidden"><br/>
                <button class="btn btn-success" id="turnOn" onclick="turnMicrophoneOn()">Turn Mic On</button>
                <input id="report-interval" type="range" min="1" max="5" value="1" class="hidden"><br/>
                <input id="buffer-size" type="range" min="0" max="6" class="hidden"><br/>
                
                <div class="form-group">
                    <p class="clear" />
                    <div class="col-sm-3 control-label">
                        <span id="recording" class="text-danger hidden"><strong>RECORDING</strong></span>&nbsp; <span id="time-display">00:00</span>
                    </div>
                    <div class="col-sm-9">
                      <button id="record" class="btn btn-danger">RECORD</button>
                      <button id="cancel" class="btn btn-default hidden">CANCEL</button>
                    </div>
                    <!--<div class="col-sm-6"><span id="date-time" class="text-info"></span></div>-->
                </div>
            </div>
        </div>
        
        
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/static/js/WebAudioRecorder.min.js' />"></script>
        <script src="<c:url value='/static/js/RecorderDemo.js' />"></script>
</html>
