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
  <h3 style="background-color:#f44336; color:white;">REGISTRATION</h3>
  <form action="register1.jsp" method="get">
   <label for="category">Choose an organization category:</label>
    <select name="category" id="category">
     <option value="hosp">Hospital</option>
     <option value="osup">Oxygen Supplier</option>
     <option value="ambu">Ambulance</option>
  	</select><br>
  	<br><input type="submit" value="Select">
  </form>
  
  	<br><br><a href=login.jsp><i>Click here login!</i></a>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Welcome to Heath-care login Page, Select organization category to login!</i></h3>
 
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
