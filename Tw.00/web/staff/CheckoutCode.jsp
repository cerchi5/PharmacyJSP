<%@ page import="com.classes.CurrentUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Pharmacy</title>
</head>
<body>

    <%  String user = CurrentUser.username;
        String error = "";
        if(request.getAttribute("errorCode") != null) {
            error = request.getAttribute("errorCode").toString();
            request.setAttribute("errorCode",null);
        }
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
                <a href="#" class="navbar-brand">CC PHARMACY</a>
            </div>

            <!-- Menu Items -->
            <div class="collapse navbar-collapse" id="mainNavbar">
                <form action="NavBarServlet" method="post" class="navbar-form navbar-left">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="searchFieldStaff">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit" name="searchDrugsStaff">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit" name="verifyCodeStaff">Verify Code</button>
                    <button class="btn btn-primary" type="submit" name="orderDrugs">Order Drugs</button>
                    <button class="btn btn-primary" type="submit" name="discountButton">Discounts</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Hello,<%out.print(user);%></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <br><br><br>

    <h3 class="text-center"><% out.print(error); %></h3>
    <br><br><br>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>Verify code</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-offset-3 col-md-6 col-md-offset-3">
                    <form method="post" action="VerifyCodeServlet">
                        <input class="form-control" type="text" name="textVerifyCodeStaff">
                        <button class="btn btn-primary" type="submit" name="submitCodeStaff">Search</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <p> input code + submit, redirect on a page with products</p>

    <footer id="Contact">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <ul class="adress">
                        <span>Adress</span>
                        <li>
                            <p>Str. Ion Rusu Sirianu Nr. 2</p>
                        </li>
                        <li>
                            <p>Oficiu postal: 400234</p>
                        </li>
                        <li>
                            <p>Timisoara, Romania</p>
                        </li>
                    </ul>
                </div>

                <div class="col-sm-4 col-xs-12">
                    <ul class="contact" id="About">
                        <span>Contact</span>
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#About">About</a>
                        </li>
                        <li>
                            <a href="#About">Email: ccpharmacy@pharmacy.com</a>
                        </li>
                        <li>
                            <a href="#About">Phone: 0721384923</a>
                        </li>
                    </ul>
                </div>

                <div class="col-sm-4 col-xs-12">
                    <ul class="adress">
                        <span>About us</span>
                        <li>
                            <p>CC Pharmacy is a British pharmacy company, with more than 1,500 pharmacies. It has around 17,000 staff and dispenses over 150 million prescription items annually.</p>
                        </li>
                    </ul>
                </div>
                <div class="footer-bottom-layout">
                    <div>Copyright © 2017 CC Pharmacy. All Rights Reserved.</div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
