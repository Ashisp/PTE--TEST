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
        
        <c:forEach items="${answerss}" var="answers">
            <div class="col-md-10 col-md-offset-1">
              
                <p class="instruction"><c:out value="${answers.auestionId.sectionId.sectonName}" /></p>
                <hr />
               
                <div class="question">
                    <c:out value="${answerss.answer}" />
                </div>
               
               
            </div>
        </c:forEach>

     
       
    </body>
</html>
