<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>    
<title>NICcovidassistanceportal</title>
<link rel="stylesheet" href="souviknic.css">
</head>
<body>
<div class="header" style="background-color:#3b3b34;">
  <h1 style="background-color:white;">Covid Assistance Portal</h1>
</div>

<div class="row">
  <div class="column1" style="background-color:#68f292;">
  <h3 style="background-color:#f44336; color:white;">ADD PRODUCT DETAILS</h3>
  <br><br><a href="oveditproinfo.jsp">View and edit Product information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  <a style="background-color:#f44336; color:white;" href="owelcome.jsp">Profile</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Add Product Details:</i></h3>
 
<%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=2){
        		  response.sendRedirect("index.jsp");
        	  }
        	  //out.println(session.getAttribute("category"));
        	  //out.println(session.getAttribute("uid"));
        	  if(session.getAttribute("addflag")==null){
        		  response.sendRedirect("index.jsp");
        	  }
        	  int uid=Integer.parseInt(session.getAttribute("uid").toString());
        	  int category=Integer.parseInt(session.getAttribute("category").toString());
        	  String prodtype="";
        	  if(category==1)
        		  prodtype="industrialoxy";
        	  else if(category==2)
        		  prodtype="medicaloxy";
        	  java.text.DateFormat d = new java.text.SimpleDateFormat("dd/MM/yyyy");
        	  String asondate= d.format(new java.util.Date());
        	  out.println("<p><form action=\"oprodadd\" method=\"post\"><table>" 
       			   +"<tr><td>O id:</td><td><input type=\"text\" name=\"uid\" value="+uid+" readonly></td></tr>"
       			   +"<tr><td>P id:</td><td><input required type=\"text\" name=\"pid\" value="+category+" readonly></td></tr>"
       	  	  	   +"<tr><td>As on Date:</td><td><input readonly type=\"text\" name=\"asondate\" value="+asondate+"></td></tr>"
       	  		   +"<tr><td>Rate:</td><td><input required type=\"number\" placeholder=\"numeric data only per unit\" name=\"rate\"></td></tr>"
       	  	  	   +"<tr><td>Available Units:</td><td><input required type=\"number\" placeholder=\"numeric data only\" name=\"availunit\"></td></tr></table>"
       	     	   +"<br><input type=\"submit\" value=\"Submit\">"
       	  	  	   +"</form><p>");
			
         }
    %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
