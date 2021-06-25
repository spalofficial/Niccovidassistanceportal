
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
  
  <a href="oaddproinfo.jsp">Add product information</a><br>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
   <a style="background-color:#f44336; color:white;" href="owelcome.jsp">PROFILE</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Product details:</i></h3>
  <%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=2){
        		  response.sendRedirect("index.jsp");
        	  }
        	  	ResultSet rs=OxygenSupplierController.getproductinfobyid(Integer.parseInt((session.getAttribute("uid").toString())));
        	  	if(rs.next()==false){
        	  		out.println("No records found");
        	  	}else{
        	  		
        	  	out.println("<table border=2><tr> <td><b>OS ID</b></td> <td><b>Product Type ID</b></td> <td><b>Product Type</b></td> <td><b>As on date</b></td><td><b>Rate</b></td> <td><b>Available Units</b></td> <td><b>Action</b></td> </tr>");
        	        do{
        	            out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td> <td>"+rs.getString(6)+"</td><td><a href=\"oveditproinfo1.jsp?oid="+rs.getString(1) +"&pid="+rs.getString(2) +"\">Edit</a></td> </tr>");
        	        }while(rs.next());
        	        out.println("</table>");
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
