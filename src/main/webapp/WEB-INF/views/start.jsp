<%-- 
    Document   : start
    Created on : May 5, 2016, 9:22:49 PM
    Author     : Nikesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Start Test</title>
        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
    </head>
    <body>
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <form method="post" action="<c:url value="/loadSection" />">
            <div style="margin: 0 200px;">
                <input type="hidden" name="currentSection" value="0" />
                <input type="submit" class="btn btn-success done form-control" value="Start" />
            </div>
        </form>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
