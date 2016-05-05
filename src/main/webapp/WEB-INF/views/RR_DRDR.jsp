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
    <body>
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Re-order paragraphs</h1>

                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>

                <form method="POST"  onsubmit="setAnswer()">
                    <div class="col-md-6" style="float: left;">
                        <input type="hidden" value="${question.questionId}" name="questionId" />
                        <input type="hidden" name="answer" id="answer" />
                        <h3>Source</h3>
                        <ul class="source" id="source">
                            <c:forEach items="${question.answerOptionsCollection}" var="option" varStatus="itr">
                                <c:set var="offset" value="${offset + itr.index +1}" />
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
                      uri="/Spring4MVCFileUploadDownloadWithHibernate/RR-DRDR" next="&raquo;" previous="&laquo;" />
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
