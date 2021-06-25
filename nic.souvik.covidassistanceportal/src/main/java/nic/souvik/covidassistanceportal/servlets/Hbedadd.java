package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nic.souvik.covidassistanceportal.controller.HospitalController;


@WebServlet("/hbedadd")
public class Hbedadd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		int totalbed=Integer.parseInt(request.getParameter("totalbed"));
		int bedocc=Integer.parseInt(request.getParameter("bedocc"));
		int bedavail=totalbed-bedocc;
	    try {
			int x=HospitalController.addbeddetails(hid,cid,totalbed,bedocc,bedavail);
			if(x!=0) {
				response.sendRedirect("/nic.souvik.covidassistanceportal/hveditbedinfo.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
