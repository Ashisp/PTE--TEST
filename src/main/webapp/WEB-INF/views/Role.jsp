<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Users List</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>
    <body>
        <div class="panel-heading" style="align-content: center; margin-left: 300px;" >
            <span class="lead">
                <div class="center-block">
                    <a href="<c:url value='/login' />"    class="btn btn-success custom-width">Admin</a>
                    <a href="<c:url value='/login' />" class="btn btn-success custom-width">Student</a>
                </div>
            </span>
        </div>

    </body>
</html>