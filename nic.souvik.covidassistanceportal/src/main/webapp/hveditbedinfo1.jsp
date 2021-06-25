
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
  <br><a href="hveditbedinfo.jsp">View and edit bed information</a> 
  <br><a href="haddbedinfo.jsp">Add bed information</a><br>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
   <a style="background-color:#f44336; color:white;" href="hwelcome.jsp">PROFILE</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Edit Bed details:</i></h3>

  <%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=1){
        		  response.sendRedirect("index.jsp");
        	  } 
        	  	ResultSet rs=HospitalController.getbedinfobyidandbedid(Integer.parseInt((session.getAttribute("uid").toString())),Integer.parseInt(request.getParameter("cid")));
        	  	if(rs.next()==false){
        	  		out.println("No records found");
        	  	}else{
        	  		out.println("<form action=\"hbededit\" method=\"post\"><table>" 
        	  	   +"<tr><td>Hospital Id:</td><td><input type=\"text\" name=\"hid\" value="+rs.getInt(1)+" readonly></td></tr>"
        	  	   +"<tr><td>Covid bed Id:</td><td><input type=\"text\" name=\"cid\" value="+rs.getInt(2)+" readonly></td></tr>"
        		   +"<tr><td>Covid Bed Type:</td><td><input type=\"text\" name=\"cname\" value="+rs.getString(3)+" readonly></td></tr>"
        	  	   +"<tr><td>Total Bed:</td><td><input type=\"number\" placeholder=\"numeric data only\" name=\"totalbed\" value="+rs.getInt(4)+"></td></tr>"
  	     		   +"<tr><td>Occupied Bed:</td><td><input type=\"number\" placeholder=\"less than total bed\" name=\"bedocc\" value="+rs.getInt(5)+"></td></tr></table>"
        		   +"<br><input type=\"submit\" value=\"Submit\">"
        	  	   +"</form>");
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
