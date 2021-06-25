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
  <h3 style="background-color:#f44336; color:white;">ADD BED DETAILS</h3>
  <br><br><a href="hveditbedinfo.jsp">View and edit bed information</a> 
   <br><br><a style="background-color:#f44336; color:white;" href="index.jsp">HOME</a>
   <a style="background-color:#f44336; color:white;" href="logout.jsp">LOGOUT</a>
  <a style="background-color:#f44336; color:white;" href="hwelcome.jsp">Profile</a>
  </div>
  <div class="column2" style="background-color:#fffeb3;"><h3><i>Add bed Details:</i></h3>
 
<%
          response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
          if(session.getAttribute("logflag")==null){
              response.sendRedirect("index.jsp");
          }else{
        	  int i=Integer.parseInt(session.getAttribute("logflag").toString());
        	  if (i!=1){
        		  response.sendRedirect("index.jsp");
        	  }
        	  //out.println(session.getAttribute("category"));
        	  //out.println(session.getAttribute("uid"));
        	  if(session.getAttribute("addflag")==null){
        		  response.sendRedirect("index.jsp");
        	  }
        	  int uid=Integer.parseInt(session.getAttribute("uid").toString());
        	  int category=Integer.parseInt(session.getAttribute("category").toString());
        	  String bedtype="";
        	  if(category==1)
        		  bedtype="normalcovidbed";
        	  else if(category==2)
        		  bedtype="covidbedwithoxy";
        	  else if(category==3)
        		  bedtype="covidbedwithvent";
        	  
        	  out.println("<p><form action=\"hbedadd\" method=\"post\"><table>" 
       			   +"<tr><td>H id:</td><td><input type=\"text\" name=\"uid\" value="+uid+" readonly></td></tr>"
       			   +"<tr><td>C id:</td><td><input required type=\"text\" name=\"cid\" value="+category+" readonly></td></tr>"
       	  	  	   +"<tr><td>Bed Type:</td><td><input required type=\"text\" name=\"bedtype\" value="+bedtype+" readonly></td></tr>"
       	  		   +"<tr><td>Total Bed:</td><td><input required type=\"number\" placeholder=\"numeric data only\" name=\"totalbed\"></td></tr>"
       	  	  	   +"<tr><td>Bed Occupied:</td><td><input required type=\"number\" placeholder=\"less than total bed\" name=\"bedocc\"></td></tr></table>"
       	     	   +"<br><input type=\"submit\" value=\"Submit\">"
       	  	  	   +"</form><p>");
			
         }
    %>
  </div>
</div>

<div class="footer" style="background-color:#141413;">
  <p style="color:white;">@Souvik.NIC</p>
</div>

</body>
</html>
