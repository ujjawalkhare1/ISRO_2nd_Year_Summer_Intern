<%-- 
    Document   : update
    Created on : May 28, 2018, 12:46:38 PM
    Author     : trainee2018088
--%>

<%@ page import = "java.io.*,java.util.*,java.lang.*,java.math.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editxcell.jsp</title>
    </head>
    <body>
         <% 
             
            String val = request.getParameter("column");
            HttpSession sessio = request.getSession(true); 
            sessio.setAttribute("column", val);
  


         %>
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
        <form name="loginServlet" method="post" action="editxcell1.jsp">
<table width="23%" bgcolor="#FF8C00" align="center">

<tr>
<td colspan=2><center><font size=4><b>Enter Updated Value</b></font></center></td>
</tr>

<tr>
<td>New value:</td>
<td><input type="text" size=25 name="updated_value" required></td>
</tr>
<tr>

<td align='center'><input type="submit" name="Update"></td>
</tr>
    </body>
</html>
