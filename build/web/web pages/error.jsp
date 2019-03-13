<%-- 
    Document   : autherror
    Created on : 24 May, 2018, 10:36:49 AM
    Author     : trainee2018090
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>error</h1>
        <%
            String url=request.getParameter("address")+"/"+request.getParameter("address")+".jsp";                                   
        %>
       
        <form action ='<%= url%>' method ="post">
            <input type ="submit" value ="Redirect" style="margin-left: 50%">
        </form>
    </body>
</html>
