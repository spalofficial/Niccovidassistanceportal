<%@page import="nic.souvik.covidassistanceportal.model.Oxygensupplier"%>
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
  <h3 style="background-color:#f44336; color:white;">O2 SUPPLIER DETAILS</h3>
  <a href="oaddproinfo.jsp">Add product information</a><br>
  <a href="oveditproinfo.jsp">View and edit product information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Oxygen Supplier Profile:</i></h3>
  <% 

  response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("logflag")==null){
      response.sendRedirect("index.jsp");
  }else{
	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
	  if (i!=2){
		  response.sendRedirect("index.jsp");
	  }
	  if(session.getAttribute("osupdetail")==null){
	      response.sendRedirect("index.jsp");
	  }else{
  Oxygensupplier o1=new Oxygensupplier();
  o1=(Oxygensupplier)session.getAttribute("osupdetail");
  out.print("<p>Oname :"+o1.getoName()+"<br>"+"OAddress :"+o1.getoAddress()+"<br>"+"Contact Person: "+o1.getoContactName()+"<br>"+"Contact No: "+o1.getoContactNo()+"<br></p>");
	  }}
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
