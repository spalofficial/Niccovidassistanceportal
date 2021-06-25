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
  <p><i><b>NOTE:</b> On successful registration, a message will be displayed below the form.</i></p>
  	<br><br><a href=login.jsp><i>Click here to login !</i></a>
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Welcome to Heath-care Registration Page, Fillup the form!</i></h3>
 <%
 if(request.getParameter("category")==null){
	 response.sendRedirect("/nic.souvik.covidassistanceportal/register.jsp");
 }
 else if(request.getParameter("category").equals("hosp")){

	 out.println("<p><form action=\"register\" method=\"post\"><table>" 
		   +"<tr><td>Registration Type:</td><td><input type=\"text\" name=\"rtype\" value=\"hosp\" readonly></td></tr>"
		   +"<tr><td>Password:*</td><td><input required type=\"password\" name=\"hpass\"></td></tr>"
  	  	   +"<tr><td>Hospital Name:*</td><td><input required type=\"text\" name=\"hname\"></td></tr>"
  		   +"<tr><td>Hospital Address:*</td><td><input required type=\"text\" name=\"haddress\"></td></tr>"
  	  	   +"<tr><td>Contact Person:*</td><td><input required type=\"text\" name=\"hcontactper\"></td></tr>"
     	   +"<tr><td>Contact Number:*</td><td><input required type=\"number\"name=\"hcontactno\"></td></tr></table>"
  		   +"<br><input type=\"submit\" value=\"Submit\">"
  	  	   +"</form><p>");
	 if(session.getAttribute("rflag")!=null){
		 String rflag=session.getAttribute("rflag").toString();
		 if(rflag.equals("1")){
		 int uid=(Integer)session.getAttribute("uid");
		 String pass=(String)session.getAttribute("pass");
		 out.println("<h3>Hospital Registration Successful ! Remember your HOSPITAL ID:"+uid+" and password: "+pass+". Click login to continue. </h3>");
		 }
		 else{
			 out.println("<h3>Hospital records found. No need to register again. Login to continue</h3>"); 	 
		 }
		 session.removeAttribute("rflag");

	 }
 }
 else if(request.getParameter("category").equals("osup")){
	 out.println("<p><form action=\"register\" method=\"post\"><table>" 
			   +"<tr><td>Registration Type:</td><td><input type=\"text\" name=\"rtype\" value=\"osup\" readonly></td></tr>"
			   +"<tr><td>Password:*</td><td><input required type=\"password\" name=\"opass\"></td></tr>"
	  	  	   +"<tr><td>Oxygen Supplier Name:*</td><td><input required type=\"text\" name=\"oname\"></td></tr>"
	  		   +"<tr><td>Oxygen Supplier Address:*</td><td><input required type=\"text\" name=\"oaddress\"></td></tr>"
	  	  	   +"<tr><td>Contact Person:*</td><td><input required type=\"text\" name=\"ocontactper\"></td></tr>"
	     	   +"<tr><td>Contact Number:*</td><td><input required type=\"number\" name=\"ocontactno\"></td></tr></table>"
	  		   +"<br><input type=\"submit\" value=\"Submit\">"
	  	  	   +"</form><p>");
		 if(session.getAttribute("rflag")!=null){
			 String rflag=session.getAttribute("rflag").toString();
			 if(rflag.equals("2")){
			 int uid=(Integer)session.getAttribute("uid");
			 String pass=(String)session.getAttribute("pass");
			 out.println("<h3>Oxygen Supplier Registration Successful ! Remember your Oxygen Supplier ID:"+uid+" and password: "+pass+". Click login to continue. </h3>");
			 }
			 else{
				 out.println("<h3>Oxygen Supplier records found. No need to register again. Login to continue</h3>"); 	 
			 }
			 session.removeAttribute("rflag");

		 }
	 
 }
 else if(request.getParameter("category").equals("ambu")){
	 out.println("<p><form action=\"register\" method=\"post\"><table>" 
			   +"<tr><td>Registration Type:</td><td><input type=\"text\" name=\"rtype\" value=\"ambu\" readonly></td></tr>"
			   +"<tr><td>Password:*</td><td><input required type=\"password\" name=\"apass\"></td></tr>"
	  	  	   +"<tr><td>Ambulance Agency Name:*</td><td><input required type=\"text\" name=\"aname\"></td></tr>"
	  		   +"<tr><td>Ambulance Agency Address:*</td><td><input required type=\"text\" name=\"aaddress\"></td></tr>"
	  	  	   +"<tr><td>Contact Person:*</td><td><input required type=\"text\" name=\"acontactper\"></td></tr>"
	     	   +"<tr><td>Contact Number:*</td><td><input required type=\"number\" name=\"acontactno\"></td></tr></table>"
	  		   +"<br><input type=\"submit\" value=\"Submit\">"
	  	  	   +"</form><p>");
		 if(session.getAttribute("rflag")!=null){
			 String rflag=session.getAttribute("rflag").toString();
			 if(rflag.equals("3")){
			 int uid=(Integer)session.getAttribute("uid");
			 String pass=(String)session.getAttribute("pass");
			 out.println("<h3>Ambulance Agency Registration Successful ! Remember your Agency ID:"+uid+" and password: "+pass+". Click login to continue. </h3>");
			 }
			 else{
				 out.println("<h3>Ambulance agency records found. No need to register again. Login to continue</h3>"); 	 
			 }
			 session.removeAttribute("rflag");

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
