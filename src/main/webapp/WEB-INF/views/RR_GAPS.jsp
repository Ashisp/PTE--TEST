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

            function setAnswer() {
                document.getElementById("answerPassage").value = document.getElementById("paragraph").innerHTML;
            }
        </script>
    </head>
    <body>
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Fill in the blanks (Reading)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <p class="clear" />
                <form action="" method="post">
                    <div class="userspace">
                        <input type="hidden" name="questionId" value="${question.questionId}" />
                        <input type="hidden" id="answerPassage" name="answerPassage" value="" />
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
                        <!-- SHOULD SENED AJAX REQUEST ON CLICK -->
                        <input type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
                <form method="post" action="<c:url value="/loadSection" />" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>
        </c:forEach>

        <tag:paginate max="10" offset="${offset}" count="${count}" 
                      uri="/ptetest/RR-GAPS"  />
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
