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

            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
     
            
            

            var source;

            function isbefore(a, b) {
                if (a.parentNode == b.parentNode) {
                    for (var cur = a; cur; cur = cur.previousSibling) {
                        if (cur === b) {
                            return true;
                        }
                    }
                }
                return false;
            }

            function dragenter(e) {
                if (isbefore(source, e.target)) {
                    e.target.parentNode.insertBefore(source, e.target);
                }
                else {
                    e.target.parentNode.insertBefore(source, e.target.nextSibling);
                }
            }

            function dragstart(e) {
                source = e.target;
                e.dataTransfer.effectAllowed = 'move';
            }

            function setAnswer() {
                document.getElementById("answer").value = document.getElementById("target").innerHTML;
            }
        </script>
    </head>
    <body onload="
                startExamTimer();
               ">
        
        <%
            int startTime = 0;
           
            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());
             
                
            }
        %>
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Re-order paragraphs</h1>

                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
<div>
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                 <div>
                     <span id="time">1</span> 0f <span id="duration"> <c:out value="${count}" /></span>
                </div>
                <form method="POST"  onsubmit="setAnswer()">
                    <div class="col-md-6" style="float: left;">
                        <input type="hidden" value="${question.questionId}" name="questionId" />
                        <input type="hidden" name="answer" id="answer" />
                        
                        
                            <input type="hidden" name="offset" value="<c:out value="${offset}" />" />
                            <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                        
                        <h3>Source</h3>
                        <ul class="source" id="source">
                            <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                            <c:forEach items="${question.answerOptionsCollection}" var="option" varStatus="itr">
                                
                                <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">
                                    <c:out value="${option.ansOption}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-md-6" style="float: left;">
                        <h3>Target</h3>
                        <ul class="target" id="target">
                            <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                        </ul>
                    </div>
                    <p class="clear" />
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
