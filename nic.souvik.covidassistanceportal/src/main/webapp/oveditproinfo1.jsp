
<%@page import="java.sql.*"%>
<%@page import="nic.souvik.covidassistanceportal.controller.OxygenSupplierController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>   
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
  <h3 style="background-color:#f44336; color:white;">VIEW/EDIT PRODUCT INFO</h3><br>
  <br><a href="oveditproinfo.jsp">View and edit product information</a> 
  <br><a href="oaddproinfo.jsp">Add product information</a><br>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
   <a style="background-color:#f44336; color:white;" href="owelcome.jsp">PROFILE</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Edit Product details:</i></h3>
  <%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=2){
        		  response.sendRedirect("index.jsp");
        	  } 
        	  	ResultSet rs=OxygenSupplierController.getproductinfobyidandproductid(Integer.parseInt((session.getAttribute("uid").toString())),Integer.parseInt(request.getParameter("pid")));
        	  	if(rs.next()==false){
        	  		out.println("No records found");
        	  	}else{
              	  java.text.DateFormat d = new java.text.SimpleDateFormat("dd/MM/yyyy");
              	  String asondate= d.format(new java.util.Date());
        	  		out.println("<p><form action=\"oprodedit\" method=\"post\"><table>" 
        	  	   +"<tr><td>Oxygen Supplier Id:</td><td><input type=\"text\" name=\"oid\" value="+rs.getInt(1)+" readonly></td></tr>"
        	  	   +"<tr><td>Product Id:</td><td><input type=\"text\" name=\"pid\" value="+rs.getInt(2)+" readonly></td></tr>"
        		   +"<tr><td>Product Name:</td><td><input type=\"text\" name=\"pname\" value="+rs.getString(3)+" readonly></td></tr>"
        	  	   +"<tr><td>As on Date:</td><td><input readonly type=\"text\" name=\"asondate\" value="+asondate+"></td></tr>"
  	     		   +"<tr><td>Rate:</td><td><input type=\"number\" name=\"rate\" value="+rs.getInt(5)+"></td></tr>"
  	     		   +"<tr><td>Available Units:</td><td><input type=\"number\" name=\"availunit\" value="+rs.getInt(6)+"></td></tr></table>"
  	     		   +"<br><input type=\"submit\" value=\"Submit\">"
        	  	   +"</form><p>");
        	  	}
          }
    %> 
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
