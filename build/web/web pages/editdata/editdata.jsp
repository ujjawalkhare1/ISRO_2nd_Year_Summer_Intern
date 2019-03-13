
<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
    <title>editdata.jsp</title>

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
     div.horizontal {
    width: 100%;
    height: 550px;
    overflow: auto;
}
     
      p {
    display: block;
    margin-top: 10em;
    
    margin-left: 10em;
    
        }
     
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
<%! String k; %>

<div class="horizontal">
<table>
    <col width="130">
  <col width="80">
  <tr>
    
    <th>Scientific Name</th>
    <th>Author</th>
    <th>Institute</th>
    <th>State</th>
    <th>Year</th>
    <th>Kingdom</th>
    <th>Phylum</th>
    <th>Class</th>
    <th>Sub Class</th>
    <th>Order</th>
    <th>Genus</th>
    <th>Family</th>
    <th>Species</th>
    <th>Pic Name</th>
    <th>Submission Date</th>
    <th>Habit</th>
  </tr>

 <script>
      function show(pk) 
                  
         { 
             alert(pk);
      
         document.location.href="editrow.jsp?pk="+pk ;
       
    }
    function flag(){
        <%
            //HttpSession session1 = request.getSession();
            session.setAttribute("flow","String");
        %>
        document.location.href="../home/home.jsp";
        
    }
               
</script>
  
     <% 
         String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        
        String temp =(String)session.getAttribute("temp");
        
       Class.forName("org.postgresql.Driver");
      Connection cn = DriverManager.getConnection(url, user, pwd);
      String sql = "select * from "+temp+" order by id";
      
      PreparedStatement ps = cn.prepareStatement(sql);  
      ResultSet r = ps.executeQuery();
    
     

       
   
    while(r.next())
     {
     
     
     %>
     
     <tr>
         
     <td> <a target='_blank' > <%=(r.getString("scientificname")==null)?"-":r.getString("scientificname") %></a></td> 
        
     <td> <a target='_blank' > <%=(r.getString("author")==null)?"-":r.getString("author") %>  </a>  </td>
     
     <td> <a target='_blank' > <%=(r.getString("institute")==null)?"-":r.getString("institute")%>  </a>   </td>
     
     <td> <a target='_blank' > <%=(r.getString("state")==null)?"-":r.getString("state") %>  </a>   </td>
     
     <td> <a target='_blank' > <%=(r.getString("year")==null)?"-":r.getString("year") %>  </a>   </td>
     
     <td> <a target='_blank' > <%=(r.getString("kingdom")==null)?"-":r.getString("kingdom") %></a></td>
         
     <td> <a target='_blank' > <%=(r.getString("phyllum")==null)?"-":r.getString("phyllum") %></a></td>
             
     <td> <a target='_blank' > <%=(r.getString("class")==null)?"-":r.getString("class") %></a></td>
                 
     <td> <a target='_blank' > <%=(r.getString("subclass")==null)?"-":r.getString("subclass") %></a></td>
                          
     <td> <a target='_blank' > <%=(r.getString("order_")==null)?"-":r.getString("order_") %></a></td>      
       
     <td> <a target='_blank' > <%=(r.getString("genus")==null)?"-":r.getString("genus") %>  </a>  </td>
     
     <td> <a target='_blank' > <%=(r.getString("family_")==null)?"-":r.getString("family_") %>  </a>   </td>
     
     <td> <a target='_blank' > <%=(r.getString("species")==null)?"-":r.getString("species") %>  </a>   </td>
    
     <td> <a target='_blank' > <%=(r.getString("picname")==null)?"-":r.getString("picname") %>  </a>   </td>
     
     <td> <a target='_blank' > <%=(r.getString("submissiondate")==null)?"-":r.getString("submissiondate") %></a></td>
         
     <td> <a target='_blank' > <%=(r.getString("habit")==null)?"-":r.getString("habit") %></a></td> </tr>
                     
     </tr>              
    
      <tr> <td> <a target='_blank' href="javascript:show('<%= r.getString("id") %>' );"> Edit</a></td>     
       
     <%}%>
      
    
</tr>
<tr><form action="javascript:flag()">
    <input type="submit" value="Confirm">
        </form>
</tr>
 </table>
</div>
    
  
</body>
</html>