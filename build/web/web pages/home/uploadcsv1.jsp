<%--
  Created by IntelliJ IDEA.
  User: vanji
  Date: 6/22/13
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipInputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*, java.lang.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<html>
<head>
    <title>uploadcsv1.jsp</title>
</head>
<body>
    
  

<%
    
    String username = session.getAttribute("username").toString();
    
   File file,file1 ;
   int maxFileSize = 10000 * 1024;
   int maxMemSize = 10000 * 1024;
   String fileName=null;
   String filePath = "D:/NetBeansProjects/WebApplication1/web/web pages/documents/";
   
    String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());   
    File new1 = new File(filePath+username+"/"+timeStamp); 
    
    if(!new1.exists()) {
    new1.mkdirs(); 
    }
    session.setAttribute("timestamp", timeStamp);
    
    File new2 =new File(filePath+username+"/"+timeStamp+"/images");
    
    if(!new2.exists())
    {
        new2.mkdirs();
        
    }
    
   String filePath1 = filePath+username+"/"+timeStamp+"/";
   String filePath2 = filePath+username+"/"+timeStamp+"/images/";
   
   String zipfilename =null;
   String csvfilename=null;
                                        

   // Verify the content type
   String contentType = request.getContentType();
   
 out.println(contentType);
   
    
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
               
               fileName = fi.getName();
              
               if(fileName.substring(fileName.lastIndexOf(".")).equals(".csv"))
               {
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath1 + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
                  file = new File( filePath1 + 
                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               csvfilename = fileName.substring(fileName.lastIndexOf("\\")+1);
               
            }
               else if(fileName.substring(fileName.lastIndexOf(".")).equals(".zip"))
               {
                   if( fileName.lastIndexOf("\\") >= 0 ) {
                       file1 = new File( filePath2 + fileName.substring( fileName.lastIndexOf("\\")+1)) ;
                       
                    } 
                    else {
                       file1 = new File( filePath2 + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                       
                    }
                    fi.write( file1 ) ;
                    zipfilename = fileName.substring(fileName.lastIndexOf("\\")+1);
               }
               else
               {
                   response.sendRedirect("../error.jsp?address=home");
               }
            }
         }
         HttpSession session1=request.getSession(true);
         session1.setAttribute("filename", csvfilename);
         
        
             String zipFile = filePath2+zipfilename;
        String outputFolder = filePath2;
      
        byte[] buffer = new byte[2048];
     	
    	
    	ZipInputStream zis = new ZipInputStream(new FileInputStream(zipFile));	
    	
    	ZipEntry ze = zis.getNextEntry();
    	while(ze!=null){
    	   String fileName1 = ze.getName();
           File newFile = new File(outputFolder+ fileName1);
          
            new File(newFile.getParent()).mkdirs();
            FileOutputStream fos = new FileOutputStream(newFile);
            int len;
            while ((len = zis.read(buffer)) > 0) {
       		fos.write(buffer, 0, len);
            }
            fos.close();
          
            ze = zis.getNextEntry();
            
        
    	}
         zis.closeEntry();
    	zis.close();
        
        
         response.sendRedirect("../mapping/mapping.jsp");
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   
  
%>      
    
    
 
