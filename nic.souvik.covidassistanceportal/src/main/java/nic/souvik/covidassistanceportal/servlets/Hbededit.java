package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nic.souvik.covidassistanceportal.controller.HospitalController;

/**
 * Servlet implementation class Hbededit
 */
@WebServlet("/hbededit")
public class Hbededit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int hid=Integer.parseInt(request.getParameter("hid"));
	int cid=Integer.parseInt(request.getParameter("cid"));
	int totalbed=Integer.parseInt(request.getParameter("totalbed"));
	int bedocc=Integer.parseInt(request.getParameter("bedocc"));
	int availbed=totalbed-bedocc;
	int x=0;
	try {
		x = HospitalController.editbeddetails(hid,cid,totalbed,bedocc,availbed);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (x==1) {
		response.sendRedirect("/nic.souvik.covidassistanceportal/hveditbedinfo.jsp");
	}
	else {
		response.sendRedirect("/nic.souvik.covidassistanceportal/hveditbedinfo1.jsp");
	}
	}

}
