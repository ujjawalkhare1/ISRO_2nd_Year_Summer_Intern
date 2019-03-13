<%-- 
    Document   : Dropdown_Interface_mapping1
    Created on : May 30, 2018, 12:30:11 PM
    Author     : trainee2018088
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.lang.* "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
       
        
        <%
String[] Order= new String[16];
String[] std1 = new String[]{"scientificname", "author", "institute","state","year", "kingdom", "phyllum", "class", "subclass", "order_", "genus", "family_", "species", "submissiondate", "picname", "habit"};
String st=null;

for (int i=0;i<16;i++)
    
{
    st=request.getParameter(std1[i]);
    if(st.equals("none"))
    {
        Order[i]= std1[i];
    }
    else
    {
        Order[i] = st;
    }
}
int flag=0;
label:

for(int k=0; k<16; k++)
{
    for(int j=0; j<16; j++)
    {
        if(Order[k].equals(Order[j]) && k!=j)
        {
            
           flag=1;
          
         response.sendRedirect("../error.jsp?address=mapping");
         break label;
   
        }
        
        
    }
}


if(flag==0)
{
            HttpSession session1=request.getSession(true);
            session1.setAttribute("standard",Order);
           
            response.sendRedirect("csvparsing.jsp");
            }



        %>
    </body>
</html>
