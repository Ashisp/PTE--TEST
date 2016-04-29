<%-- 
    Document   : addquestion
    Created on : Apr 29, 2016, 12:28:00 PM
    Author     : Nikesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Add Question</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>
    <body>
        <div class="generic-container">
            <c:forEach items="${questions}" var="q">
                <c:out value="${q.question}" />
            </c:forEach>
            
            <form method="POST">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="category">Category</label>
                        <div class="col-md-7">
                            <select name="category" class="form-control input-sm">
                                <c:forEach items="${categories}" var="category">
                                    <c:set var="id" value="${category.catId}" />
                                    <c:set var="name" value="${category.catName}" />
                                    <option value="<c:out value="${id}" />"><c:out value="${name}" /></option>
                                </c:forEach>
                            </select>
                            <div class="has-error">
                                <form:errors path="firstName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="type">Type</label>
                        <div class="col-md-7">
                            <select name="type" class="form-control input-sm">
                                <c:forEach items="${types}" var="type">
                                    <c:set var="typeId" value="${type.typeId}" />
                                    <c:set var="typeName" value="${type.typeName}" />
                                    <option value="<c:out value="${typeId}" />"><c:out value="${typeName}" /></option>
                                </c:forEach>
                            </select>
                            <div class="has-error">
                                <form:errors path="firstName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
