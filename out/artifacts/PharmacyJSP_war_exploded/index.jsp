
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    //ArrayList<String> x = (ArrayList<String>) request.getAttribute("adrs");
    String y = (String) request.getAttribute("errorMessage");
    if( y == null)
        y = "Please fill out all fields";
    String active = (String) request.getAttribute("active");
    if(active == null)
        active = "";
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
                <li><a href="#">Home</a></li>
                <li><a href="#">Contact</a></li>
            </ul>

            <!-- Dropwdown login/register right side -->
            <ul class="nav navbar-nav navbar-right">

                <li class="dropdown<%out.print(active);%>" >
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Register<span class="caret"></span></a>
                    <ul class="dropdown-menu" >
                        <p><h5 style="color :#d43f3a ; text-align:center;"><%out.print(y);%></h5></p>
                        <form action="IndexServlet" method="POST">
                            <input type="text" name="emailRegister" placeholder="Type your email">
                            <input type="password" name="passwordRegister" placeholder="Type your password">
                            <input type="password" name="confirmPasswordRegister" placeholder="Confirm password">
                            <button name="registerButton" type="submit" style ="width: 100%;">Register </button>
                        </form>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <form action="IndexServlet" method="POST">
                            <input type="text" name="emailLogin" placeholder="Type your username">
                            <input type="password" name="passwordLogin" placeholder="Type your password">
                            <button name="loginButton"type="submit" style ="width: 100%;">Log In </button>
                        </form>
                    </ul>
                </li>

            </ul>
        </div>

    </div>
</nav>

</body>
</html>

