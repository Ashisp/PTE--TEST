<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
            <h1>Describe image</h1>
            <p class="instruction">Look at the graph below. Please press record and speak into the microphone and describe in detail what the graph is 
                showing. You will have 40 seconds to give your response.</p>
            <hr />
            <div class="imageView">
                <img src="../raw_res/image.jpg" alt="image" />
            </div>
            
            <div class="recorderSpace">
                <input id="time-limitS" type="range" min="1" max="10" value="10" class="hidden"><br/>
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
    </body>
</html>
