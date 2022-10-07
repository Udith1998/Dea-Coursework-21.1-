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
    
    <!-- Navigation bar -->
    <div class="navbar-area">
        <div class="main-responsive-nav">
            <div class="container">
                <div class="main-responsive-menu">
                    <div class="logo">
                        <a href="index.html">
                            <img src="assets/img/logo.png" alt=""/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-navbar">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light">
                    <a class="navbar-brand" href="index.html">
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
                                <a href="#" class="nav-link">
                                    Flight Booking
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    Dashboard
                                </a>
                            </li>


                            <li class="nav-item">
                                <a href="faqs.html" class="nav-link">
                                    FAQ
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="contact.html" class="nav-link">
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
                        <h2>Admin Dashboard</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span>Admin Dashboard</li>
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
                                <li><a href="adminDashboardTickets.jsp" class="active"><i class="fas fa-wallet"></i>Tickets</a></li>
                                <li><a href="adminDashboardStaff.jsp"><i class="fas fa-id-card-alt"></i>Staff Members</a></li>
                                <li><a href="adminDashboardClient.jsp"><i class="fas fa-user-circle"></i>Clients</a></li>

                                <li>
                                    <a href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <i class="fas fa-sign-out-alt"></i><a href="adminLogout.jsp"> Logout </a>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="dashboard_common_table">
                        <h3>Tickets</h3>
                        <div class="table-responsive-lg table_common_area">
                            <table class="table">
                                
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
                                    
                                    PreparedStatement pst1 = con.prepareStatement("select * from ticket");
                                    ResultSet rs1 = pst1.executeQuery();
                                %>
                                
                                    <thead>
                                        <tr>
                                            <th>Ticket ID</th>
                                            <th>Flight ID</th>
                                            <th>Class</th>
                                            <th>Departure Date</th>
                                            <th>Username</th>
                                            <th>Passenger Name</th>
                                            <th>Passport No</th>
                                            <th>Contact Details</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while(rs1.next()){%>
                                            <tr>
                                                <td><%="TID_"+rs1.getString("ID")%></td>
                                                <td><%=rs1.getString("FlightID")%></td>
                                                <td><%=rs1.getString("Class")%></td>
                                                <td><%=rs1.getString("DepartureDate")%></td>
                                                <td><%=rs1.getString("Username")%></td>
                                                <td><%=rs1.getString("Title")+". "+rs1.getString("PassengerName")%></td>
                                                <td><%=rs1.getString("PassportNo")%></td>
                                                <td><%=rs1.getString("ContactFName")+" "+rs1.getString("ContactLName")%><br><%=rs1.getString("Email")%><br><%=rs1.getString("MobileNo")%></td>
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
