<%-- 
    Document   : results
    Created on : May 5, 2016, 4:50:55 PM
    Author     : Nikesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="10px">
            <thead>
                <tr>
                    <th>Section</th>
                    <th>Question ID</th>
                    <th>Question</th>
                    <th>Answer by Student</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="answer" items="${answers}">
                    <tr>
                        <td><c:out value="${answer.questionId.sectionId.sectionName}"/></td>
                        <th><c:out value="${answer.questionId.questionId}" /></th>
                        <td>
                            <c:if test="${answer.questionId.audioPath != null}">
                                <audio controls="" src="../media/files/<c:out value="${answer.questionId.audioPath}"/>" />
                            </c:if>
                            <c:out value="${answer.questionId.imagePath}"/>
                            <c:out value="${answer.questionId.passage}" escapeXml="false"/>
                        </td>
                        <td>
                            <c:out value="${answer.answer}" escapeXml="false"/>
                            <c:if test="${answer.audioPath ne null}">
                                <audio controls="" src="../media/files/<c:out value="${answer.audioPath}"/>" />
                            </c:if>                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
