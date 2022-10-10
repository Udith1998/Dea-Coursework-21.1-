<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Home - PHOENIX AIRLINES </title>
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
    <!-- popup css -->
    <link rel="stylesheet" href="assets/css/popup.css" />
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
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

    <!-- Banner Area -->
    <section id="home_two_banner">
        <div class="home_two_banner_slider_wrapper owl-carousel owl-theme">
            <div class="banner_two_slider_item fadeInUp" data-wow-duration="2s"
                style="background-image: url(./assets/img/banner/banner-two-bg-1.jpg);">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="banner_two_text">
                                <h3 class="title">BEST TRAVEL AGENCY</h3>
                                <h1 class="slider-sttle">EXPLORE</h1>
                                <h2 class="slider-pararp">The world with us!</h2>
                                <h4 class="slider-pararp">Find awesome flights,tour and packages</h4>
                                <div class="home_two_button btn-animation">
                                    <a href="#about_two_area" class="btn btn_theme_white btn_md">Know More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner_two_slider_item fadeInUp" data-wow-duration="2s"
                style="background-image: url(./assets/img/banner/banner-two-bg-2.jpg);">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="banner_two_text">
                                <h3 class="title">BEST TRAVEL AGENCY</h3>
                                <h1 class="slider-sttle">SAFEST</h1>
                                <h2 class="slider-pararp">Every takeoff is optional. Every landing is mandatory.</h2>
                                <h4 class="slider-pararp">Flying the airplane is more important than radioing your plight to a person on the ground incapable of understanding it.</h4>
                                <div class="home_two_button btn-animation">
                                    <a href="#about_two_area" class="btn btn_theme_white btn_md">Know more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner_two_slider_item fadeInUp" data-wow-duration="2s"
                style="background-image: url(./assets/img/banner/banner-two-bg-3.jpg);">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="banner_two_text">
                                <h3 class="title">BEST TRAVEL AGENCY</h3>
                                <h1 class="slider-sttle">CHEAP</h1>
                                <h2 class="slider-pararp">Flight by Destination</h2>
                                <h4 class="slider-pararp">No hidden fees. No hidden charges. No funny business. With us, you’ll always know exactly where your money goes</h4>
                                <div class="home_two_button btn-animation">
                                    <a href="#about_two_area" class="btn btn_theme_white btn_md">Know more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Top Service And Tour Area-->
    <section id="top_service_andtour" class="section_padding_top">
        <div class="container">
            <!-- Section Heading -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section_heading_center">
                        <h2>OUR TOP SERVICES</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="top_service_boxed">
                        <img src="assets/img/icon/service-2.png" alt="icon">
                        <h3>Flight Booking</h3>
                        <p>
                            See where you can go right now and find the cheapest on thousands of flights and destinations. Airline reservation system is web-based system that helps in consolidating flight data - flight schedules, seat availability, flight fares and reservations from all airlines with the help of global distribution systems and provides real-time inventory and rates for customers and travel agents to book flight tickets online.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="top_service_boxed">
                        <img src="assets/img/icon/service-3.png" alt="icon">
                        <h3>Ticket Booking</h3>
                        <p>
                            We are here to give you with the finest available offers if you want to book your aircraft tickets with no convenience charge and transparency in air ticket pricing.
                            With us, you can get the finest flight ticket booking deals for all major low-cost carriers in Sri Lanka and overseas. We also provide last-minute savings on plane ticket purchases. So, plan a trip to your favorite spots with the best airfare deals.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="top_service_boxed">
                        <img src="assets/img/icon/service-6.png" alt="icon">
                        <h3>Affordable Flights</h3>
                        <p>
                            Phoenix Airlines is a reputable travel service in Sri Lanka that provides excellent airfare prices. We offer the most affordable flights to all destinations in Sri Lanka and throughout the world. We strive to make your holiday memorable as one of Sri Lanka's leading travel portals.  We believe in providing amazing vacations for our clients by offering bespoke holiday packages and trips. 
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Holiday Destinations  Area-->
    <section id="holiday_destinations" class="section_padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="holiday_left_heading">
                                <div class="heading_left_area">
                                    <h2>Explore most popular holiday <span>destinations</span></h2>
                                    <h5>Discover your ideal experience with us</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="holiday_small_boxed">
                                <a href="top-destinations-details.html">
                                    <img src="assets/img/holiday-img/holiday-1.jpg" alt="img">
                                    <div class="holiday_small_box_content">
                                        <div class="holiday_inner_content">
                                            <h3>London</h3>
                                            <p>The London Eye is a cantilevered observation wheel on the South Bank of the River Thames in London.</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="holiday_small_boxed">
                                <a href="top-destinations-details.html">
                                    <img src="assets/img/holiday-img/holiday-2.jpg" alt="img">
                                    <div class="holiday_small_box_content">
                                        <div class="holiday_inner_content">
                                            <h3>Greece</h3>
                                           
                                            <p>Athens, Modern Greek Athínai, Ancient Greek Athēnai, historic city and capital of Greece.</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="holiday_small_boxed">
                                <a href="top-destinations-details.html">
                                    <img src="assets/img/holiday-img/holiday-3.jpg" alt="img">
                                    <div class="holiday_small_box_content">
                                        <div class="holiday_inner_content">
                                            <h3>France</h3>
                                           
                                            <p>Notre-Dame cathedral, and the Eiffel tower. It has a reputation of being a romantic and cultural city.</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="holiday_small_boxed">
                                <a href="top-destinations-details.html">
                                    <img src="assets/img/holiday-img/holiday-4.jpg" alt="img">
                                    <div class="holiday_small_box_content">
                                        <div class="holiday_inner_content">
                                            <h3>Sri Lanka</h3>
                                            
                                            <p> Sigiriya,ancient stronghold that was built in the late 5th century ce on a remarkable monolithic rock pillar.</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                    <div class="holiday_small_boxed">
                                        <a href="top-destinations-details.html">
                                            <img src="assets/img/holiday-img/holiday-5.jpg" alt="img">
                                            <div class="holiday_small_box_content">
                                                <div class="holiday_inner_content">
                                                    <h3>Maldives</h3>
                                                    
                                                    <p>The tropical paradise for reasons such as its beauty. This tropical country has separated islands.</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                    <div class="holiday_small_boxed">
                                        <a href="top-destinations-details.html">
                                            <img src="assets/img/holiday-img/holiday-6.jpg" alt="img">
                                            <div class="holiday_small_box_content">
                                                <div class="holiday_inner_content">
                                                    <h3>Egypt</h3>
                                                    
                                                    <p>Though Khufu reigned for 23 years (2589-2566 B.C.), relatively little is known of his reign beyond the grandeur of his pyramid.</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Area -->
    <section id="about_two_area" class="section_padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-sm-12 col-12">
                    <div class="about_two_left">
                        <div class="about_two_left_top">
                            <h5>ABOUT US </h5>
                            <h2>Discover your all the destinations with us!</h2>
                            <p>
                               Our latest travel tips, expert hacks and industry insights to help make your journey one to remember.
                               Fly to your favorite destination on the lowest fares.
                                With so many sites to visit and explore, planning an overseas trip is never easy! Thanks to our revolutionary method, we can assist you in locating the greatest airlines. We can guarantee lower air tickets with solid connections to our customers, as well as spectacular deals to any location.
                            </p>
                        </div>
                        <div class="about_two_left_middel">
                            <div class="about_two_item">
                                <div class="about_two_item_icon">
                                    <img src="assets/img/icon/about-1.png" alt="icon">
                                </div>
                                <div class="about_two_item_text">
                                    <h3>Experienced Cabin Crew</h3>
                                    <p>When you put on the cabin crew uniform, you become a brand representative. You're on the job to keep consumers safe while also making them feel unique. The team player who works well with others, and the determined professional who never lowers their standards, even at the end of a hard shift.</p>
                                </div>
                            </div>
                            <div class="about_two_item">
                                <div class="about_two_item_icon">
                                    <img src="assets/img/icon/about-1.png" alt="icon">
                                </div>
                                <div class="about_two_item_text">
                                    <h3>Best Customer Service</h3>
                                    <p>Phoenix Airline customer service representatives are an airline's public face. On a daily basis, they contact with passengers, answering inquiries and addressing issues connected to bookings, ticketing, boarding cards, baggage claims, and so on. Airline customer service agents may also be in charge of communicating with vendors or suppliers to ensure that their airline has access to the best equipment and services possible.</p>
                                </div>
                            </div>
                            <div class="about_two_item">
                                <div class="about_two_item_icon">
                                    <img src="assets/img/icon/about-1.png" alt="icon">
                                </div>
                                <div class="about_two_item_text">
                                    <h3>Explore top places over the world</h3>
                                    <p>To find the right air ticket for your trip, just enter the location you’re flying from and your flight destination. Enter your dates, class of travel and the number of passengers. Select ’Search flights’ to continue with the online flight booking process and book a flight ticket that suits your travel plans.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-12 col-sm-12 col-12">
                    <div class="about_two_left_img">
                        <img src="assets/img/common/about_two.jpg" alt="img">
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- Choose your destinations Area-->
    <section id="choose_destinations_area" class="section_padding_top">
        <div class="container">
            <!-- Section Heading -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section_heading_center">
                        <h2>Choose your destinations</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-1.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>SYDNEY</h2>
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">

                                    <h2>SYDNEY |</h2>
                                    
                                    <p>The Opera House is Sydney's best-known landmark. It is a multipurpose performing arts facility whose largest venue, the 2,679-seat Concert Hall.</p>
                                    <a href="flightBooking.jsp">Check flights</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-2.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>NEW YORK</h2>
                                    
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">
                                    <div class="rating_outof">
                                    </div>
                                    <h2>NEW YORK |</h2>
                                    
                                    <p>The Statue of Liberty's torch lights the way to freedom showing us the path to Liberty. "Liberty Enlightening the World.</p>
                                    <a href="flightBooking.jsp">Check flights</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-3.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>ORTAKOY MOSQUE</h2>
                                    
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">
                                    <h2>ORTAKOY MOSQUE |</h2>
                                    
                                    <p>Ortaköy Mosque in Istanbul with the Bosphorus Bridge on Background</p>
                                    <a href="flightBooking.jsp">Check flights</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-4.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>RIO DE JANEIRO</h2>
                                    
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">
                                    
                                    <h2>RIO DE JANEIRO |</h2>
                                   
                                    <p>Christ the Redeemer is the largest art deco statue in the world. It is 98 feet tall (not including the 26 foot pedestal), and the arms stretch to 92 feet wide.</p>
                                    <a href="flightBooking.jsp">Check flights</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-5.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>TAJ MAHAL</h2>  
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">
                                    <div class="rating_outof">
                                    </div>
                                    <h2>TAJ MAHAL |</h2>
                                    
                                    <p>The Taj Mahal is a perfect symmetrical planned building, with an emphasis of bilateral symmetry along a central axis on which the main features are placed.</p>
                                    <a href="flightBooking.jsp">Check flights</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="choose_desti_wrapper">
                        <div class="choose_des_inner_wrap">
                            <div class="choose_boxed_inner">
                                <img src="assets/img/destination/home-two-des-6.jpg" alt="img">
                                <div class="choose_img_text">
                                    <h2>MACHU PICHU</h2>
                                    
                                </div>
                            </div>
                            <div class="flep_choose_box">
                                <div class="flep_choose_box_inner">
                                    <h2>MACHU PICCHU | </h2>
                                    
                                    <p>Machu Picchu , Ancient fortress city of the Incas in the Andes Mountains, south-central Peru. Perched near Cuzco in a narrow saddle between two sharp peaks, at an elevation of 7,710 ft (2,350 m), it escaped detection by the Spaniards, and its existence was made known only in 1911 by U.S. explorer Hiram Bingham.</p>
                                    <a href="flightBooking.jsp">Check flights</a>
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
                            <li><a href="dashboard.html">Home</a></li>
                            <li><a href="faq.html">Flight Booking</a></li>
                            <li><a href="contact.html">Dashboard</a></li>
                            <li><a href="top-destinations.html">FAQ</a></li>
                            <li><a href="privacy-policy.html">Contact Us</a></li>
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
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Meanu js -->
    <script src="assets/js/jquery.meanmenu.js"></script>
    <!-- owl carousel js -->
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- wow.js -->
    <script src="assets/js/wow.min.js"></script>
    <!-- Custom js -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/add-form.js"></script>
    <script src="assets/js/video.js"></script>
</body>

</html>
