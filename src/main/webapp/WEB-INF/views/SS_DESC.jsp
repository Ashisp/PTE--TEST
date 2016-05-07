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
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" /><script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/static/js/WebAudioRecorder.min.js' />"></script>
        <script src="<c:url value='/static/js/RecorderDemo.js' />"></script>
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
        </script>
    </head>
    <body>
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Describe image</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="imageView">
                    <img src="<c:url value="${question.imagePath}" />" alt="image" />
                </div>
                <div class="recorderSpace">
                    <c:set var="offset" value="${offset}" />
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
                <form method="post" action="<c:url value="/loadSection" />" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>
        </c:forEach>
        <div id="recording-list"></div>

        <tag:paginate max="10" offset="${offset}" count="${count}" 
                      uri="/ptetest/SS-DESC"  />

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/static/js/WebAudioRecorder.min.js' />"></script>
        <script src="<c:url value='/static/js/RecorderDemo.js' />"></script>
    </body>
</html>
