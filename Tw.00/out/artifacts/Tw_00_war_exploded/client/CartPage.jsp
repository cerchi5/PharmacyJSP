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
                <li>
                    <form action="NavBarServlet" method="post" class="navbar-form navbar-left">
                        <input type="text" class="form-control" placeholder="Search" name="searchField">
                        <button class="btn btn-default" type="submit" name="searchDrugs">Search</button>
                        <button class="btn btn-primary" type="submit" name="verifyCode">Verify Code</button>
                        <button class="btn btn-success" type="button" name="contact" onClick="javascript: document.location.href='#Contact'">Contact</button>
                    </form>
                </li>
            </ul>
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
<br><br>
<!-- Shoppong cart CONTENT -->

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel-body">
                <%
                    for(Drug x : cart){
                %>
                    <div class="row">
                        <div class="col-xs-2"><img class="img-responsive" src="http://lorempixel.com/100/70/">
                        </div>
                        <div class="col-xs-4">
                            <h4 class="product-name"><strong><%out.print(x.getName());%></strong></h4><h4><small><%out.print(x.getSpecs());%></small></h4>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-xs-6 text-right">
                                <h5><strong>RON <%out.print(x.getActualPrice());%> <span class="text-muted">X</span></strong></h5>
                            </div>
                            <div class="col-xs-4">
                                <input type="text" class="form-control input-sm" value="<%out.print(x.getQuantity());%>"></span>
                            </div>
                            <div class="col-xs-2">
                                <form action="/CartPageServlet" method="post">
                                    <button type="submit" class="btn btn-link btn-xs" name="<% out.print(x.getName());%>button">
                                        <span class="glyphicon glyphicon-trash"> </span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <%
                        }
                    %>

                    <div class="row">
                        <div class="text-center">
                            <div class="col-xs-9">
                                <h6 class="text-right"><strong>Shipping</strong></h6>
                            </div>
                            <div class="col-xs-3">
                                <h6>$0.00</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row text-center">
                        <div class="col-xs-9">
                            <h4 class="text-right">Total <strong>$<% out.print(total);%></strong></h4>
                        </div>
                        <div class="col-xs-3">
                            <form action="/CartPageServlet" method="post">
                                <button type="submit" class="btn btn-primary btn-block" name="checkoutButton">
                                    Checkout
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<br><br><br>
<footer id="Contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
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

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <ul class="contact" id="About">
                    <span>Contact</span>
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#About">About</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
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
