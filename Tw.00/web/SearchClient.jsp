<%@ page import="java.util.*" %>
<%@ page import="com.classes.Drug" %>
<%@ page import="com.classes.CurrentUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheet.css"> -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function increment(name){
            var nameVar = name + 'quantity';
            var x = document.getElementById(nameVar);
            var numberX = x.innerHTML;
            if(numberX != 10) {
                numberX++;
            }
            x.innerHTML = numberX;
        }
        function decrement(name){
            var nameVar = name + 'quantity';
            var x = document.getElementById(nameVar);
            var numberX = x.innerHTML;
            if(numberX != 0) {
                numberX--;
            }
            x.innerHTML = numberX;
        }
    </script>
    <title>Pharmacy</title>
</head>
<body>
<%
    String user = CurrentUser.username;
    ArrayList<Drug> drugs = (ArrayList<com.classes.Drug>) request.getAttribute("resultList");
    session.setAttribute("resultList",drugs);
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
            <a href="/Home.jsp" class="navbar-brand">PHARMACY</a>
        </div>

        <!-- Menu Items -->
        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="nav navbar-nav">
                <li>
                    <form action="NavBarServlet" method="post" class="navbar-form navbar-left">
                        <input type="text" class="form-control" placeholder="Search" name="searchField">
                        <button class="btn btn-default" type="submit" name="searchDrugs">Search</button>
                        <button class="btn btn-info" type="submit" name="verifyCode">Verify Code</button>
                        <button class="btn btn-success" type="button" name="contact" onClick="javascript: document.location.href='#Contact'">Contact</button>
                    </form>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form method="post" action="NavBarServlet">
                        <button type="submit" name="cartButton">Cart</button>
                    </form>
                </li>  <!-- AICI CU IMG SI POZA CART SI DROPDOWN CU ITEMS -->
                <li><a href="#">Hello,<%out.print(user);%></a></li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br><br><br>
//verify code !!! !!! // new db // generate + verify code

//staffPage !!!!!!!!!!!!!!
<%
    if(drugs != null){
        out.print("<table>");
        out.print("<tr>");
        out.print("<th>ID</th>");
        out.print("<th>Name</th>");
        out.print("<th>Recommended Dose</th>");
        out.print("<th>Category</th>");
        out.print("<th>Specification</th>");
        out.print("<th>Price</th>");
        out.print("<th>Stock</th>");
        out.print("</tr>");

        for(Drug x : drugs){
            out.print("<tr>");
            out.print("<td>" + x.getId() + "</td>");
            out.print("<td>" + x.getName() + "</td>");
            out.print("<td>" + x.getRecommendedDose() + "</td>");
            out.print("<td>" + x.getCategory() + "</td>");
            out.print("<td>" + x.getSpecs() + "</td>");
            out.print("<td>" + x.getPrice() + " RON </td>");

            out.print("<td>");
            //out.print("<button type=\"button\" onClick=\"decrement('" + x.getName() + "')\">-</button>");
            out.print("<input name=\"" + x.getName() + "quantity\" id=\"" + x.getName() + "quantity\" type=\"number\" min=\"0\" max=\"10\" value=\"0\"/>");
            //out.print("<button type=\"button\" onClick=\"increment('" + x.getName() + "')\">+</button>");
            out.print("</td>");
            // nu merge

            out.print("</tr>");
        }
        out.print("</table>");
    }else{
        out.print("<p>NU ESTE!!!</p>");
    }

%>

<form action="/SearchClientServlet" method="POST">
    <button type="submit" name="addButton">Add to cart</button>
</form>


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
