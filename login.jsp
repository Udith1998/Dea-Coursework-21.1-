<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PhoenixAirlinesDB","root","");
        PreparedStatement pst = con.prepareStatement("Select * from Client where username = ? and password = ?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){           
            %>
                <jsp:forward page ="index.html"/>
            <%
        }
    
        else{           
            %>
                <jsp:forward page ="login.html"/>
            <%
        }
        
    }catch(Exception e){
        out.println(e);
    }
%>


