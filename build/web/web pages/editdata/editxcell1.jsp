
<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editxcell1.jsp</title>
    </head>
    <body>
        <%
            
            
        String val = request.getParameter("updated_value");
               
        String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        
        String temp =(String)session.getAttribute("temp");
      
        HttpSession sessio = request.getSession(true);   
        String id = sessio.getAttribute("pk").toString(); 
        String col = sessio.getAttribute("column").toString();
        
       
      
       String val1= "'"+val+"'";
       
       Class.forName("org.postgresql.Driver");
       Connection cn = DriverManager.getConnection(url, user , pwd);
       
        String sql = "update "+temp+" set "+col+"= "+val1+" where id =" +id;
       

        PreparedStatement ps = cn.prepareStatement(sql);
        
        ps.executeUpdate();
        
        response.sendRedirect("editdata.jsp");
%>


</body>

