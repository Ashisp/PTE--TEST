<%-- 
    Document   : addsection
    Created on : Apr 30, 2016, 2:55:34 PM
    Author     : Nikesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Add Section</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>

    <body>
        <div class="generic-container">
            <form method="POST">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="time">Time</label>
                        <div class="col-md-7">
                            <input type="number" name="time" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="category">Category</label>
                        <div class="col-md-7"><select name="catId" class="form-control input-sm">
                                <c:forEach items="${categories}" var="category">
                                    <c:set var="id" value="${category.catId}" />
                                    <c:set var="name" value="${category.catName}" />
                                    <option value="<c:out value='${id}' />"><c:out value="${name}" /></option>
                                </c:forEach>
                            </select></div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="order">Order Sequence</label>
                        <div class="col-md-7">
                            <input type="number" name="orderSequence" min="1" />
                        </div>
                    </div>
                </div>
                <input type="submit" value="Save" class="btn btn-success custom-width" />

            </form>
        </div>
    </body>
</html>
