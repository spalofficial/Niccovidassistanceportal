<%@page import="nic.souvik.covidassistanceportal.model.Ambulance"%>
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
  <h3 style="background-color:#f44336; color:white;"> AGENCY DETAILS</h3>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Ambulance Agency Profile:</i></h3>
  <% 

  response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("logflag")==null){
      response.sendRedirect("index.jsp");
  }else{
	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
	  if (i!=3){
		  response.sendRedirect("index.jsp");
	  }
	  if(session.getAttribute("ambudetail")==null){
	      response.sendRedirect("index.jsp");
	  }else{
  Ambulance a1=new Ambulance();
  a1=(Ambulance)session.getAttribute("ambudetail");
  out.print("<p>Aname :"+a1.getaName()+"<br>"+"Aaddress :"+a1.getaAddress()+"<br>"+"Contact Person: "+a1.getaContactName()+"<br>"+"Contact No: "+a1.getaContactNo()+"<br></p>");
	  }}
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
