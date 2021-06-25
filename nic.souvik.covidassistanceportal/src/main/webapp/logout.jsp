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
  <h2>NOTICE BOARD</h2>
  <a href="hinfo.jsp">Hospital Information</a><br><br>
  <a href="osinfo.jsp">Oxygen Supplier Information</a><br><br>
  <a href="aspinfo.jsp">Ambulance Service Provider Information</a><br><br><br>
  <a style="background-color:#f44336; color:white;" href="login.jsp">LOGIN/ SIGN UP</a>
  <a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
  
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Log out Page!</i></h3>
  <%
  session.removeAttribute("uid");
  session.removeAttribute("logflag");
  session.removeAttribute("hospdetail");
  session.removeAttribute("ambudetail");
  session.removeAttribute("osupdetail");
  session.invalidate();
  response.sendRedirect("index.jsp");
  %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
