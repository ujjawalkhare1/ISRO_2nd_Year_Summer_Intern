package org.apache.jsp.web_0020pages.home;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.lang.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

public final class uploadcsv1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>uploadcsv1.jsp</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("  \n");
      out.write("\n");

    
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
   
  

      out.write("      \n");
      out.write("    \n");
      out.write("    \n");
      out.write(" \n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
