
<%@page import="java.sql.*"%>
<%@page import="nic.souvik.covidassistanceportal.controller.HospitalController"%>
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
  <h3 style="background-color:#f44336; color:white;">VIEW/EDIT BED INFO</h3><br>
  
  <a href="haddbedinfo.jsp">Add bed information</a><br>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
   <a style="background-color:#f44336; color:white;" href="hwelcome.jsp">PROFILE</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Bed details:</i></h3>
  <%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=1){
        		  response.sendRedirect("index.jsp");
        	  }
        	  	ResultSet rs=HospitalController.getbedinfobyid(Integer.parseInt((session.getAttribute("uid").toString())));
        	  	if(rs.next()==false){
        	  		out.println("No records found");
        	  	}else{
        	  		
        	  	out.println("<table border=2><tr> <td><b>Hospital ID</b></td> <td><b>BED Type ID</b></td> <td><b>Bed Type</b></td> <td><b>Total Bed</b></td> <td><b>Bed Occupied</b></td> <td><b>Bed Available</b></td> <td><b>Action</b></td> </tr>");
        	        do{
        	            out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td> <td><a href=\"hveditbedinfo1.jsp?hid="+rs.getString(1) +"&cid="+rs.getString(2) +"\">Edit</a></td> </tr>");
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
