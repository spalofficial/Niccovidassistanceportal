package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import nic.souvik.covidassistanceportal.controller.OxygenSupplierController;


@WebServlet("/oprodcheck")
public class Oprodcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int category=Integer.parseInt(request.getParameter("category"));
		HttpSession session=request.getSession();
		int uid=Integer.parseInt(session.getAttribute("uid").toString());
		try {
			if(OxygenSupplierController.checkproductentry(uid, category)) {
				session.setAttribute("prodflag", 1);
				response.sendRedirect("/nic.souvik.covidassistanceportal/oaddproinfo.jsp");
			}
			else
			{   session.setAttribute("addflag", 1);
				session.setAttribute("category", category);
				response.sendRedirect("/nic.souvik.covidassistanceportal/oaddproinfo1.jsp");
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
