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
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Multiple-choice, choose multiple answers (Listening)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />

                <div class="question">
                    <c:out value="${question.question}" />
                </div>

                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player</h3>
                    <audio controls="controls" src="<c:url value='${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />

                <form action="" method="post">
                    <input type="hidden" name="userId" value="1000" />
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <div class="userspace">
                        <c:forEach var="options" items="${question.answerOptionsCollection}">
                            <input type="checkbox" name="choices" value="<c:out value='${options.ansOption}' />"><c:out value="${options.ansOption}" /><br/>
                        </c:forEach>
                    </div>
                    <div>
                        <input type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
            </div>
        </c:forEach>


        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
