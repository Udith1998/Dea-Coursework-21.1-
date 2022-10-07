
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.time.*"%>
<%@page import = "java.text.*"%> 

<!DOCTYPE html>
<html lang="zxx">
<head>
</head>
<body>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.time.*"%>
<%@page import = "java.text.*"%> 

<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
    <title>Flight Reservation - PHOENIX AIRLINES </title>
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- animate css -->
    
 <link rel="stylesheet" href="assets/css/animate.min.css" />
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
     </li>
                            <li>
                                <div class="dropdown language-option">
    <!-- owl.carousel css -->
     <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <!-- Rangeslider css -->
     <link rel="stylesheet" href="assets/css/nouislider.css" />
    <!-- owl.theme.default css -->
     <link rel="stylesheet" href="assets/css/owl.theme.default.min.css" />
    <!-- navber css -->
       <link rel="stylesheet" href="assets/css/navber.css" />
    <!-- meanmenu css -->
 <link rel="stylesheet" href="assets/css/meanmenu.css" />
    <!-- Style css -->
 <link rel="stylesheet" href="assets/css/style.css" />
    <!-- Responsive css -->
     <link rel="stylesheet" href="assets/css/responsive.css" />
    <!-- Favicon -->
<link rel="icon" type="image/png" href="assets/img/favicon.png">
    </head>
    <body>
    
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
    %>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Header Area -->
    <header class="main_header_arae">
        <!-- Top Bar -->
         <div class="topbar-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                    </div>
 <%if (session.getAttribute("username") == null){%>
                    <div class="col-lg-6 col-md-6">
                        <ul class="topbar-others-options">
                            <li><a href="login.jsp">Login</a></li>
                            <li> <a href="signup.jsp">Sign up</a>
                                 </li>
                            <li>
                                <div class="dropdown language-option">
                                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <span class="lang-name"></span>
                                    </button>
                                     <div class="dropdown-menu language-dropdown-menu">
                                        <a class="dropdown-item" href="#">USD</a>
                                        <a class="dropdown-item" href="#">LKR</a>
                                                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                <%}
 else{%>
                    <div class="col-lg-6 col-md-6">
                        <ul class="topbar-others-options">
                            <li><span class="username-display"><%out.println("Hello "+session.getAttribute("username")+"!");%></span></li>
                            <li>
<div class="dropdown language-option">
                                    <button class="dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <span class="lang-name"></span>
                                    </button>
 <div class="dropdown-menu language-dropdown-menu">
                                        <a class="dropdown-item" href="#">USD</a>
                                        <a class="dropdown-item" href="#">LKR</a>
