<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="nic.souvik.covidassistanceportal.controller.AmbulanceController"%>
<%@ page session="false" %>
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
  <h2>NOTICE BOARD</h2>
  <a href="hinfo.jsp">Hospital Information</a><br><br>
  <a href="osinfo.jsp">Oxygen Supplier Information</a><br><br>
  <a href="aspinfo.jsp">Ambulance Service Provider Information</a><br><br><br>
   <a style="background-color:#f44336; color:white;" href="login.jsp">LOGIN/ SIGN UP</a>
   <a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
  
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Ambulance Agency list with  contact information.</i></h3>
  <%
  	int count=0;
  	ResultSet rs=AmbulanceController.getAmbulanceInfo();
  	out.println("<table border=2><tr> <td><b>Sr No.</b></td> <td><b>Ambulance Agency Name</b></td> <td><b>Agency Address</b></td> <td><b>Contact Person</b></td> <td><b>Contact Number</b></td> </tr>");
        while(rs.next()){
        	count++;
            out.println("<tr><td>"+ count +"</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
        }
        out.println("</table>");
  %>
  
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
