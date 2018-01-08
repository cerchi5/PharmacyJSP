<%@ page import="com.classes.CurrentUser" %>
<%@ page import="com.classes.Cart" %>
<%@ page import="com.classes.Drug" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/stylesheet.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Pharmacy</title>
</head>
<body>
<%
    String user = CurrentUser.username;
    int numberOfProducts = Cart.getNumberOfProducts();
    double total = Cart.getTotal();
    ArrayList<Drug> cart = Cart.getDrugs();

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
            <ul class="nav navbar-nav">
                <li><a href="#Contact" name="contact">Contact</a></li>
            </ul>

            <form action="NavBarServlet" method="post" class="navbar-form navbar-left">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="searchField">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" name="searchDrugs">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit" name="verifyCode">Verify Code</button>
            </form>

            <ul class="nav navbar-nav navbar-right">

                <!--  CART and DROPDOWN ITEMS -->

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" >
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span class="badge"><% out.print(numberOfProducts); %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-cart" role="menu">
                        <form action="NavBarServlet" method="post">


                            <%
                                for(Drug x : cart){
                            %>

                            <li>
                                <div class="item">
                                    <div class="item-left">
                                        <img src="http://lorempixel.com/50/50/" alt="" />
                                        <div class="item-info">
                                            <span><% out.print(x.getName()); %></span>
                                            <span><small class="form-text text-muted">Quantity: </small><% out.print(x.getQuantity());%>x</span>
                                            <span><small class="form-text text-muted">Price: </small><% out.print(x.getActualPrice()); %>$</span>
                                        </div>
                                    </div>
                                    <div class="item-right">
                                        <button type="button" class="close" data-dismiss="item" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                            </li>
                            <%
                                }
                            %>


                            <li class="divider"></li>
                            <li class="text-center">
                                <p><strong>Total</strong>: RON <% out.print(total); %></p>
                            </li>
                            <li class="text-center">
                                <button class="btn btn-primary btn-block" type="submit" name="cartButton">Cart</button>
                            </li>
                        </form>
                    </ul>
                </li>

                <li><a href="#">Hello,<%out.print(user);%></a></li>
            </ul>
        </div>
    </div>
</nav>

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
                    <div class="form-group">
                        <label>Verify code:</label>
                        <input class="form-control" type="text" name="textVerifyCode">
                    </div>
                    <button class="btn btn-primary" type="submit" name="submitCode">Search</button>
                </form>
            </div>
        </div>
    </div>

</div>

<br><br><br>
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
