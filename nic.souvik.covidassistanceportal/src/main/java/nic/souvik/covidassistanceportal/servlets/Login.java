package nic.souvik.covidassistanceportal.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import nic.souvik.covidassistanceportal.controller.AmbulanceController;
import nic.souvik.covidassistanceportal.controller.HospitalController;
import nic.souvik.covidassistanceportal.controller.OxygenSupplierController;
import nic.souvik.covidassistanceportal.model.Ambulance;
import nic.souvik.covidassistanceportal.model.Hospital;
import nic.souvik.covidassistanceportal.model.Oxygensupplier;
@WebServlet("/login")
public class Login extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String pass=request.getParameter("pass");
		String category=request.getParameter("category");
		
		HttpSession session=request.getSession();
		if(category.equals("hosp")) {
			try {
				Hospital h1= HospitalController.findHospitalByID(uid);
				if (h1 == null) {
					session.setAttribute("flag",0);
				}else {
					if(h1.gethPass().equals(pass)) {
						session.setAttribute("logflag", 1);
						session.setAttribute("uid", h1.gethId());
						session.setAttribute("hospdetail", h1);
						response.sendRedirect("/nic.souvik.covidassistanceportal/hwelcome.jsp");
					}else {
						session.setAttribute("flag",1);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/login.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(category.equals("osup")) {
			try {
				Oxygensupplier o1= OxygenSupplierController.findOxygenSupplierByID(uid);
				if (o1 == null) {
					session.setAttribute("flag",0);
				}else {
					if(o1.getoPass().equals(pass)) {
						session.setAttribute("logflag", 2);
						session.setAttribute("uid", o1.getoId());
						session.setAttribute("osupdetail", o1);
						response.sendRedirect("/nic.souvik.covidassistanceportal/owelcome.jsp");
					}else {
						session.setAttribute("flag",1);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/login.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}		
		}else if(category.equals("ambu")){
			try {
				Ambulance a1= AmbulanceController.findAmbulanceByID(uid);
				if (a1 == null) {
					session.setAttribute("flag",0);
				}else {
					if(a1.getaPass().equals(pass)) {
						session.setAttribute("logflag", 3);
						session.setAttribute("uid", a1.getaId());
						session.setAttribute("ambudetail", a1);
						response.sendRedirect("/nic.souvik.covidassistanceportal/awelcome.jsp");
					}else {
						session.setAttribute("flag",1);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/login.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

}
