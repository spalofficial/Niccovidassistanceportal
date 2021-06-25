package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nic.souvik.covidassistanceportal.controller.OxygenSupplierController;

@WebServlet("/oprodedit")
public class Oprodedit extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid=Integer.parseInt(request.getParameter("oid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		String asondate=request.getParameter("asondate");
		int rate=Integer.parseInt(request.getParameter("rate"));
		int availunit=Integer.parseInt(request.getParameter("availunit"));
		int x=0;
		try {
			x = OxygenSupplierController.editproductdetails(oid,pid,asondate,rate,availunit);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (x==1) {
			response.sendRedirect("/nic.souvik.covidassistanceportal/oveditproinfo.jsp");
		}
		else {
			response.sendRedirect("/nic.souvik.covidassistanceportal/oveditproinfo1.jsp");
		}
		}

}
