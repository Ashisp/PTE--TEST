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
        <script src="<c:url value='/static/js/mytimer.js' />"></script>
        
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
        
            function setAnswerPassage() {
                document.getElementById("answerPsg").value = document.getElementById("passage").innerHTML;
            }


function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
            function setSelectedItem(selectedItem) {
                selectedItem.options[selectedItem.selectedIndex].setAttribute("selected", "selected");
            }
        </script>
    </head>
    <body
        
        
         onload="init();
                startExamTimer();
             
                     >
                     
                          
        <%
            int startTime = 0;
           
            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());
             
                
            }
        %>
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Fill in the blanks (Reading & Writing)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
        
                <hr />
                 <div>
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                 <div>
                     <span id="time">1</span> 0f <span id="duration"> <c:out value="${count}" /></span>
                </div>
                <p class="clear" />
                <form method="post" onsubmit="setAnswerPassage();">
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    
                    <input type="hidden" id="answerPsg" name="answerPassage" value="" />
                    <div class="userspace">
                        <p id="passage">
                            <c:out value="${question.passage}" escapeXml="false" />
                        </p>
                        <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
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
