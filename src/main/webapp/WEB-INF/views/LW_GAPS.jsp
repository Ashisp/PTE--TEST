<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
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

        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Fill in the blanks (Listening)</h1>
                <p class="instruction">${question.sectionId.instructions}</p>
                <hr />
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player</h3>
                    <audio controls="controls" src="<c:url value='${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <form method="post">
                    <c:set var="offset" value="${offset}" />
                    <div class="userspace">
                        <p>
                            <c:out value="${question.passage}" escapeXml="false" />
                            <input type="hidden" name="questionId" value="${question.questionId}" />
                            <input type="hidden" name="userId" value="1000" />
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
                      uri="/Spring4MVCFileUploadDownloadWithHibernate/LW-GAPS" next="&raquo;" previous="&laquo;" />

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
