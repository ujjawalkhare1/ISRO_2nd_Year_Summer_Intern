<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.opencsv.*"%>
<%@page import = "java.io.*" %>
<!DOCTYPE html>
<html>

<body>
    

 <form method="post" action="mapping1.jsp">
     
     
     <%
         HttpSession session1= request.getSession(false);
          String username=(String)session1.getAttribute("username");
          String filename=(String)session1.getAttribute("filename");
          String timestamp=(String)session1.getAttribute("timestamp");
         String csvFilename = "D:\\NetBeansProjects\\WebApplication1\\web\\web pages\\documents\\"+username+"\\"+timestamp+"\\"+filename;                              
         CSVReader csvReader = new CSVReader(new FileReader(csvFilename));
         CSVReader csvReader1 = new CSVReader(new FileReader(csvFilename));
         String[] row = null;
         String[] row1 = null;
         int len=0;
         
         // Change standards according to IIRS data core
         String[] std = new String[]{"scientificname", "author", "institute","state","year", "kingdom", "phyllum", "class", "subclass", "order_", "genus", "family_", "species", "submissiondate", "picname", "habit"};
         while((row1 = csvReader1.readNext()) != null)
            {
        len=row1.length;
            }
      
         
                    
         
         
         while((row = csvReader.readNext()) != null)
            {
                              
             
                break;
                
            }

%>
</select>
<br>
<br>
<br>               
<%

        for(int j=0;j<16;j++)
         {
           %><tr> <td> <%=std[j]%> </td> </tr><%
           %><select name=<%=std[j]%>>
             <option value="none">None</option><%  
                 
                 for( int k=0;k<len;k++)
                {
                    %><option value=<%=row[k]%>><%=row[k]%></option><%
                }

                %>
</select>
<br>
<br>
<br>               
        <%
                 
         }
     
        %>

<input type="Submit" value="Submit">
</form>

</body>
</html>
