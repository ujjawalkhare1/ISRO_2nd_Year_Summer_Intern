<%-- 
    Document   : login1
    Created on : 24 May, 2018, 10:14:02 AM
    Author     : trainee2018090
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
<%
    
String username = request.getParameter("username");
String password = request.getParameter("password");

Class.forName("org.postgresql.Driver");
Connection cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","hclfamily");
String sql = "SELECT * FROM logindata WHERE USERNAME=?";

PreparedStatement ps = cn.prepareStatement(sql);

ps.setString(1,username);

ResultSet r1 = ps.executeQuery();

if(r1.next())
{
    String pass = r1.getString("password");
    
    if(pass.equals(password))
    {
        request.getSession(true);
        session.setAttribute("username", username);
        response.sendRedirect("../home/home.jsp");
    }
    else
    {
        response.sendRedirect("../error.jsp?address=login");
    
    }
}
else
{ response.sendRedirect("../error.jsp?address=login");}




%>

    </body>
</html>
