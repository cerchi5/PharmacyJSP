<%@ page import="com.classes.CurrentUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheet.css"> -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css\stylesheet.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Pharmacy</title>
</head>
<body>
<!-- <%
        String user = CurrentUser.username;
    %> -->
<div id="Home"></div>
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
                <li>
                    <form action="NavBarServlet" method="post">
                        <button type="submit" name="cartButton">Cart</button>
                    </form>
                </li>  <!-- AICI CU IMG SI POZA CART SI DROPDOWN CU ITEMS -->
                <li><a href="#">Hello,<%out.print(user);%></a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Home content -->
<br><br><br>
<div class="container">
    <div class="row text-center">
        <div class="col-md-4">
            <img class="img-responsive" src="photos/home1.png">
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
            <h3 style="color: white">Top used drugs</h3>
        </div>
    </div>


    <!-- Page Features -->
    <br>
    <div class="row text-center">

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="photos/algocalmin.jpg" height="500" width="800" alt="">
                <div class="caption">
                    <h3>Algocalmin</h3>
                    <p>Algocalmin ameliorează durerea şi reduce temperatura corpului în caz de febră. </p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="photos/strepsils.jpg" height="500" width="800" alt="">
                <div class="caption">
                    <h3>Strepsils</h3>
                    <p>Strepsils Intensiv Miere Şi Lămâie ajută la calmarea durerii şi a inflamaţiei gâtului.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="photos/nurofen.jpg" alt="">
                <div class="caption">
                    <h3>Nurofen</h3>
                    <p>Actioneaza prin schimbarea raspunsului organismului la durere, inflamatie si febra.</p>
                    <p>
                        <a href="#" class="btn btn-primary">Buy Now!</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6 hero-feature">
            <div class="thumbnail">
                <img src="photos/imodium.jpg" height="500" width="800" alt="">
                <div class="caption">
                    <h3>Imodium</h3>
                    <p>Imodium este indicat in tratamentul simptomatic al diareei acute si cronice.</p>
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
