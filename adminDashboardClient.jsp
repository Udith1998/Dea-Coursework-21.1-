<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Admin Dashboard - PHOENIX AIRLINES </title>
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
                        <h2>Dashboard</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span>Dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Dashboard Area -->
    <section id="dashboard_main_arae" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="dashboard_sidebar">
                        <div class="dashboard_sidebar_user">
                            <img src="assets/img/common/dashboard-user1.png" alt="img">
                            <h3>Admin</h3>
                        </div>
                        <div class="dashboard_menu_area">
                            <ul>
                                <li><a href="adminDashboard.jsp"> <i class="fas fa-plane"></i>Flights</a></li>
                                <li><a href="adminDashboardTickets.jsp"><i class="fas fa-wallet"></i>Tickets</a></li>
                                <li><a href="adminDashboardStaff.jsp"><i class="fas fa-id-card-alt"></i>Staff Members</a></li>
                                <li><a href="adminDashboardClient.jsp" class="active"><i class="fas fa-user-circle"></i>Clients</a></li>

                                <li>
                                    <a href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <i class="fas fa-sign-out-alt"></i><a href="LogoutServlet"> Logout </a>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="dashboard_common_table">
                        <h3>Clients</h3>
                        <div class="table-responsive-lg table_common_area">
                            <table class="table">
                                
                                <%
                                    PreparedStatement pst1 = con.prepareStatement("select * from client");
                                    ResultSet rs1 = pst1.executeQuery();
                                %>
                                
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>NIC</th>
                                            <th>Mobile No</th>
                                            <th>Email</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while(rs1.next()){%>
                                            <tr>
                                                <td><%="@"+rs1.getString("Username")%></td>
                                                <td><%=rs1.getString("FirstName")%></td>
                                                <td><%=rs1.getString("LastName")%></td>
                                                <td><%=rs1.getString("NIC")%></td>
                                                <td><%=rs1.getString("MobileNo")%></td>
                                                <td><%=rs1.getString("Email")%></td>
                                            </tr>
                                        <%}%>
                                    </tbody>
                            </table>
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
