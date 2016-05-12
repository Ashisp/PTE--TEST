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
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script src="<c:url value='/static/js/mytimer.js' />"></script>
        <script type="text/javascript">

            function allowDrop(ev) {
                ev.preventDefault();
            }

            function drag(ev) {
                ev.dataTransfer.setData("text", ev.target.id);
            }

            function drop(ev) {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
                setAnswer();
            }

            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }

            function setAnswer() {
                document.getElementById("answerPassage").value = document.getElementById("paragraph").innerHTML;
            }
        </script>
    </head>
    <body onload="startExamTimer();">
        <%
            int startTime = 0;

            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());

            }
        %>

        <c:forEach items="${listOfQuestions}" var="question">
            <div class ="col-md-10 col-md-offset-1">
            <h1> Fill in the blanks (Reading) </h1>
            <p class ="instruction"><c:out value="${question.sectionId.instructions}" /></p>
            <hr />
            <div>
                Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
            </div>
            <div>
                <span id="time">1</span> 0f <span id="duration"> <c:out value="${count}" /></span>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />

                <div class="userspace">
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <input type="hidden" id="answerPassage" name="answerPassage" value="" />
                    <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                    <input type="hidden" name="count" value="${count}" />
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    <p id="paragraph">
                        <c:out value="${question.passage}" escapeXml="false" />
                    </p>
                    <br>

                    <div style="height:50px">
                        <c:forEach items="${question.answerOptionsCollection}" var="option" >

                            <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)">
                                <div id="<c:out value="${option.optId}" />" class="answer-box" draggable="true" ondragstart="drag(event)"><c:out value="${option.ansOption}" /></div>
                            </span>
                        </c:forEach>
                    </div>
                </div>
                <div>
                    <input type="submit" name="submit" value="Next" class="btn btn-primary" style="float:right" />
                </div>    
            </form>

        </div>
    </c:forEach>
    <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</body>
</html>
