<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Users List</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>

    <body>
        <div class="generic-container">
            <div class="panel panel-default">



                <!-- Default panel contents -->
                <div class="panel-heading"><span class="lead">List of Users </span></div>
                <div class="tablecontainer">




                    <form method="POST" action="uploadFile" enctype="multipart/form-data">
                        File to upload: <input type="file" name="file"><br /> 
                        Name: <input type="text" name="name"><br /> <br /> 
                        <input type="submit" value="Upload"> Press here to upload the file!
                    </form>

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Date of Birth</th>
                                <th>Exam Date</th>
                                <th>Phone Number</th>
                                <th>Street Address 1</th>
                                <th>Street Address 2</th>
                                <th>city</th>
                                <th>State</th>
                                <th>Postal Code</th>
                                <th>country</th>
                                <th>Approve Status</th>




                                <th width="100"></th>
                                <th width="100"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.firstName}</td>

                                    <td>${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.dob}</td>
                                    <td>${user.examDate}</td>
                                    <td>${user.phoneNo}</td>
                                    <td>${user.streetAddress1}</td>
                                    <td>${user.streetAddress2}</td>
                                    <td>${user.city}</td>
                                    <td>${user.state}</td>
                                    <td>${user.postalCode}</td>
                                    <td>${user.country}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.approveStatus}">
                                                <c:out value="Approved" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Approved" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>








                                    <td><a href="<c:url value='/edit-user-${user.userId}' />" class="btn btn-success custom-width">edit</a></td>
                                    <td><a href="<c:url value='/delete-user-${user.userId}' />" class="btn btn-danger custom-width">delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="well">
                <a href="<c:url value='/register' />">Add New User</a>
            </div>
        </div>
    </body>
</html>