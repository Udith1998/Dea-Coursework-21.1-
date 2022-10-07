
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
     String FlightID = request.getParameter("FlightID");
                                String username = (String)session.getAttribute("username");
                                String fclass = (String)session.getAttribute("fclass");
                                String passengers = (String)session.getAttribute("passengers");
                                String departingDate = (String)session.getAttribute("departingDate");
                                String flightid = (String)session.getAttribute("FlightID");
     <li class="nav-item">
                                    <a href="flightBooking.jsp" class="nav-link">
                                        Flight Booking
                                    </a>
                                </li>
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
                               </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                <%}%>
                
                </div>
            </div>
        </div>
 <!-- Navigation bar -->
        <div class="navbar-area">
            <div class="main-responsive-nav">
                <div class="container">
                    <div class="main-responsive-menu">
                        <div class="logo">
                            <a href="index.jsp">
                                <img src="assets/img/logo.png" alt="logo">
                                                  </a>
                        </div>
                    </div>
                </div>
            </div>
 <div class="main-navbar">
                <div class="container">
                    <nav class="navbar navbar-expand-md navbar-light">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="assets/img/logo.png" alt="logo">
                        </a>
 <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                            <ul class="navbar-nav">
  <li class="nav-item">
                                    <a href="index.jsp" class="nav-link">
                                        Home
                                    </a>
                                </li>
  <li class="nav-item">
                                    <a href="customerDashboard.jsp" class="nav-link">
                                        Dashboard
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        FAQ
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        Contact Us
              </a>
                                </li>

                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
 <!-- Common Banner Area -->
    <section id="common_banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="common_bannner_text">
                        <h2>Flight Reservation</h2>
                        <ul>
<li><a href="index.jsp">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span><a href="flightBooking.jsp">Flight Booking</a></li>
                            <li><span><i class="fas fa-circle"></i></span>Flight Reservation</li>
                        </ul>
<li><a href="index.jsp">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span><a href="flightBooking.jsp">Flight Booking</a></li>
                            <li><span><i class="fas fa-circle"></i></span>Flight Reservation</li>
                        </ul>
   </div>
                </div>
            </div>
        </div>
    </section>
  <!-- Selected flight Area -->
    <section id="explore_area" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
 <div class="col-lg-9">
                        <div class="flight_search_result_wrapper" id="flight-search-items">
    
                            <% 
  int passengerCount = 0;
                                
                                if (session.getAttribute("passengers") != null) { 
                                    passengerCount = Integer.parseInt(passengers);
                                } else { 
                                    passengerCount = 0; 
                                }
