<%-- 
    Document   : newjsp
    Created on : 24 May, 2018, 9:47:56 AM
    Author     : trainee2018090
--%>

<%-- 
    Document   : newjsp
    Created on : May 23, 2018, 4:05:49 PM
    Author     : trainee2018088
--%>

<%@ page import = "java.io.*,java.util.*,java.lang.*,java.math.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Login Page</title>
</head>

<body>
<br>




 <img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<br><form name="loginServlet" method="post" action="login1.jsp">
<table width="20%" bgcolor="#FF8C00" align="center">

<tr>
<td colspan=2><center><font size=4><b>Please login here</b></font></center></td>
</tr>

<tr>
<td>Username:</td>
<td><input type="text" size=25 name="username" required></td>
</tr>


<tr>
<td>Password:</td>
<td><input type="Password" size=25 name="password" required></td>
</tr>
<input type="submit" name="b1" id="b1" value="LOGIN" style="width: 144px; margin-left:42%  ;"/></table>
</form>
<form method="post" action="../register/register.jsp">
    <input type="submit" value="REGISTER" style="width: 144px; margin-left:42% ;">      
</form>
</body>
</html>




