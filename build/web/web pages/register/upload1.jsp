<%--
  Created by IntelliJ IDEA.
  User: vanji
  Date: 6/22/13
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*, java.lang.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<html>
<head>
    <title>File Processor</title>
</head>
<body>
    
    <%
                
        
        String url ="jdbc:postgresql://localhost:5432/postgres";
        String user = "postgres";
        String pwd= "hclfamily";
        

       
       Class.forName("org.postgresql.Driver");
Connection cn = DriverManager.getConnection(url, user , pwd);
String sql = "insert into userdata values(?,?,?,?,?,?,?,?)";

PreparedStatement ps = cn.prepareStatement(sql);

      //  HttpSession session1 = request.getSession(false);
        
        String array[]=(String[])session.getAttribute("array");
        
       
    for (int i=0; i<8; i++)
    {
       ps.setString(i+1, array[i] );
       
    }



ps.executeUpdate();
            
       
    %>
    
<%!
String random_() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
%>

<%
    String user1[] = (String[])session.getAttribute("array");
    
    String username = user1[3];
    
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   
    File new1 = new File("D:/NetBeansProjects/WebApplication1/web/web pages/documents/"+username); 
    
    if(!new1.exists()){ 
    new1.mkdirs(); 
    }
    
    File new2 = new File("D:/NetBeansProjects/WebApplication1/web/web pages/documents/"+username+"/userdoc"); 
    
    if(!new2.exists()){ 
    new2.mkdirs(); 
    }
    
    
   
   String filePath = "D:/NetBeansProjects/WebApplication1/web/web pages/documents/"+username+"/userdoc/";

   // Verify the content type
   String contentType = request.getContentType();
   
  
  String password=random_();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               
               String fileName = fi.getName();
              
              
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   }
   response.sendRedirect("userpass.jsp?username="+username+"&password="+password);
%>      
    
    
 
</body>
</html>