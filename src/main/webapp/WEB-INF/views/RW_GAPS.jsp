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
    </head>
    <body>
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Fill in the blanks (Reading & Writing)</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <p class="clear" />
                <form action="" method="post">
                    <div class="userspace">
                        <p>
                            One seminal difference in policy remains; the 
                            <select name="blank1" class="blanks form-control">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            has not matched what is Labor's most important innovation promise. 
                            That is to bring together responsibilities for innovation, industry, science and research under one single federal minister. 
                            Innovation responsibilities 
                            <select name="blank2" class="blanks form-control">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            lie within the powerful Department of Education and Science, and while there is a 
                            <select name="blank3" class="blanks form-control">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            industry department, it has little influence within Cabinet. This has 
                            <select name="blank4" class="blanks form-control">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            policy development and given Australia's innovation policies a distinctly science and research
                            <select name="blank5" class="blanks form-control">
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            . It is the scientists rather than the engineers who call the tune in innovation policy in Canberra, 
                            so it's no surprise our policies are all about boosting government funded research and later 
                            their results.
                        </p>
                    </div>
                    <div>
                        <input type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
            </div>
        </c:forEach>

        <tag:paginate max="10" offset="${offset}" count="${count}" 
			uri="/Spring4MVCFileUploadDownloadWithHibernate/RW-GAPS" next="&raquo;" previous="&laquo;" />
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
