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
        	  if (i!=2){
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
  <h3 style="background-color:#f44336; color:white;">ADD PRODUCT DETAILS</h3>
  <form action="oprodcheck" method="post">
   <label for="category">Choose type of bed:</label>
    <select name="category" id="category">
     <option value="1">Industrial Oxygen</option>
     <option value="2">Medical Oxygen</option>
  	</select><br>
  	<br><input type="submit" value="Select">
  </form>
  <br><br><a href="oveditproinfo.jsp">View and edit Product information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  <a style="background-color:#f44336; color:white;" href="owelcome.jsp">Profile</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Add Product Details:</i></h3>
 <%
  if(session.getAttribute("prodflag")!=null){
  out.print("Product details already exits");	  
  session.removeAttribute("prodflag");
  }
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
