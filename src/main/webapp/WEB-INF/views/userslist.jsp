<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>

<%@include file="header.jsp" %>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <!-- top navigation -->
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="clearfix"></div>

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3>Admin Navigation</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Drop down for more options <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="#">User List</a>
                                        </li>
                                        <li><a href="/answers-{userId}">Answers</a>
                                        </li>
                                        <li><a href="/register">Add New Users</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /sidebar menu -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    Admin Options
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="<c:url value='/logout' />"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>
                                User List
                            </h3>
                        </div>

                    </div>
                    <div class="clearfix"></div>



                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">
                                    <p class="text-muted font-13 m-b-30">
                                        The following table provides a list of student users using the system. You may add more users from the option given at the bottom of the page. You may edit information of current students by clicking the edit button shown in correspondence to the user you want to edit. Likewise for deleting a user.
                                    </p>
                                    <table id="datatable-buttons" class="table table-striped table-bordered">
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
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
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
                                                <c:out value="Suspended" />
                                            </c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td><a href="<c:url value='/edit-user-${user.userId}' />" class="glyphicon glyphicon-edit">Edit</a></td>
                                        <td><a href="<c:url value='/delete-user-${user.userId}' />" class="glyphicon glyphicon-trash">Delete</a></td>
                                        <td><a href="<c:url value='/answers-${user.userId}' />" class="glyphicon glyphicon-education">Result</a></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <%@include file="footer.jsp" %>

            <script src="assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
            <script src="assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
            <script src="assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
            <script src="assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
            <script src="assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
            <script src="assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
            <script src="assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
            <script src="assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
            <script src="assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
            <script src="assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
            <script src="assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
            <script src="assets/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
            <script src="assets/vendors/jszip/dist/jszip.min.js"></script>
            <script src="assets/vendors/pdfmake/build/pdfmake.min.js"></script>
            <script src="assets/vendors/pdfmake/build/vfs_fonts.js"></script>
            
            <!-- Datatables -->
    <script>
      $(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        

        $('#datatable').dataTable();
        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
    <tag:paginate max="10" offset="${offset}" count="${count}" 
                      uri="/ptetest/list" next="&raquo;" previous="&laquo;" />
  </body>
</html>