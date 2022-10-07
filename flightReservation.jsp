
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
     <div class="flight_search_destination">
                                                    <p><%=rs1.getString("ArrTime")%></p>
                                                    <h3><%=rs1.getString("ArrCity")%></h3>
                                                    <h6><%=rs3.getString("Name")%></h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                 PreparedStatement pst1 = con.prepareStatement("select * from Flight where FlightID = ?");
                                pst1.setString(1,FlightID);
                                ResultSet rs1 = pst1.executeQuery();
  while(rs1.next()){

                                PreparedStatement pst2 = con.prepareStatement("select Name from Airport where AirportID = ?");
                                pst2.setString(1,rs1.getString("DepAirport"));
                                ResultSet rs2 = pst2.executeQuery();
                                rs2.next();

                                PreparedStatement pst3 = con.prepareStatement("select Name from Airport where AirportID = ?");
                                pst3.setString(1,rs1.getString("ArrAirport"));
                                ResultSet rs3 = pst3.executeQuery();
                                rs3.next();
                            %>
 <div class="flight_search_items">
                                    <div class="multi_city_flight_lists">
                                        <div class="flight_multis_area_wrapper">
                                            <div class="flight_search_left">
                                                <div class="flight_search_destination">
                                                    <p><%=rs1.getString("DepTime")%></p>
                                                    <h3><%=rs1.getString("DepCity")%></h3>
                                                    <h6><%=rs2.getString("Name")%></h6>
                                                </div>
  </div>
                                            <div class="flight_search_middel">
                                                <div class="flight_right_arrow1">
                                                    <img src="assets/img/icon/right_arrow1.png" alt="icon">
                                                    <h6>Non-stop</h6>
                                                    <p><%out.println(rs1.getString("AirTime"));%></p>
                                                </div>
<div class="flight_search_right">
 <%
                                        if(fclass.equals("economy")){
                                            String cost = rs1.getString("AirFare");
                                    %>
                                            <p>Economy Class</p>
                                            <h2><%="$"+cost%></h2>
                                    <%  }

                                        else if(fclass.equals("business")){
                                            String cost = rs1.getString("Business");
                                    %>
                                            <p>Business Class</p>
                                            <h2><%="$"+cost%></h2>
                                    <%  }

                                        else if(fclass.equals("first")){
                                            String cost = rs1.getString("First");
                                    %>
                                            <p>First Class</p>
                                            <h2><%="$"+cost%></h2>
                                    <%  }
                                    %>
  <%
                                        if(passengerCount>1){
                                    %>    
                                            <p><%=passengerCount%> Passengers | <%=departingDate%></p>
                                            
                                    <%  } else{%>
                                    
                                            <p><%=passengerCount%> Passenger | <%=departingDate%></p>
                                            
                                    <%  }%>
                                           </div>
                                </div>
                            <%}%>
                
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
                     <center>
            <div class="booking_tour_form_submit">
                <a href="flightBooking.jsp" class="btn btn_theme btn_md">Change flight</a>
            </div>
        </center>
        
 </section>
                            
    <!-- Tour Booking Submission Areas -->
    <section id="tour_booking_submission">
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="tou_booking_form_Wrapper">
                            <div class="booking_tour_form">
                                <center>
                                    <h3 class="heading_theme">Flight Reservation Form</h3>
                                </center>
                                 <div class="tour_booking_form_box">
                                    <form action="flightReservation.jsp" method="post" id="tour_bookking_form_item" name="tour_bookking_form_item">
                                        <div class="row">
                                            
                                                <center><h4 style="margin-bottom: 40px">Passenger 1</h4></center>

                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <select class="form-control form-select bg_input" name="title" id="title" required="required">
                                                            <option value="" hidden>Title</option>
                                                            <option value="Mr">Mr</option>
                                                            <option value="Mrs">Mrs</option>
                                                            <option value="Miss">Miss</option>
                                                            <option value="Ms">Ms</option>
                                                        </select>
                                                    </div>
                                                </div>
 <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <input type="text" name="passport" id="passport" class="form-control bg_input" placeholder="Passport no.*" required="required"/>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control bg_input" name="name" id="name" placeholder="Full name as per passport*" required="required"/>
                                                    </div>
                                                </div>    
                                            
                                                <center><h4 style="margin-bottom: 40px">Contact details</h4></center>
                                            
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <input type="text" name="fname" id="fname" class="form-control bg_input" placeholder="Contact person*" required="required"/>
                                                </div> 
                                            </div>
                                            
                                            <div class="col-lg-6">
                                                   <div class="form-group">
                                                    <input type="text" class="form-control bg_input" name="lname" id="lname" placeholder="Contact person*" required="required"/>
                                                </div>
                                            </div>
                                            
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control bg_input" name="mobileNo" id="mobileNo" placeholder="Mobile mobileNo*" required="required"/>
                                                </div>   
                                            </div>
                                              <div class="col-lg-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control bg_input" name="email" id="email" placeholder="Email address*" required="required"/>
                                                </div> 
                                            </div>
                                        </div>
                                        <center>
                                            <div style="margin-bottom: 50px" class="booking_tour_form_submit">
                                                <input type="submit" class="btn btn_theme btn_md" value="Submit"/>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                <!-- Footer  -->
    <footer id="footer_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Need any help?</h5>
                    </div>
                    <div class="footer_first_area">
                        <div class="footer_inquery_area">
                            <h5>Call 24/7 for any help</h5>
                            <h3> <a href="tel:+00-123-456-789">+00 123 456 789</a></h3>
                        </div>
                        <div class="footer_inquery_area">
                            <h5>Mail to our support team</h5>
                            <h3> <a href="mailto:support@domain.com">support@domain.com</a></h3>
                        </div>
 <div class="footer_inquery_area">
                            <h5>Follow us on</h5>
                            <ul class="soical_icon_footer">
                                <li><a href="#!"><i class="fab fa-facebook"></i></a></li>
                                <li><a href="#!"><i class="fab fa-twitter-square"></i></a></li>
                                <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#!"><i class="fab fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
 <div class="col-lg-2 offset-lg-1 col-md-6 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Company</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="about.html">About Us</a></li>
                            <li><a href="testimonials.html">Testimonials</a></li>
                            <li><a href="faqs.html">Rewards</a></li>
                            <li><a href="terms-service.html">Work with Us</a></li>
                            <li><a href="tour-guides.html">Meet the Team </a></li>
                            <li><a href="news.html">Blog</a></li>
                        </ul>
                    </div>
                </div>
