<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <title>Login!</title>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <style type="text/css">
            #logo {
                height: 150px;
                width: 160px;
                margin-left: auto;
                margin-right: auto;
            }

            html, body {
                width: 100%;
                height: 100%;
            }

            .clear {
                clear: both;
            }

            #container {
                position: fixed;
                width: 340px;
                height: 280px;
                top: 50%;
                left: 50%;
                margin-top: -170px;
                margin-left: -170px;
                background-color: white;
            }

            #username {
                margin-top: 30px;
                background-color: #d3d3d3;
                padding: 10px;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }

            p {
                text-align: center;
            }

            p a {
                font-size: 15px;
                color: #CB0012;
                float: right;
                margin-top: -13px;
            }

            p a:hover {
                color: #555;
            }

            input {
                color: #777;
                padding-left: 10px;
                margin-left: 19px;
                width: 280px;
                height: 40px;
                border: none;
                font-size: 15px;
            }

            input[type=text] {
                border-radius: 10px 10px 0px 0px;
                width: 280px;
            }

            input[type=password] {
                margin-top: 2px;
                margin-bottom: 2px;
            }

            input[type=submit] {
                background-color: #A51E1E;
                color: white;
                width: 280px;
                margin: 4px 15px 0px 19px;
                margin-bottom: 15px;
                border-radius: 0px 0px 10px 10px;
            }

            input[type=submit]:hover {
                cursor: pointer;
                background-color: #9392B2;
                color: #FFF;
            }
        </style>

        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="assets/images/favicon.png">
    </head>

    <body>
        
        <div id = "container">
            <div id = "logo">
                <img src="assets/images/pte_logo.jpg" height="150" width="160" alt="Logo">
            </div>
            <div id = "username">
                <p><b>Log In!</b></p>
                <form action="dashboard" method="post">
                    <input type="text" name="username" placeholder="Username" required />
                    <input type="password" name="password" placeholder="Password" required />

                    <input type="submit" name="submit" value="Login" />
                </form>
                <span class="text-danger">${errorMessage}</span>
            </div>
        </div>
    </body>
</html>