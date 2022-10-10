<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Dashboard - PHOENIX AIRLINES </title>
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

    <!-- Common Banner Area -->
    <section id="common_banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="common_bannner_text">
                        <h2>FAQ</h2>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span>FAQ</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Faqs Area -->
    <section id="faqs_main_arae" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="section_heading_center">
                        <h2>Frequently Asked Questions</h2>
                    </div>
                </div>
            </div>
            <div class="faqs_area_top">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="faqs_three_area_wrapper">
                            <!-- Item One -->
                            <div class="faqs_item_wrapper">
                                <h3>At the Airport</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExample">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne" aria-expanded="true"
                                                    aria-controls="collapseOne">
                                                    What should I do when I arrive at the airport?
                                                </button>
                                            </h2>
                                            <div id="collapseOne" class="accordion-collapse collapse show"
                                                aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        If you have checked-in baggage, once you have arrived at the airport, please proceed to the “Baggage Drop Off” counter to drop your baggage and obtain your boarding pass.
                                                        If you do not have any baggage to be checked-in and travel only with Hand Baggage, you can directly proceed to the Boarding gate. 
                                                        However, please note that the online boarding pass is not accepted in certain countries. Hence you need to exchange your Boarding Pass at the check-in counter.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwo">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                    aria-expanded="false" aria-controls="collapseTwo">
                                                    What about my baggage?
                                                </button>
                                            </h2>
                                            <div id="collapseTwo" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       If you have check-in baggage, you can proceed to the bag drop area to hand in your baggage. If not, proceed directly to the gate to board your flight.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingThree">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                    aria-expanded="false" aria-controls="collapseThree">
                                                    Which airports accept eBoarding Passes?
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse"
                                                aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        An eBoarding pass is the boarding pass that you receive once you have checked-in online. You will receive this to the email address that you’ve entered at the time of checking-in online.  
                                                        Except the destinations mentioned below, all other airports accept e-boarding passes.
                                                    </p>
                                                        <br>
                                                    <table border="3">
                                                        <tr>
                                                            <th>Country</th>
                                                            <th>Air Port</th>
                                                        </tr>
                                                        <tr>
                                                            <td>Abu Dhabi</td>
                                                            <td>Chennai</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Bangalore</td>
                                                            <td>Cochin</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Beijing</td>
                                                            <td>Dhaka</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mumbai</td>
                                                            <td>Delhi</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Canton</td>
                                                            <td>Doha – Home Printed with Bar code is ONLY allowed.</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Jakarta</td>
                                                            <td>Gan Island</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kolkata</td>
                                                            <td>Kuala-Lumpur</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kuwait</td>
                                                            <td>Lahore</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Madurai</td>
                                                            <td>Muscat</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Maldives</td>
                                                            <td>Beijing</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Seychelles - Online check-in not available</td>
                                                            <td>Singapore</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Trivandrum</td>
                                                            <td>Trichy</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Varanasi</td>
                                                            <td>Gaya</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Hyderabad</td>
                                                            <td>Visakhapatnam</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Coimbatore</td>
                                                            <td>-</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingFour">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFour"
                                                    aria-expanded="false" aria-controls="collapseFour">
                                                    What payment methods are available?
                                                </button>
                                            </h2>
                                            <div id="collapseFour" class="accordion-collapse collapse"
                                                aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        We accept most major Maestro and Credit Card payments on all flights.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingFive">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFive"
                                                    aria-expanded="false" aria-controls="collapseFive">
                                                    First, business and premium class tickets?
                                                </button>
                                            </h2>
                                            <div id="collapseFive" class="accordion-collapse collapse"
                                                aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        By default the ticket class is set to Economy. 
                                                        However,you have the option to search your preferred ticket class (i.e. Economy, Premium economy, Business class or First class) by selecting it in the menu where you choose the number of passengers.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <!-- Item Two -->
                            <div class="faqs_item_wrapper">
                                <h3>PhoeniX Flights Booking</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleTwo">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingSix">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseSix" aria-expanded="true"
                                                    aria-controls="collapseSix">
                                                    What is the online booking facility at PhoeniX Airlines and how do I use it?
                                                </button>
                                            </h2>
                                            <div id="collapseSix" class="accordion-collapse collapse show"
                                                aria-labelledby="headingSix" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        The PhoeniX Airlines online booking facility provides you a convenient way of booking your flights over the internet through our website,
                                                        <br>
                                                        <b><a href="flight-booking.jsp">www.PhoeniX.com</a></b>
                                                        <br>
                                                        To book your PhoeniX Airlines flight, select your travel dates, choose a suitable flight, confirm your traveler details and decide how you would like to pay, We have noted it below.  
                                                        The online booking facility at, <b><a href="flight-booking.jsp">www.PhoeniX.com</a></b> also allows you to choose your preferred meals, reserve your seat, make changes to your booking and request for additional services all by yourself at the click of a button.
                                                        It also gives you the best fares available with no hidden charges.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                            <!-- Item Three -->
                            <div class="faqs_item_wrapper">
                                <h3>Canceling an PhoeniX flight booking</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleThree">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingSeven">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseSeven" aria-expanded="true"
                                                    aria-controls="collapseSeven">
                                                    Can I cancel my booking?
                                                </button>
                                            </h2>
                                            <div id="collapseSeven" class="accordion-collapse collapse show"
                                                aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        Yes, you can make any changes to your booking on <b><a href="flight-booking.jsp"> PhoeniX.com </a></b> through Manage your booking(opens in the same window). 
                                                        You can also keep your ticket and contact us when you’re ready travel again if your flight has been impacted by COVID‑19.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <!-- Item Four -->
                            <div class="faqs_item_wrapper">
                                <h3>Change a booking</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleFour">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingEight">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseEight" aria-expanded="true"
                                                    aria-controls="collapseEight">
                                                    How do I change details of my trip online after I’ve completed the booking?
                                                </button>
                                            </h2>
                                            <div id="collapseEight" class="accordion-collapse collapse show"
                                                aria-labelledby="headingEight" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        You can make changes to your booking through Manage your booking. It’s important to note that you’ll find a Change my booking link if your booking is eligible for online changes. 
                                                        You might be charged for certain changes, depending on the fare conditions of your ticket.
                                                        If your booking is not eligible for online changes, you can contact your travel agent or our Contact Number if you booked with us directly.
                                                        We’re currently receiving a lot of calls, so to avoid long wait times, here are some other ways to contact us(Opens in the same window). 
                                                        You can also try calling us closer to your planned travel date.
                                                        If you want to make changes to a rewards booking with a partner airline, please contact(Opens in the same window) the <b><a href="contact-us.jsp"> PhoeniX Skywards team. </a></b>``
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingNine">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseNine"
                                                    aria-expanded="false" aria-controls="collapseNine">
                                                    Will I have to pay any fees for changing my ticket?
                                                </button>
                                            </h2>
                                            <div id="collapseNine" class="accordion-collapse collapse"
                                                aria-labelledby="headingNine" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        Some fees and charges may apply to making changes to your booking, depending on the fare conditions of your ticket. If you make changes through Manage your booking (opens in the same window) on <b><a href="flight-booking.jsp"> PhoeniX.com </a></b> , you’ll find which charges will apply for penalties or additional taxes. You’ll also need to pay the difference if the fare for the new itinerary you’re planning to book is higher than the fare you’ve already paid.
                                                        You’ll need to pay for the charges and fare difference online to complete the changes to your ticket.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                             <!-- Item Five -->
                            <div class="faqs_item_wrapper">
                                <h3>Get Refunds</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleFive">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTen">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseTen" aria-expanded="true"
                                                    aria-controls="collapseTen">
                                                    Can I get a refund if I cancel my online booking?
                                                </button>
                                            </h2>
                                            <div id="collapseTen" class="accordion-collapse collapse show"
                                                aria-labelledby="headingTen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        Yes, you can receive a full refund as long as it’s within the conditions of your fare. We’ll refund the card you used to purchase your ticket.
                                                        You can also just keep hold of your ticket and use it to fly later instead. We’ve extended the validity of our tickets and made them more flexible to help with your travel plans.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <!-- Item Six -->
                            <div class="faqs_item_wrapper">
                                <h3>Entertainment</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleSix">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingEleven">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseEleven" aria-expanded="true"
                                                    aria-controls="collapseEleven">
                                                    What electronic devices can I use on board and flight safe mode?
                                                </button>
                                            </h2>
                                            <div id="collapseEleven" class="accordion-collapse collapse show"
                                                aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        You can use the following electronic devices on board,
                                                        <br>
                                                    <ol>
                                                        <li>Mobile phones</li>
                                                        <li>Restricted hand baggage applies to certain routes</li>
                                                        <li>Tablets</li>
                                                        <li>E-Readers</li>
                                                        <li>Portable DVD/CD players</li>
                                                        <li>Digital audio/MP3-players</li>
                                                        <li>Electronic games</li>
                                                        <li>Cameras</li>
                                                        <li>Bluetooth devices, e.g. wireless keyboards or headphones</li>
                                                        <li>Noise-cancelling headphones</li>
                                                    </ol>
                                                        <br>
                                                        When to use 'flight mode',
                                                        <br><br>
                                                        * Always follow the cabin crew’s directions to turn devices off or onto 'flight mode' when requested.
                                                        <br><br>
                                                        * You can use handheld devices, e.g. mobile phones, tablets and e-readers, at all times as long as you have enabled 'flight mode' before the flight departs.
                                                        <br><br>
                                                        * If your device transmits or receives communications but does not have a 'flight mode' you will need to switch it off before your flight departs and cannot use it during the flight.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwelve">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwelve"
                                                    aria-expanded="false" aria-controls="collapseTwelve">
                                                    Can I connect my device to the in-flight entertainment system?
                                                </button>
                                            </h2>
                                            <div id="collapseTwelve" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwelve" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       On most of our aircraft you can connect your device to the in-flight entertainment system to charge it, or even watch your own films on the bigger screen on board.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <!-- Item Seven -->
                            <div class="faqs_item_wrapper">
                                <h3>Travel Voucher</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleSeven">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingThirteen">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseThirteen" aria-expanded="true"
                                                    aria-controls="collapseThirteen">
                                                    What is a Travel voucher?
                                                </button>
                                            </h2>
                                            <div id="collapseThirteen" class="accordion-collapse collapse show"
                                                aria-labelledby="headingThirteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        A travel voucher is a document that has been given to the passenger in exchange of the value of their ticket. The ticket can be a totally unutilized ticket or a partially utilized ticket. 
                                                        This voucher is valid for 02 years from the date of issue of the voucher which can be used for future travel with the <b>PhoeniX Airlines.</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingFourteen">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFourteen"
                                                    aria-expanded="false" aria-controls="collapseFourteen">
                                                    I will not be able to use this voucher within 2 years. Can I transfer this voucher to another person?
                                                </button>
                                            </h2>
                                            <div id="collapseFourteen" class="accordion-collapse collapse"
                                                aria-labelledby="headingFourteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       Yes, This voucher is transferable, subject to special terms and conditions upon redeeming.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingFifteen">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseFifteen"
                                                    aria-expanded="false" aria-controls="collapseFifteen">
                                                    Can my voucher be refunded?
                                                </button>
                                            </h2>
                                            <div id="collapseFifteen" class="accordion-collapse collapse"
                                                aria-labelledby="headingFifteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       Yes. Your voucher is refundable.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!-- Item Eight -->
                            <div class="faqs_item_wrapper">
                                <h3>Traveling with children</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleEight">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingSixteen">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseSixteen" aria-expanded="true"
                                                    aria-controls="collapseSixteen">
                                                    Can I use online check-in if I am travelling with an infant?
                                                </button>
                                            </h2>
                                            <div id="collapseSixteen" class="accordion-collapse collapse show"
                                                aria-labelledby="headingSixteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        Yes you can.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingSeventeen">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseSeventeen"
                                                    aria-expanded="false" aria-controls="collapseSeventeen">
                                                    Can my child travel alone on a PhoeniX Airlines Flight?
                                                </button>
                                            </h2>
                                            <div id="collapseSeventeen" class="accordion-collapse collapse"
                                                aria-labelledby="headingSeventeen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       Children between the ages of 5 and 16 can't traveling alone. 
                                                       Tickets for that children cannot be purchased online. Please contact nearest ticket office, global call center in such instances.
                                                       <br>
                                                       Passengers between the ages of 12 and 17 are not able to traveling alone without a passenger who is 18 years or older.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingEighteen">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseEighteen"
                                                    aria-expanded="false" aria-controls="collapseEighteen">
                                                    Can children traveling alone use online check-in?
                                                </button>
                                            </h2>
                                            <div id="collapseEighteen" class="accordion-collapse collapse"
                                                aria-labelledby="headingEighteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       No they cannot. Children are required to be physically present at the airport counter in order to check in.
                                                       <br>
                                                       Please follow the procedure for children at the time of purchase ticket
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <!-- Item Nine -->
                            <div class="faqs_item_wrapper">
                                <h3>Meals</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleNine">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingNineteen">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseNineteen" aria-expanded="true"
                                                    aria-controls="collapseNineteen">
                                                    Can I pre-order a special meal for dietary or religious purposes on both operating carrier’s codeshare flights?
                                                </button>
                                            </h2>
                                            <div id="collapseNineteen" class="accordion-collapse collapse show"
                                                aria-labelledby="headingNineteen" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        You can select a special meal on PhoeniX  operated flights by using the Manage booking feature on <b><a href="flight-booking.jsp"> PhoeniX.com. </a></b> 
                                                        For flyPhoeniX operated flights, if you are traveling in Business Class, a choice of 12 meals are offered which you can pre-order.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwenty">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwenty"
                                                    aria-expanded="false" aria-controls="collapseTwenty">
                                                    Can I bring baby food in liquid form into the airplane?
                                                </button>
                                            </h2>
                                            <div id="collapseTwenty" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwenty" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       We recommend that you bring a sufficient amount of baby bottles and food  for the entire trip. Also, be sure that your baby drinks a lot during the flight.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentyone">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentyone"
                                                    aria-expanded="false" aria-controls="collapseTwentyone">
                                                    Where do I go for meal selection? 
                                                </button>
                                            </h2>
                                            <div id="collapseTwentyone" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentyone" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                      Meal Selection can be done through Manage Booking on the PhoeniX Airlines website or on the PhoeniXAir mobile app.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentytwo">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentytwo"
                                                    aria-expanded="false" aria-controls="collapseTwentytwo">
                                                    How will I know if my meal selection has been confirmed? 
                                                </button>
                                            </h2>
                                            <div id="collapseTwentytwo" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentytwo" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       We will send you a confirmation e-mail with your meal details once you have successfully saved the request.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentythree">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentythree"
                                                    aria-expanded="false" aria-controls="collapseTwentythree">
                                                    Can I change my mind about my meal choice?
                                                </button>
                                            </h2>
                                            <div id="collapseTwentythree" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentythree" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       Yes, you can change your meal selection up to 24 hours before departure.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!-- Item Ten -->
                            <div class="faqs_item_wrapper">
                                <h3>Other services</h3>
                                <div class="faqs_main_item">
                                    <div class="accordion" id="accordionExampleTen">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentyfour">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseTwentyfour" aria-expanded="true"
                                                    aria-controls="collapseTwentyfour">
                                                    I need to make a booking for a group. How do I do it?
                                                </button>
                                            </h2>
                                            <div id="collapseTwentyfour" class="accordion-collapse collapse show"
                                                aria-labelledby="headingTwentyfour" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        In online booking, you can only book for 9 people under one reservation.
                                                        Please break up the group under as many reservations as necessary at your own convenience. 
                                                        For example, if your group consists of 15 passengers, you may make one reservation for 9 passengers and another reservation for the remaining 6 passengers.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentyfive">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentyfive"
                                                    aria-expanded="false" aria-controls="collapseTwentyfive">
                                                    Can I reserve my preferred seat when making my booking?
                                                </button>
                                            </h2>
                                            <div id="collapseTwentyfive" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentyfive" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                       Yes you can. You are provided with the facility of reserving your preferred seat online after inserting your travel Information during the online booking process.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentysix">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentysix"
                                                    aria-expanded="false" aria-controls="collapseTwentysix">
                                                    Can I change my seat and meal preferences after completing my online booking?
                                                </button>
                                            </h2>
                                            <div id="collapseTwentysix" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentysix" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                      Yes. Once you have completed your booking online, you can change your seat and meal preference through the ‘Manage My Booking’ feature on the website up to 24 hours before your flight’s departure.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="accordion-item">
                                            <h2 class="accordion-header" id="headingTwentyseven">
                                                <button class="accordion-button collapsed" type="button"
                                                    data-bs-toggle="collapse" data-bs-target="#collapseTwentyseven"
                                                    aria-expanded="false" aria-controls="collapseTwentyseven">
                                                    How can I purchase a student discount fare ticket? 
                                                </button>
                                            </h2>
                                            <div id="collapseTwentyseven" class="accordion-collapse collapse"
                                                aria-labelledby="headingTwentyseven" data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <p>
                                                        Students traveling between their home country and their country of study are eligible for <b>10% off</b> on their initial air ticket and <b>15% discount</b> on air tickets purchased thereafter under this promotion. Parents and spouse of the student can also benefit from <b>5% discount</b> on airfare for the same sector. In addition to this, students can also benefit from <b>40KG</b> free baggage allowance when availing this offer.
                                                        <br><br>
                                                       Steps for availing this offer are as below,
                                                       <br><br>
                                                       Purchase the ticket online through <b><a href="flight-booking.jsp"> www.PhoeniX.com</a></b>
                                                       Send an email to <b>bookings@PhoeniX.com</b> with the <b>student visa</b> to claim the <b>discount</b> and <b>extra baggage.</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <div class="col-lg-4">
                        <div class="faqs_call_area">
                            <img src="https://www.gannett-cdn.com/presto/2019/06/23/USAT/c3a9f051-bd6c-4b39-b5b9-38244deec783-GettyImages-932651818.jpg?width=660&height=517&fit=crop&format=pjpg&auto=webp" alt="img">
                            <h5>Contact The PhoeniX Skywards Team If You Need Any Help? </h5>
                            <h5>Contact US With</h5>
                            <h5>0115604205</h5>
                            <h5>" PhoeniX Airlines Fly the Friendly Skies!! "</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
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
    <!-- owl carousel js -->
    <script src="assets/js/owl.carousel.min.js"></script>
    <!-- wow.js -->
    <script src="assets/js/wow.min.js"></script>
    <!-- Custom js -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/add-form.js"></script>

</body>

</html>

