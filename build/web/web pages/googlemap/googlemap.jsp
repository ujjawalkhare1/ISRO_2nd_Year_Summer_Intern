<!DOCTYPE html>
<%@page import = "java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.opencsv.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*" %>
<html>
    <head><title> Map </title>
    <style>
      /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
  </head>
  <body>
    <h3><%=request.getParameter("b")%></h3>
    <!--The div element for the map -->
    <div id="map"></div>
    
    <%
//String id = request.getParameter("userId");
String url = "jdbc:postgresql://localhost:5432/postgres";
String user = "postgres";
String pass = "hclfamily";
String b = request.getParameter("b");
String b1= "'"+b+"'";

float latitude=0.0f;
float longitude =0.0f;



try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
PreparedStatement ps = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>No</b></td>
<td><b>Name</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(url,user,pass);
String sql ="SELECT * FROM test where b ="+b1;
ps=connection.prepareStatement(sql);


resultSet = ps.executeQuery();

while(resultSet.next())
{
    latitude=Float.parseFloat(resultSet.getString("d"));
    longitude=Float.parseFloat(resultSet.getString("e"));
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<%-- Initialize and add the map--%>

<script>
function initMap() {
  // The location of place
  var coordinates = {lat: <%=latitude%>, lng: <%=longitude%>};
  // The map, centered at place
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: coordinates});
  // The marker, positioned at place
  var marker = new google.maps.Marker({position: coordinates, map: map});
}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVGr1GsbPevKwyaV4xqO5bN1LjAYpZ1R4&callback=initMap">
    </script>
  </body>
</html>