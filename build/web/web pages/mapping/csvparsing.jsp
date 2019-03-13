<%-- 
    Document   : csv
    Created on : May 29, 2018, 10:00:00 AM
    Author     : trainee2018089, Nitish Jaiswal
--%>



<%@page import = "java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.opencsv.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSV Parsing</title>
    </head>
    <body>
        <h1>CSV file parsed, mapped and written into database!</h1>
        <br>
        
        <%!
            String random_() {
        String SALTCHARS = "qwertyuiopasdfghjklzxcvbnm";
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
            String filename=(String)session.getAttribute("filename");
    String csvFilename = "D:\\NetBeansProjects\\WebApplication1\\web\\CSV-INF\\"+filename;                                   
  
    
    //object to give row length
    CSVReader csvReader1 = new CSVReader(new FileReader(csvFilename));
    //object to read file
    CSVReader csvReader = new CSVReader(new FileReader(csvFilename));
    //array to read row length 
    String[] row = null;
    //array to read and store csv file data
    String[] row1 = null;
    
   String temp = random_();
  
   
            String url = "jdbc:postgresql://localhost:5432/postgres";
            String user = "postgres";
            String pass = "hclfamily";
            String sql = "insert into "+temp+" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
            String create="CREATE TABLE "+temp+" (scientificname text, author text, institute text, state text, year text, kingdom text, phyllum text, class text, subclass text, order_ text, genus text, family_ text, species text, submissiondate text, picname text,  habit text, datasetkey text, id serial not null primary key);";                                                                  
            session.setAttribute("temp",temp);
            
            int len =0;
            int[] arr1 = new int[16];
            int[] arr2 = new int[16];
            int count1=0;
            int i=0;
            String datasetkey= session.getAttribute("username").toString()+"/"+session.getAttribute("timestamp").toString()+"/" ;
            
              String[] std= (String[])session.getAttribute("standard");
            
            
            Class.forName("org.postgresql.Driver");
            Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement st = conn.prepareStatement(sql);
            PreparedStatement st1 = conn.prepareStatement(create);
            st1.execute();
            
            
            
            //Determining the length of one row
            while((row1 = csvReader1.readNext()) != null)
            {
        len=row1.length;%><p> Row length =<%=len%></p><%break;
            }

            try
    {
        //reading csv file, mapping the elements and passing it to 
label:
            while((row = csvReader.readNext()) != null)
        {
            
              for(String var: row)
              {
                  if(var.equals(std[0]))
                  { 
                      for(i=0; i<16; i++)
                          {
                              
                               for(int j=0 ; j<len; j++)
                                   {
                                       if(std[i].equals(row[j]))
                                           {
                                               arr1[i]= i;
                                               arr2[count1]=j;
                                               count1++;
                                               break;
                                           }
                                       else
                                           {
                                                arr1[i]= -1;
                                           }
                                    }
                          } 
                      
                         continue label;
                 }
             }
              int count=0;
              for(int k=0;k<16;k++)
              {
                  if(arr1[k]==-1)
                  {
                      st.setString(k+1, null);
                  }
                  else
                  {
                      st.setString(k+1, row[arr2[count++]]);
                  }
              }

              st.setString(17, datasetkey);
            
             st.executeUpdate();

        }
    }

            catch(Exception ex)
    {
        ex.getMessage();
    }

            finally
    {
        csvReader.close();
        conn.close();
        st.close();
        response.sendRedirect("../editdata/editdata.jsp");
    }
     
            
            %>
            
    </body>
</html>
