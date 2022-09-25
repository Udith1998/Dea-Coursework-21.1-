<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>Register - Phoenix Airlines </title>
    <!-- Bootstrap css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <!-- Fontawesome css -->
    <link rel="stylesheet" href="assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <!-- Slick css -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css" />
    <!--slick-theme.css-->
    <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css" />
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
    <link rel="stylesheet" href="assets/css/rangeslider.css" type="text/css"/>
    
    
</head>

<body>
     
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- Header Area -->
    <header class="main_header_arae">
        <!-- Top Bar -->
        <div class="topbar-area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <ul class="topbar-others-options">
                            <li><a href="login.html">Login</a></li>
                            <li> <a href="signup.html">Sign up</a>
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
                </div>
            </div>
        </div>
        
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
                                    <a href="#" class="nav-link">
                                        Home
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        Flights
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
                                    <a href="#" class="nav-link">
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
                        <h2>Sign Up</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><span><i class="fas fa-circle"></i></span> Sign Up</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--  Common Author Area -->
    <section id="common_author_area" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="common_author_boxed">
                        <div class="common_author_heading">
                            <h2>Create an account</h2>
                        </div>
                        <div class="common_author_form">
                            <form action="newsignup.jsp" name="main_author_form" method="post" id="main_author_form">
                                
                                <div class="form-group">
                                    <input type="text" name="fname" id="fname" class="form-control" placeholder="Your first name*" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your last name*" name="lname" id="lname" required="required" />
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="NIC*" name="nic" id="nic" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" class="form-control"
                                        placeholder="your email address*" name="email" id="email" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Mobile number (optional)" name="mobile" id="mobile"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username*" name="username" id="username" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password*" name="password" id="password" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Re-enter your password*" name="confirm-password" id="confirm-password" required="required"/>
                                    <small></small>
                                </div>
                                
                                <div class="common_form_submit">
                                    <input type="submit" class="btn btn_theme btn_md" value="Create Account"/>
                                </div>
                                
                                <div class="have_acount_area other_author_option">
                                    <div class="line_or">
                                    </div>
                                    <p>Already have an account? <a href="login.html">Log in now</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String username = request.getParameter("username");
        String password = request.getParameter("password");               

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");

            PreparedStatement ps1 = con.prepareStatement("select *from Client where username=?");
            ps1.setString(1, username);
            ResultSet rs = ps1.executeQuery();

            if(rs.next()){
                %>
                <script>
                    swal({
                        title: "Oops!",
                        text: "This username is already taken.",
                        icon: "error",
                        button: "Continue"
                    });
                </script> 
                <%
            }

            else {
                PreparedStatement ps = con.prepareStatement("Insert into Client(FirstName,LastName,NIC,Email,MobileNo,Username,Password) values(?,?,?,?,?,?,?)");

                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, nic);
                ps.setString(4, email);
                ps.setString(5, mobile);
                ps.setString(6, username);
                ps.setString(7, password);

                int x = ps.executeUpdate();

                if(x>0){
                    %>
                    <script>
                        swal({
                            title: "Success!",
                            text: "Your account has been successfully created. Please login...",
                            icon: "success",
                            button: "Continue"
                        }).then(function(){
                            window.location = "login.html";
                        });
                    </script>   
                    <%
                }
            }

        }catch(Exception e){
            out.println(e);
        }
    %>
    
   

    <!-- Footer -->
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
                <div class="col-lg-2 col-md-4 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Support</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="dashboard.html">Account</a></li>
                            <li><a href="faq.html">Faq</a></li>
                            <li><a href="testimonials.html">Legal</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="top-destinations.html"> Affiliate Program</a></li>
                            <li><a href="privacy-policy.html">Privacy Policy</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Other Services</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="top-destinations-details.html">Community program</a></li>
                            <li><a href="top-destinations-details.html">Investor Relations</a></li>
                            <li><a href="flight-search-result.html">Rewards Program</a></li>
                            <li><a href="room-booking.html">PointsPLUS</a></li>
                            <li><a href="testimonials.html">Partners</a></li>
                            <li><a href="hotel-search.html">List My Hotel</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6 col-12">
                    <div class="footer_heading_area">
                        <h5>Top cities</h5>
                    </div>
                    <div class="footer_link_area">
                        <ul>
                            <li><a href="room-details.html">Chicago</a></li>
                            <li><a href="hotel-details.html">New York</a></li>
                            <li><a href="hotel-booking.html">San Francisco</a></li>
                            <li><a href="tour-search.html">California</a></li>
                            <li><a href="tour-booking.html">Ohio </a></li>
                            <li><a href="tour-guides.html">Alaska</a></li>
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
    <script src="signup.js" type="text/javascript"></script>
    
</body>

</html>