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
    <title>Flights - PHOENIX AIRLINES </title>
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
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
    
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<body>
    <script>
        $(document).ready(function() {
            $('.js-example-basic-single').select2();
        });
    </script>
    
    <!-- Header Area -->
    <header class="main_header_arae">
        <!-- Top Bar -->
        <div class="topbar-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                    </div>
                    
                <%  if (session == null || session.getAttribute("username") == null){%>
                        <div class="col-lg-6 col-md-6">
                            <ul class="topbar-others-options">
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="signup.jsp">Sign up</a>
                                </li>
                            </ul>
                        </div>
                <%  }
                    else{%>
                        <div class="col-lg-6 col-md-6">
                            <ul class="topbar-others-options">
                                <li><span class="username-display"><%out.println("Hello "+session.getAttribute("username")+"!");%></span></li>
                                <li><a href="LogoutServlet">Logout</a></li>
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
                                <img src="assets/img/logo.png" alt=""/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-navbar">
                <div class="container">
                    <nav class="navbar navbar-expand-md navbar-light">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="assets/img/logo.png" alt=""/>
                        </a>
                        <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                            <ul class="navbar-nav">

                                <li class="nav-item">
                                    <a href="index.jsp" class="nav-link">
                                        Home
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="flightSearch.jsp" class="nav-link">
                                        Flights
                                    </a>
                                </li>
                                
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
                                    
                                    String username = (String)session.getAttribute("username");
                                    
                                    PreparedStatement client = con.prepareStatement("select * from Client where Username = ?");
                                    client.setString(1, username);
                                    ResultSet clientrs = client.executeQuery();
                                    boolean found = clientrs.next();

                                    PreparedStatement admin = con.prepareStatement("select * from admin where Username = ?");
                                    admin.setString(1, username);
                                    ResultSet adminrs = admin.executeQuery();
                                    boolean found1 = adminrs.next();

                                    PreparedStatement staff = con.prepareStatement("select * from staff where Username = ?");
                                    staff.setString(1, username);
                                    ResultSet staffrs = staff.executeQuery();
                                    boolean found2 = staffrs.next();

                                    if(found){%>           
                                        <li class="nav-item">
                                            <a href="customerDashboard.jsp" class="nav-link">Dashboard</a>
                                        </li> 
                                <%  }

                                    if(found1){%>           
                                        <li class="nav-item">
                                            <a href="adminDashboard.jsp" class="nav-link">Dashboard</a>
                                        </li> 
                                <%  }

                                    if(found2){ %>          
                                        <li class="nav-item">
                                            <a href="staffDashboard.jsp" class="nav-link">Dashboard</a>
                                        </li> 
                                <%  }   %>

                                <li class="nav-item">
                                    <a href="faq.jsp" class="nav-link">
                                        FAQ
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="contactUs.jsp" class="nav-link">
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
                        <h2>Flights</h2>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span> Flights </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Form Area -->
    <section id="theme_search_form_tour" class="fligth_top_search_main_form_wrapper">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="theme_search_form_area">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="flight_categories_search">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item" role="presentation">
                                                    <p class="nav-link active" id="oneway-tab"
                                                        data-bs-target="#oneway_flight">One Way</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="tab-content" id="myTabContent1">
                                    <div class="tab-pane fade show active" id="oneway_flight" role="tabpanel"
                                        aria-labelledby="oneway-tab">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="oneway_search_form">
                                                    
                                                <form action="flightSearch.jsp" method="post" id="flight-search-form" >
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                                <div class="flight_Search_boxed">
                                                                    <p>Departure City</p>
                                                                    <div class="select-city">
                                                                        <select class="select-city" id="depcity" name="depcity" required="required">
                                                                            <option value="" hidden>Select a city</option>
                                                                            <%
                                                                            PreparedStatement pst1 = con.prepareStatement("select distinct DepCity,Country from flight join airport on flight.DepAirport = airport.AirportID");
                                                                            ResultSet rs1 = pst1.executeQuery();

                                                                            while(rs1.next()){%>
                                                                                <option value="<%=rs1.getString("DepCity")%>">
                                                                                    <%out.println(rs1.getString("DepCity")+", "+rs1.getString("Country"));%>
                                                                                </option>
                                                                            <%}%>
                                                                        </select>
                                                                    </div>
                                                                    
                                                                    <% String depcity = request.getParameter("depcity"); %>
                                                                        
                                                                    <span></span>
                                                                    
                                                                    <div class="plan_icon_posation">
                                                                        <i class="fas fa-plane-departure"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="col-lg-3 col-md-6 col-sm-12 col-12">
                                                                <div class="flight_Search_boxed">
                                                                    <p>Arrival City</p>
                                                                    
                                                                    <div class="select-city">
                                                                        <select class="select-city" name="arrcity" id="arrcity" required="required">
                                                                            <option value="" hidden>Select a city</option>
                                                                            <%
                                                                            PreparedStatement pst2 = con.prepareStatement("select distinct ArrCity,Country from flight join airport on flight.ArrAirport = airport.AirportID");
                                                                            ResultSet rs2 = pst2.executeQuery();

                                                                            while(rs2.next()){%>
                                                                            <option value="<%=rs2.getString("ArrCity")%>"> 
                                                                                    <%out.println(rs2.getString("ArrCity")+", "+rs2.getString("Country"));%>
                                                                            </option>
                                                                            <%}%>
                                                                        </select>
                                                                    </div>
                                                                    
                                                                    <% String arrcity = request.getParameter("arrcity"); %>
                                                                        
                                                                    <span></span>
                                                                    
                                                                    <div class="plan_icon_posation">
                                                                        <i class="fas fa-plane-arrival"></i>
                                                                    </div>
                                                                    <div class="range_plan">
                                                                        <i class="fas fa-long-arrow-alt-right"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="col-lg-new  col-md-6 col-sm-12 col-12">
                                                                <div class="form_search_date">
                                                                    <div class="flight_Search_boxed date_flex_area">
                                                                        <div class="Journey_date">
                                                                            <p>Departing On</p>
                                                                            <input type="date" value="date" name="departingDate" id="departingDate" required="required">
                                                                            
                                                                            <span></span>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-new  col-md-6 col-sm-12 col-12">
                                                                <div class="form_search_date">
                                                                    <div class="flight_Search_boxed date_flex_area">
                                                                        <div class="Journey_date">
                                                                            <p>Passengers</p>
                                                                                <input type="number" id="passengers" name="passengers" min="1" max="1" placeholder="0" required="required"/>
                                                                            <span></span>
  
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                    
                                                            <div class="col-lg-new  col-md-6 col-sm-12 col-12">
                                                                <div class="form_search_date">
                                                                    <div class="flight_Search_boxed date_flex_area">
                                                                        <div class="Journey_date">
                                                                            <p>Class</p>
                                                                            <select class="select-city" name="fclass" id="fclass" required="required">
                                                                                <option value="" hidden>Select class</option>
                                                                                <option value="economy">Economy</option>
                                                                                <option value="business">Business</option>
                                                                                <option value="first">First</option>
                                                                            </select>
                                                                            
                                                                            <span></span>
                                                                            
                                                                        <%  
                                                                            String fclass = request.getParameter("fclass"); 
                                                                            String passengers = request.getParameter("passengers");
                                                                            String departingDate = request.getParameter("departingDate");
                                                                        
                                                                            session.setAttribute("fclass",fclass);
                                                                            session.setAttribute("passengers",passengers);
                                                                            session.setAttribute("departingDate",departingDate);
                                                                        %>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                            <div class="top_form_search_button">
                                                                <input type="submit" class="btn btn_theme btn_md" value="Search Flights" />
                                                            </div>
                                                        </div>
                                                    </form>                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <!-- Flight Search Areas -->
    <section id="explore_area" class="section_padding">
        <div class="container">
            <!-- Section Heading -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section_heading_center">
                        <h2>
                            <% 
                                if(depcity==null || depcity=="" && arrcity==null || arrcity==""){
                                    
                                    PreparedStatement pst3 = con.prepareStatement("select count(*) from Flight");
                                    ResultSet rs3 = pst3.executeQuery();

                                    String Countrow="";

                                    while(rs3.next()){
                                        Countrow = rs3.getString(1);
                                    }

                                    out.println(Countrow+" Flights Found");
                                    
                                }
                                
                                else{

                                    PreparedStatement pst4 = con.prepareStatement("select count(*) from Flight where DepCity = ? and ArrCity = ?");                                  
                                    pst4.setString(1, depcity);
                                    pst4.setString(2, arrcity);

                                    ResultSet rs4 = pst4.executeQuery();
                                    
                                    String Countrow="";

                                    while(rs4.next()){
                                        Countrow = rs4.getString(1);
                                    }

                                    out.println(Countrow+" Flights Found");
                                }
                            %>
                        </h2>
                    </div>
                </div>
            </div>              
        
                <div class="row">
                    <div class="row justify-content-center">
                        <div class="col-lg-9">
                            <div class="flight_search_result_wrapper" id="flight-search-items">
                            <!--flight search items-->
                            <%  
                                try{    
                                    if(depcity==null || depcity=="" && arrcity==null || arrcity==""){
                                        PreparedStatement pst5 = con.prepareStatement("Select * from Flight");
                                        ResultSet rs5 = pst5.executeQuery();

                                        while(rs5.next()){
                                %>
                                            <div class="flight_search_item_wrappper">
                                                <div class="flight_search_items">
                                                    <div class="multi_city_flight_lists">
                                                        <div class="flight_multis_area_wrapper">
                                                            <div class="flight_search_left">
                                                                
                                                                <%PreparedStatement pst6 = con.prepareStatement("Select * from Airport where AirportID = '"+rs5.getString("DepAirport")+"'");
                                                                ResultSet rs6 = pst6.executeQuery();
                                                                rs6.next();%>

                                                                <div class="flight_search_destination">
                                                                    <p><%=rs5.getString("DepTime")%></p>
                                                                    <h3><%=rs6.getString("City")%></h3>
                                                                    <h6><%=rs6.getString("Name")%></h6>
                                                                </div>
                                                            </div>
                                                            <div class="flight_search_middel">
                                                                <div class="flight_right_arrow1">
                                                                    <img src="assets/img/icon/right_arrow1.png" alt="icon">
                                                                    <h6>Non-stop</h6>
                                                                    <p><%=rs5.getString("AirTime")%></p>
                                                                </div>

                                                                <%PreparedStatement pst7 = con.prepareStatement("Select * from Airport where AirportID = '"+rs5.getString("ArrAirport")+"'");
                                                                ResultSet rs7 = pst7.executeQuery();
                                                                rs7.next();%>

                                                                <div class="flight_search_destination">
                                                                    <p><%=rs5.getString("ArrTime")%></p>
                                                                    <h3><%=rs7.getString("City")%></h3>
                                                                    <h6><%=rs7.getString("Name")%></h6>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="flight_search_right">
                                                        <p>Flights are available from</p>
                                                        <h2><%="$"+rs5.getString("AirFare")%></h2>       
                                                    </div>
                                                </div>
                                            </div>
                                        <%}
                                    }
                                    else{
                                        PreparedStatement pst5 = con.prepareStatement("select * from flight where DepCity = ? and ArrCity = ?");
                                        pst5.setString(1, depcity);
                                        pst5.setString(2, arrcity); 

                                        ResultSet rs5 = pst5.executeQuery();

                                        while(rs5.next()){%>
                                                <div class="flight_search_item_wrappper">
                                                <div class="flight_search_items">
                                                    <div class="multi_city_flight_lists">
                                                        <div class="flight_multis_area_wrapper">
                                                            <div class="flight_search_left">

                                                                <%PreparedStatement pst6 = con.prepareStatement("Select Name from Airport where City = '"+rs5.getString("DepCity")+"'");
                                                                ResultSet rs6 = pst6.executeQuery();
                                                                rs6.next();%>

                                                                <div class="flight_search_destination">
                                                                    <p><%=rs5.getString("DepTime")%></p>
                                                                    <h3><%=depcity%></h3>
                                                                    <h6><%=rs6.getString("Name")%></h6>
                                                                </div>
                                                            </div>

                                                            <div class="flight_search_middel">
                                                                <div class="flight_right_arrow1">
                                                                    <img src="assets/img/icon/right_arrow1.png" alt="icon">
                                                                    <h6>Non-stop</h6>
                                                                    <p><%=rs5.getString("AirTime")%></p>
                                                                </div>

                                                                <%PreparedStatement pst7 = con.prepareStatement("Select Name from Airport where City = '"+rs5.getString("ArrCity")+"'");
                                                                ResultSet rs7 = pst7.executeQuery();
                                                                rs7.next();%>

                                                                <div class="flight_search_destination">
                                                                    <p><%=rs5.getString("ArrTime")%></p>
                                                                    <h3><%=arrcity%></h3>
                                                                    <h6><%=rs7.getString("Name")%></h6>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%
                                                        if(fclass.equals("economy")){
                                                    %>
                                                            <div class="flight_search_right">
                                                                <p>Economy class</p>
                                                                <h2><%="$"+rs5.getString("AirFare")%></h2>
                                                                
                                                                <form action="flightReservation.jsp" method="post">
                                                                    <button class="btn btn_theme btn_sm" name="FlightID" id="FlightID" type="submit" value="<%=rs5.getString("FlightID")%>" > Book now </button>
                                                                </form>
                                                            </div>
                                                    <%
                                                        }

                                                        else if(fclass.equals("business")){
                                                    %>
                                                            <div class="flight_search_right">
                                                                <p>Business class</p>
                                                                <h2><%="$"+rs5.getString("Business")%></h2>
                                                                
                                                                <form action="flightReservation.jsp" method="post">
                                                                    <button class="btn btn_theme btn_sm" name="FlightID" id="FlightID" type="submit" value="<%=rs5.getString("FlightID")%>" > Book now </button>
                                                                </form>
                                                            </div>
                                                    <%  }
                                                        else if(fclass.equals("first")){
                                                    %>
                                                            <div class="flight_search_right">
                                                                <p>First class</p>
                                                                <h2><%="$"+rs5.getString("First")%></h2>
                                                                
                                                                <form action="flightReservation.jsp" method="post">
                                                                    <button class="btn btn_theme btn_sm" name="FlightID" id="FlightID" type="submit" value="<%=rs5.getString("FlightID")%>" > Book now </button>
                                                                </form>
                                                            </div>
                                                    <%  }   %>
                                                    
                                                </div>
                                                </div>
                                    <%  }        
                                    }
                                }catch(Exception e){ 
                                    out.println(e);
                                }%>        
                            </div>
                        </div>
                    </div>
                </div>
    </section>

    <!-- Footer  -->
    <footer id="footer_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12 col-sm-12 col-18">
                    <div class="footer_heading_area">
                        <h5>Need any help?</h5>
                    </div>
                    <div class="footer_first_area">
                        <div class="footer_inquery_area">
                            <h5>Call 24/7 for any help</h5>
                            <h3> <a href="tel:+00-123-456-789">+94 112 345 345</a></h3>
                        </div>
                        <div class="footer_inquery_area">
                            <h5>Mail to our support team</h5>
                            <h3> <a href="mailto:support@domain.com">support@phoenix.com</a></h3>
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
                
                <div class="col-lg-2 col-md-4 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Top Sites</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="flightSearch.jsp">Flight Booking</a></li>
                            <li><a href="">Dashboard</a></li>
                            <li><a href="faq.jsp">FAQ</a></li>
                            <li><a href="contactUs.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
         
                <div class="col-lg-2 col-md-4 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Top Destinations</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="flightSearch.jsp">London</a></li>
                            <li><a href="flightSearch.jsp">Sydney</a></li>
                            <li><a href="flightSearch.jsp">France</a></li>
                            <li><a href="flightSearch.jsp">Maldives</a></li>
                            <li><a href="flightSearch.jsp">New York</a></li>
                            <li><a href="flightSearch.jsp">India</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <div class="copyright_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="co-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="copyright_left">
                        <p>Copyright © 2022 All Rights Reserved</p>
                    </div>
                </div>
                <div class="co-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="copyright_right">
                        <img src="assets/img/common/cards.png" alt="img">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="go-top">
        <i class="fas fa-chevron-up"></i>
        <i class="fas fa-chevron-up"></i>
    </div>

    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap js -->
    <script src="assets/js/bootstrap.bundle.js"></script>
    <!-- Meanu js -->
    <script src="assets/js/jquery.meanmenu.js"></script>
    <!-- Range js -->
    <script src="assets/js/nouislider.min.js"></script>
    <script src="assets/js/wNumb.js"></script>
    <!-- owl carousel js -->
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- wow.js -->
    <script src="assets/js/wow.min.js"></script>
    <!-- Custom js -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/add-form.js"></script>
    <script src="assets/js/form-dropdown.js"></script>

</body>

</html>
