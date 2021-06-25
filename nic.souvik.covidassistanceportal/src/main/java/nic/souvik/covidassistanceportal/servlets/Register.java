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
import nic.souvik.covidassistanceportal.controller.OxygenSupplierController;
import nic.souvik.covidassistanceportal.controller.AmbulanceController;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rtype=request.getParameter("rtype").toString();
		HttpSession session=request.getSession();
		if(rtype.equals("hosp")) {
			String hpass=request.getParameter("hpass").toString();
			String hname=request.getParameter("hname").toString();
			String haddress=request.getParameter("haddress").toString();
			String hcontactper=request.getParameter("hcontactper").toString();
			String hcontactno=request.getParameter("hcontactno").toString();
			try {
				if(HospitalController.findHospitalByName(hname)==true) {
				
					session.setAttribute("rflag", 0);
				}
				else {
					int x= HospitalController.registerNewHospital(hpass, hname, haddress, hcontactper, hcontactno);
					if (x!=0) {
				    int uid=HospitalController.getHospitalidbyname(hname);
					session.setAttribute("rflag", 1);
					session.setAttribute("uid", uid);
					session.setAttribute("pass", hpass);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/register1.jsp?category=hosp");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}else if(rtype.equals("osup")) {
			String opass=request.getParameter("opass").toString();
			String oname=request.getParameter("oname").toString();
			String oaddress=request.getParameter("oaddress").toString();
			String ocontactper=request.getParameter("ocontactper").toString();
			String ocontactno=request.getParameter("ocontactno").toString();
			try {
				if(OxygenSupplierController.findOxygenSupplierByName(oname)==true) {
				
					session.setAttribute("rflag", 0);
				}
				else {
					int x= OxygenSupplierController.registerNewOxygenSupplier(opass, oname, oaddress, ocontactper, ocontactno);
					if (x!=0) {
				    int uid=OxygenSupplierController.getOxygensupplieridbyname(oname);
					session.setAttribute("rflag", 2);
					session.setAttribute("uid", uid);
					session.setAttribute("pass", opass);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/register1.jsp?category=osup");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
		}else if(rtype.equals("ambu")) {
			String apass=request.getParameter("apass").toString();
			String aname=request.getParameter("aname").toString();
			String aaddress=request.getParameter("aaddress").toString();
			String acontactper=request.getParameter("acontactper").toString();
			String acontactno=request.getParameter("acontactno").toString();
			try {
				if(AmbulanceController.findAmbulanceByName(aname)==true) {
				
					session.setAttribute("rflag", 0);
				}
				else {
					int x= AmbulanceController.registerNewAmbulance(apass, aname, aaddress, acontactper, acontactno);
					if (x!=0) {
				    int uid=AmbulanceController.getAmbulanceidbyname(aname);
					session.setAttribute("rflag", 3);
					session.setAttribute("uid", uid);
					session.setAttribute("pass", apass);
					}
				}
				response.sendRedirect("/nic.souvik.covidassistanceportal/register1.jsp?category=ambu");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
