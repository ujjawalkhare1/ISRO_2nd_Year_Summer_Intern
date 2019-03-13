<%-- 
    Document   : UserVerification
    Created on : May 23, 2018, 4:31:29 PM
    Author     : trainee2018089, Nitish Jaiswal
--%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Verification</title>
    </head>
    <body >
        <br>
        <img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
        <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
        
        <br><br>
        <h1 align = "center">Welcome user!</h1><br>
       
      <%
          String username=request.getParameter("username");
          String password=request.getParameter("password");
          System.out.println(username);
      
          String url ="jdbc:postgresql://localhost:5432/postgres";
          String user = "postgres";
          String pwd= "hclfamily";
        

       
        Class.forName("org.postgresql.Driver");
        Connection cn = DriverManager.getConnection(url, user , pwd);
        String sql = "insert into logindata values(?,?)";

PreparedStatement ps = cn.prepareStatement(sql);
    ps.setString(1,username);
    ps.setString(2,password);
    ps.executeUpdate();

      %>
            <p align="center"> <%= "Your username is:"+username%>
        <br>
        <%= "Your password is:"+password%>
     
        </body>
        <form action ="../login/login.jsp" method ="post">
            <input type ="submit" value ="Login" style="margin-left: 50%">
        </form>
</html>
