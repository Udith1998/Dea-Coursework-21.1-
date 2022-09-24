<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String nic = request.getParameter("nic");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("confirm-password");

               

            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
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
                        <jsp:forward page ="login.html" />
                    <%
                }
                else{
                    %>
                        <jsp:forward page ="signup.html" /> 
                    <%
                }

            }catch(Exception e){
                out.println(e);
            }
        %>

    </body>
</html>
