<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>User Registration Form</title>
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

        <script>
            function changeStatus(){
                var statusElement = document.getElementById("approveSuspend");
                var statusValue = statusElement.value;
                
                var approveStatus = document.getElementById("approveStatus");
                var approveStatusValue = approveStatus.value;
                
                if(approveStatusValue == 0){
                    approveStatus.value = 1;
                }else{
                    approveStatus.value = 0;
                }
                
                if(statusValue == "Approve"){
                    statusElement.value = "Suspend";
                }else{
                    statusElement.value = "Approve";
                }
                
                
            }
        </script>
    </head>

    <body>

        <div class="generic-container">
            <div class="well lead">User Registration Form</div>
            <form:form method="POST" modelAttribute="user" class="form-horizontal">


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="firstName">First Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="firstName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="lastName">Last Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="lastName" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="email">Email</label>
                        <div class="col-md-7">
                            <form:input type="text" path="email" id="email" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="email" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="password">Password</label>
                        <div class="col-md-7">
                            <form:input type="password" path="password" id="password" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="password" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="dob">Date of Birth</label>
                        <div class="col-md-7">
                            <form:input type="date" path="dob" id="dob"  class="form-control input-sm" value="yyyy-mm-dd" />
                            <div class="has-error">
                                <form:errors path="dob" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="phoneNo">Phone No.</label>
                        <div class="col-md-7">
                            <form:input type="text" path="phoneNo" id="phoneNo" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="phoneNo" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="streetAddress1">Street Address 1</label>
                        <div class="col-md-7">
                            <form:input type="text" path="streetAddress1" id="streetAddress1" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="streetAddress1" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="streetAddress2">Street Address 2</label>
                        <div class="col-md-7">
                            <form:input type="text" path="streetAddress2" id="streetAddress2" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="streetAddress2" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="examDate">Exam date</label>
                        <div class="col-md-7">
                            <form:input type="date" path="examDate" id="examDate" class="form-control input-sm" value="yyyy-mm-dd"/>
                            <div class="has-error">
                                <form:errors path="examDate" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="city">City</label>
                        <div class="col-md-7">
                            <form:input type="text" path="city" id="city" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="city" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="state">State</label>
                        <div class="col-md-7">
                            <form:input type="text" path="state" id="state" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="state" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="postalCode">Postal Code</label>
                        <div class="col-md-7">
                            <form:input type="text" path="postalCode" id="postalCode" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="postalCode" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>   

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="country">Country</label>
                        <div class="col-md-7">
                            <form:input type="text" path="country" id="country" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="country" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label" for="country">User Status</label>
                        <div class="col-md-7">
                            <input type="hidden" id="approveStatus" name="aproveStatus" value="0" />
                            <input type="button" id="approveSuspend" name="status" value="Approve" onclick="changeStatus()"></input>
                            <div class="has-error">
                                <!--<form:errors path="approveStatus" class="help-inline"/>-->
                            </div>
                        </div>
                    </div>
                </div>            

                <div class="row">
                    <div class="form-actions floatRight">
                        <c:choose>
                            <c:when test="${edit}">
                                <input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <c:if test="${edit}">
                    <span class="well pull-left">
                        <a href="<c:url value='/add-document-${user.userId}' />">Click here to upload/manage your documents</a>	
                    </span>
                </c:if>

            </form:form>
        </div>
    </body>
</html>