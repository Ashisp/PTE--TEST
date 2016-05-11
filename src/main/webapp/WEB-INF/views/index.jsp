<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <title>Express Education Solutions</title>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
        <style type="text/css">
            #logo {
                height: 350px;
                width: 360px;
                margin-left: auto;
                margin-right: auto;
            }

            html, body {
                width: 100%;
                height: 100%;
                font-family: Calibri;
            }

            .clear {
                clear: both;
            }

            #container {
                position: fixed;
                top: 50%;
                left: 50%;
                margin-top: -300px;
                margin-left: -170px;
                background-color: white;                
            }

            #login {
                margin-top: 30px;
                margin-left: 90px;
                padding: 10px;
                float: left;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }
            
            #register {
                margin-top: 30px;
                margin-right: 90px;
                padding: 10px;
                float: right;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }
            
            #normal_text {
                font-size:25px;
                margin-top: 90px;
            }

            p {
                text-align: center;
            }

            p a {
                text-decoration: none;
                font-size: 18px;
                color: black;
                font-weight: normal;
            }

            p a:hover {
                color: blue;
            }

            
        </style>

        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="assets/images/favicon.png">
    </head>

    <body>

        <div id = "container">
            <div id = "logo">
                <img src="static/lrg.jpg" height="360" width="350" alt="Logo">
            </div>
            <div id = "normal_text">
                <p>PTE Practice Hub</p>
            </div>
            <div id = "login">
                <p><b><a href="<c:url value="/login"/>">Log In</a></b></p>
            </div>
            <div id = "register">
                <p><b><a href="<c:url value="/register"/>">Sign Up</a></b></p>
            </div>
        </div>
    </body>
</html>