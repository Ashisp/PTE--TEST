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

            function dragensster(e) {
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

        </script>
    </head>
    <body>
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Re-order paragraphs</h1>

                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>

                <div class="col-md-6" style="float: left;">
                    <h3>Source</h3>
                    <ul class="source">
                        <c:forEach items="${question.answerOptionsCollection}" var="option">
                            <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)"><c:out value="${option.ansOption}" /></li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="col-md-6" style="float: left;">
                    <h3>Target</h3>
                    <ul class="target">
                        <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                    </ul>
                </div>
                <p class="clear" />
            </div>
        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
