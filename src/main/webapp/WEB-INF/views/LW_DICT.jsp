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
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Write from dictation</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player</h3>
                    <audio controls="controls" src="<c:url value="${question.audioPath}" />"></audio>
                </div>
                <p class="clear" />
                <form action="" method="post">
                    <div class="userspace">
                        <input type="text" spellcheck="false" maxLength="250" class="form-control" />
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
