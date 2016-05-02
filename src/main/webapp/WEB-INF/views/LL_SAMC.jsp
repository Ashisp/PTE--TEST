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
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Multiple-choice, choose single answers (Listening)</h1>
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
                    <div class="userspace">
                        <c:forEach var="options" items="${question.answerOptionsCollection}">
                            <input type="radio" name="choice" value="<c:out value='${options.optId}' />"><c:out value="${options.option}" /><br/>
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
