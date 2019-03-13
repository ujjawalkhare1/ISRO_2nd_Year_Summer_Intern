<%-- 
    Document   : registration1
    Created on : May 24, 2018, 11:40:48 AM
    Author     : trainee2018088
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.*"%>
<%@ page import="java.io.*,java.util.*, java.lang.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration</title>
    </head>
    <body>
        <%
            
         
        String[] array= new String[8];
       
     
    for (int i=0; i<8; i++)
    {
        array[i]=request.getParameter(Integer.toString(i+1));
       
    }
 
    session.setAttribute("array", array);
    response.sendRedirect("upload.jsp");
    %>
    
    </body>
</html>
    
 
 