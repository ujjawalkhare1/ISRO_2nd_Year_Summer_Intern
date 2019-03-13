<%@ page import = "java.io.*,java.util.*,java.lang.*,java.math.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration page</title>
</head>

<body>
<br>




 <img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">


<br>


<br><form name="loginServlet" method="post" action="registration1.jsp">
<table width="23%" bgcolor="#FF8C00" align="center">

<tr>
<td colspan=2><center><font size=4><b>Please enter your details here</b></font></center></td>
</tr>

<tr>
<td>Institute Name:</td>
<td><input type="text" size=25 name="1" required></td>
</tr>


<tr>
<td>Coordinator:</td>
<td><input type="text" size=25 name="2" required></td>
</tr>

<tr>
<td>Designation:</td>
<td><input type="text" size=25 name="3" ></td>
</tr>

<tr>
<td>Email-Id:</td>
<td><input type="text" size=50 name="4" required></td>
</tr>

<tr>
<td>Qualification:</td>
<td><input type="text" size=25 name="5"></td>
</tr>

<tr>
<td>Mobile Number:</td>
<td><input type="text" size=25 name="6" required></td>
</tr>

<tr>
<td>Type of Institution:</td>
<td><input type="text" size=25 name="7" required></td>
</tr>

<tr>
<td>Address:</td>
<td><input type="text" size=25 name="8" required></td>
</tr>





<tr>
    <td> <input type="submit" name="b1" id="b1" value="Register" /> </td>
</tr>
</form>


</body>
</html>
