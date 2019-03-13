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


<br><form name="loginServlet" method="post" action="upload1.jsp" enctype="multipart/form-data">

<tr>  <td> Verification Documents</td><td> (formats:.pdf, .jpeg, .jpg, .png) </td>
 <br /> 
</tr>

<tr>
               <td> Select document 1 to upload: <br > </td>
            <td>   <input type="file"  name="file" size="50" multiple required> </td>
            <br />
</tr>


<tr>
    <td> <input type="submit" name="b1" id="b1" value="Register" /> </td>
</tr>
</form>


</body>
</html>
