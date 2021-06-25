<%@page import="nic.souvik.covidassistanceportal.model.Hospital"%>
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
  <h3 style="background-color:#f44336; color:white;">HOSPITAL DETAILS</h3>
  <a href="haddbedinfo.jsp">Add bed information</a><br>
  <a href="hveditbedinfo.jsp">View and edit bed information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Hospital Profile:</i></h3>
  <% 

  response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("logflag")==null){
      response.sendRedirect("index.jsp");
  }else{
	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
	  if (i!=1){
		  response.sendRedirect("index.jsp");
	  }
	  if(session.getAttribute("hospdetail")==null){
	      response.sendRedirect("index.jsp");
	  }else{
  Hospital h1=new Hospital();
  h1=(Hospital)session.getAttribute("hospdetail");
  out.print("<p>Hname :"+h1.gethName()+"<br>"+"HAddress :"+h1.gethAddress()+"<br>"+"Contact Person: "+h1.gethContactName()+"<br>"+"Contact No: "+h1.gethContactNo()+"<br></p>");
	  }}
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
