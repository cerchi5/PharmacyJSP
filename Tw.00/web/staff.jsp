<%--
  Created by IntelliJ IDEA.
  User: cerch
  Date: 18-Nov-17
  Time: 2:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Pharmacy</title>
</head>
<body>
<!-- <%
        String user = (String) request.getAttribute("currentUser");
    %> -->
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
                    <form action="HomeServlet" method="post" class="navbar-form navbar-left">
                        <input type="text" class="form-control" placeholder="Search">
                        <button class="btn btn-default" type="submit" name="searchDrugs">Search</button>
                        <button class="btn btn-info" type="submit" name="verifyCode">Verify Code</button>
                        <button class="btn btn-success" type="submit" name="order">Order drugs</button>
                    </form>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Hello,<%out.print(user);%></a></li>
            </ul>


        </div>
    </div>
</nav>

<!--
        content pe home, adica dupa log in
    -->

<br><br><br><br><br>
<p>MUIE MA ASDASJKFBASFA</p>

</body>
</html>

