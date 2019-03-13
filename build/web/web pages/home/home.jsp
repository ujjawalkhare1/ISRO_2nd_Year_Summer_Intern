
<%@page contentType="text/html" pageEncoding="UTF-8"  import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css"><head>
    <title>home.jsp</title>
</head>
<body>
    
<img class = "image" src = "../images/IIRS.jpg" align="left" height="120" width="120">
 <img class = "image" src = "../images/ISRO.gif"  align="right"  height="120" width="120">
 <br>
 <br>
  <br>
 <br> <br>
 <br>


<nav class="w3-bar w3-black">
  <a href="home.jsp" class="w3-button w3-bar-item">Home</a>
  <a href="#documentation" class="w3-button w3-bar-item">Documentation</a>
  <a href="#tools" class="w3-button w3-bar-item">Tools</a>
  <a href="../contact.jsp" class="w3-button w3-bar-item">Contact</a>
  
  <form method="post" action="#">
            <p align="right">Search&emsp;<input type="text" name="search" required>&emsp;
                <input type="submit" value="submit"></p>
        </form>
  
</nav>
 <style>
 table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    
    white-space: nowrap;
    
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 4px;
    
}

tr:nth-child(even) {
    background-color: #dddddd;
}
div.horizontal {
    width: 100%;
    height: 550px;
    overflow: auto;
}
</style>

<form action="uploadcsv1.jsp" method="post" enctype="multipart/form-data">
    <div style="background-color:lightblue" >
            <h3>CSV File Upload:</h3>
            Select a file to upload: <br />
            <input type="file" accept=".csv,.zip" name="file" size="50" multiple required/>
            <br />
            <input type="submit" value="Upload File" />
    </div>
   
        
<%! String k; %>
<div class="horizontal">
<table>
    <col width="130">
  <col width="80">
  <tr>
    <th>Scientific Name</th>
    <th>Image path</th>
    <th>Image</th>
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


  
     <% 
        String search= request.getParameter("search");
        
        
        
        String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        String temp =(String)session.getAttribute("temp");
        
       Class.forName("org.postgresql.Driver");
      Connection cn = DriverManager.getConnection(url, user, pwd);
      String sql1=null;
      
      if(search == null){
      String sql = "select * from test order by id asc";
      sql1=sql;
      }
      
      //,  , , , , , , , , family_, species, submissiondate,picname,habit
        else
        {
            String search1= "'"+search+"%'";
            String sql = "select * from test where scientificname ilike "+search1+" or author ilike "+search1+" or institute ilike "+search1+" or state ilike "+search1 +" or year ilike "+search1+                                                                                                        
                     " or phyllum ilike "+search1+" or class ilike "+search1+" or subclass ilike "+search1+" or order_ ilike "+search1 +                                                                                                                                                                                    
                    " or family_ ilike "+search1+" or species ilike "+search1+" or submissiondate ilike "+search1+" or picname ilike "+search1+" or habit ilike "+search1+" order by id";                            
            sql1=sql;
        }
      
      String var = (String)session.getAttribute("flow");
      if(var!=null)
        {
            String drop = "alter table "+temp+" drop column id; ";
            String update="insert into test(scientificname, author, institute, state, year, kingdom, phyllum, class, subclass, order_, genus, family_, species, submissiondate,picname,habit, datasetkey) select scientificname, author, institute, state, year, kingdom, phyllum, class, subclass, order_, genus, family_, species, submissiondate,picname,habit, datasetkey from "+temp+";";
            
            String destroy="drop table if exists "+temp+";"; 
            PreparedStatement ps1 = cn.prepareStatement(drop);
            PreparedStatement ps2 = cn.prepareStatement(update);
            PreparedStatement ps3 = cn.prepareStatement(destroy);
        
        ps1.execute();
        ps2.execute();
        ps3.execute();
        
         
       session.setAttribute("flow",null);
        
        }
      
      PreparedStatement ps = cn.prepareStatement(sql1);
      
      
      ResultSet r = ps.executeQuery();
      
      String basepath="../documents/";                          
    
     
   int flag=0;
    while(r.next())
     {
    
     String datasetkey= r.getString("datasetkey");
     String picname= r.getString("picname");
     String imgurl= basepath+datasetkey+"images/"+picname+".jpg";
     %>
     
         
       
      <tr>
     <td> <a target='_blank' href="javascript: show('<%=r.getString("id")%>');"> <%= r.getString("scientificname") %>  </a>  </td>
       
     <td> <%=imgurl%> </td> 
     
     <td> <img src="<%=imgurl%>" height="70" width="70"> </td>
     
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
         
     <td> <a target='_blank' > <%=(r.getString("habit")==null)?"-":r.getString("habit") %></a></td> 
     
      
      
      </tr>
       
       
     <%  flag=1;}

     if(flag==0){

      %><h1>No Result Found</h1><%
    }
     %>
    
     <script type="text/javascript">
            function show(b) 
            {  alert(b);
         document.location.href="../googlemap/googlemap.jsp?b="+b; //"&;
       
         } 
                  
                               
        </script>
</tr>
      
 </table>
        </div>
   
    
        
    </form>
      
    

      
 </table>
    
  
</body>
</html>