
<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.* " import = "java.lang.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
    <title>editrow.jsp</title>
</head>
<body>

<img class = "image" src = "../images/IIRS.jpg" align="left" height="100" width="100">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">


<nav class="w3-bar w3-black">
  <a href="#home" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="#contact" class="w3-button w3-bar-item">Contact</a>
  
</nav>
 <style>
 table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 4px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

<table>
    <col width="130">
  <col width="80">
  <tr>
    <th>A</th>
    <th>    </th>
    <th>B</th>
    <th>    </th>
    <th>C</th>
    <th>    </th>
    <th>D</th>
    <th>    </th>
    <th>E</th>
    <th>    </th>
  </tr>

 <script        type="text/javascript">
     function show(c) 
                  
         {          
            
             //alert(pk);
        // response.sendRedirect("update.jsp");
         document.location.href="editxcell.jsp?column="+c; //"&;
       
    }
      
               
</script>
  
     <% String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        
        String val =request.getParameter("pk");
        String val1="'"+val+"'";//important
     
       
        String temp =(String)session.getAttribute("temp");
        
     
        int value = Integer.parseInt(val);
        HttpSession sessio = request.getSession(true); 
        sessio.setAttribute("pk", value);
  
        Class.forName("org.postgresql.Driver");
        Connection cn = DriverManager.getConnection(url, user, pwd);
        String sql = "select * from "+temp+" where id ="+val1;
      
        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet r = ps.executeQuery();
        while(r.next())
       {
      
        
     %>
        <tr>
            
     <td> <a target='_blank' > <%= r.getString("scientificname")==null?"-":r.getString("scientificname") %></a></td>      
     <td> <a target='_blank' href="javascript:show('scientificname');"> Edit</a></td>
         
     <td> <a target='_blank' > <%=r.getString("author")==null?"-":r.getString("author") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('author');"> Edit</a></td>
         
     <td> <a target='_blank'>  <%= r.getString("institute")==null?"-":r.getString("institute") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('institute');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("state")==null?"-":r.getString("state") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('state');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("year")==null?"-":r.getString("year") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('year');"> Edit</a></td>
     
     <td> <a target='_blank' > <%= r.getString("kingdom")==null?"-":r.getString("kingdom") %></a></td>      
     <td> <a target='_blank' href="javascript:show('kingdom');"> Edit</a></td>
         
     <td> <a target='_blank' > <%=r.getString("phyllum")==null?"-":r.getString("phyllum") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('phyllum');"> Edit</a></td>
         
     <td> <a target='_blank'>  <%= r.getString("class")==null?"-":r.getString("class") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('class');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("subclass")==null?"-":r.getString("subclass") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('subclass');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("order_")==null?"-":r.getString("order_") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('order_');"> Edit</a></td>
     
     <td> <a target='_blank' > <%= r.getString("genus")==null?"-":r.getString("genus") %></a></td>      
     <td> <a target='_blank' href="javascript:show('genus');"> Edit</a></td>
         
     <td> <a target='_blank' > <%=r.getString("family_")==null?"-":r.getString("family_") %>  </a>  </td>
     <td> <a target='_blank' href="javascript:show('family_');"> Edit</a></td>
         
     <td> <a target='_blank'>  <%= r.getString("species")==null?"-":r.getString("species") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('species');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("submissiondate")==null?"-":r.getString("submissiondate") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('submissiondate');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("picname")==null?"-":r.getString("picname") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('picname');"> Edit</a></td>
     
     <td> <a target='_blank'>  <%= r.getString("habit")==null?"-":r.getString("habit") %>  </a>   </td>
     <td> <a target='_blank' href="javascript:show('habit');"> Edit</a></td>
     
     </tr>
           
     <%
         }
     %>
     
     
      
    

      
 </table>
    
  
</body>
</html>