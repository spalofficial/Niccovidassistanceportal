<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=1){
        		  response.sendRedirect("index.jsp");
        	  }
          }
    %>    
<title>NICcovidassistanceportal</title>
<link rel="stylesheet" href="souviknic.css">
</head>
<body>
<%
  
  %>
<div class="header" style="background-color:#3b3b34;">
  <h1 style="background-color:white;">Covid Assistance Portal</h1>
</div>

<div class="row">
  <div class="column1" style="background-color:#68f292;">
  <h3 style="background-color:#f44336; color:white;">ADD BED DETAILS</h3>
  <form action="hbedcheck" method="post">
   <label for="category">Choose type of bed:</label>
    <select name="category" id="category">
     <option value="1">Normal Covid Bed</option>
     <option value="2">Covid Bed with Oxygen</option>
     <option value="3">Covid Bed with Ventilation</option>
  	</select><br>
  	<br><input type="submit" value="Select">
  </form>
  <br><br><a href="hveditbedinfo.jsp">View and edit bed information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  <a style="background-color:#f44336; color:white;" href="hwelcome.jsp">Profile</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Add bed Details:</i></h3>
 <%
  if(session.getAttribute("bedflag")!=null){
  out.print("Bed details already exits");	  
  session.removeAttribute("bedflag");
  }
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
