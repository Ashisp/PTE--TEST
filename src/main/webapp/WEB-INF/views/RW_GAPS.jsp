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
            
            function setAnswerPassage() {
                document.getElementById("answerPsg").value = document.getElementById("passage").innerHTML;
            }

            function setSelectedItem(selectedItem) {
                selectedItem.options[selectedItem.selectedIndex].setAttribute("selected", "selected");
            }
        </script>
    </head>
    <body>
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Fill in the blanks (Reading & Writing)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <p class="clear" />
                <form method="post" onsubmit="setAnswerPassage();">
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <c:set var="offset" value="${offset}" />
                    <input type="hidden" id="answerPsg" name="answerPassage" value="" />
                    <div class="userspace">
                        <p id="passage">
                            <c:out value="${question.passage}" escapeXml="false" />
                        </p>
                    </div>
                    <div>
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
                      uri="/ptetest/RW-GAPS" />
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
