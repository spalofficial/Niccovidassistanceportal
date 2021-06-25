package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import nic.souvik.covidassistanceportal.controller.HospitalController;

@WebServlet("/hbedcheck")
public class Hbedcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int category=Integer.parseInt(request.getParameter("category"));
		HttpSession session=request.getSession();
		int uid=Integer.parseInt(session.getAttribute("uid").toString());
		try {
			if(HospitalController.checkbedentry(uid, category)) {
				session.setAttribute("bedflag", 1);
				response.sendRedirect("/nic.souvik.covidassistanceportal/haddbedinfo.jsp");
			}
			else
			{   session.setAttribute("addflag", 1);
				session.setAttribute("category", category);
				response.sendRedirect("/nic.souvik.covidassistanceportal/haddbedinfo1.jsp");
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
