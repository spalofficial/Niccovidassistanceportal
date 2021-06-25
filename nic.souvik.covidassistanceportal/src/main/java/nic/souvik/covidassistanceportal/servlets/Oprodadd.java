package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nic.souvik.covidassistanceportal.controller.OxygenSupplierController;


@WebServlet("/oprodadd")
public class Oprodadd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		String asondate=request.getParameter("asondate");
		int rate=Integer.parseInt(request.getParameter("rate"));
		int availunit=Integer.parseInt(request.getParameter("availunit"));
	    try {
			int x=OxygenSupplierController.addproductdetails(hid,pid,asondate,rate,availunit);
			if(x!=0) {
				response.sendRedirect("/nic.souvik.covidassistanceportal/oveditproinfo.jsp");
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
