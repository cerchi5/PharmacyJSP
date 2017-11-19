<%--
  Created by IntelliJ IDEA.
  User: cerch
  Date: 14-Nov-17
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheet.css"> -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Pharmacy</title>
</head>
<body>
    <%
        String user = (String) request.getAttribute("currentUser");
    %>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">

            <!-- Logo -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">PHARMACY</a>
            </div>

            <!-- Menu Items -->
            <div class="collapse navbar-collapse" id="mainNavbar">
                <ul class="nav navbar-nav">
                    <li>
                        <form action="HomeServlet" method="post">
                            <button type="submit" name="searchDrugs">Search Drugs</button>
                            <button type="submit" name="verifyCode">Verify a Code</button>
                            <button type="submit" name="contact">Contact</button>
                        </form>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><h4>Hello,<%out.print(user);%></h4></li>
                </ul>

            </div>
        </div>
    </nav>

    <!--
            content pe home, adica dupa log in
        -->

</body>
</html>
