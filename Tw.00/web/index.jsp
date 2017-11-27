
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheet.css"> -->
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
    //ArrayList<String> x = (ArrayList<String>) request.getAttribute("adrs");
    String y = (String) request.getAttribute("errorMessage");
    if( y == null)
        y = "Please fill out all fields";
    String active = (String) request.getAttribute("active");
    if(active == null)
        active = "";
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
            <a href="#" class="navbar-brand">CC PHARMACY</a>
        </div>

        <!-- Menu Items -->
        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="nav navbar-nav">
                <li><a href="#">Home</a></li>
                <li><a href="#Contact">Contact</a></li>
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

<!-- Home content -->
<br><br><br>
<div class="container">
    <div class="row text-center">
        <div class="col-md-4">
            <img class="img-responsive" src="home1.png">
        </div>
        <div class="col-md-8">
            <div class="jumbotron">
                <h1>About wellness</h1><br><br>
                <p>
                    Pharmacists are healthcare professionals with specialised education and training who perform various roles to ensure optimal health outcomes for their patients through the quality use of medicines.
                    Pharmacists provide direct patient care services that optimizes the use of medication and promotes health, wellness, and disease prevention.
                </p>
            </div>

        </div>

    </div>

    <br><br><br>
    <hr>
    <!-- Title -->
    <div class="row">
        <div class="col-lg-12">
            <h3 style="color: white;">Top used drugs</h3>
        </div>
    </div>


    <!-- Page Features -->
    <br>
    <div class="row text-center">

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="http://placehold.it/800x500" alt="">
                <div class="caption">
                    <h3>Feature Item</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="http://placehold.it/800x500" alt="">
                <div class="caption">
                    <h3>Feature Item</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="http://placehold.it/800x500" alt="">
                <div class="caption">
                    <h3>Feature Item</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="http://placehold.it/800x500" alt="">
                <div class="caption">
                    <h3>Feature Item</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
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