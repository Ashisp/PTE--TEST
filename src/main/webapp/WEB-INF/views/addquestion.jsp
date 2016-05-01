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
            <form method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="category">Category</label>
                        <div class="col-md-7">
                            <select name="catId.catId" class="form-control input-sm">
                                <c:forEach items="${categories}" var="category">
                                    <c:set var="id" value="${category.catId}" />
                                    <c:set var="name" value="${category.catName}" />
                                    <option value="<c:out value="${id}" />"><c:out value="${name}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="instructions">Instructions</label>
                        <div class="col-md-7">
                            <textarea name="instructions" style="resize: none;" class="form-control input-sm"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="section">Section</label>
                        <div class="col-md-7">
                            <select name="sectionId.sectionId" class="form-control input-sm">
                                <c:forEach items="${sections}" var="section">
                                    <c:set var="sectionId" value="${section.sectionId}" />
                                    <c:set var="sectionName" value="${section.sectionName}" />
                                    <option value="<c:out value="${sectionId}" />"><c:out value="${sectionName}" /></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="audio">Audio</label>
                        <div class="col-md-7">
                            <input type="file" name="audio" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="image">Image</label>
                        <div class="col-md-7">
                            <input type="file" name="image" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="passage">Passage</label>
                        <div class="col-md-7">
                            <textarea name="passage" class="form-control input-sm" style="resize: none" rows="5"></textarea>
                            <div class="has-error">
                                <form:errors path="passage" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="question">Question</label>
                        <div class="col-md-7">
                            <textarea name="question" class="form-control input-sm" style="resize: none" rows="5"></textarea>
                            <div class="has-error">
                                <form:errors path="question" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" value="Save" class="btn btn-success custom-width" />
            </form>
        </div>
    </body>
</html>
