
package nic.souvik.covidassistanceportal.controller;

import java.sql.*;
import nic.souvik.covidassistanceportal.Connections;
import nic.souvik.covidassistanceportal.model.Ambulance;

public class AmbulanceController {
	
	//output all Ambulance details for public view.
	public static ResultSet getAmbulanceInfo() throws ClassNotFoundException, SQLException {
	Connection con=Connections.connect();	
	Statement st=con.createStatement();
	String query="select aname,aaddress,acontactpername,acontactno from ambulance;";
	return st.executeQuery(query);
	}
	//finds ambulance details with given ambulance id. returns ambulance object or null if not found.
	public static Ambulance findAmbulanceByID(int uid) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select * from ambulance where aid="+uid;
		ResultSet rs=st.executeQuery(query);
		if(rs.next()==false) {
			return null;
		}else {
		Ambulance a1=new Ambulance();
		a1.setaId(rs.getInt(1));
		a1.setaPass(rs.getString(2));
		a1.setaName(rs.getString(3));
		a1.setaAddress(rs.getString(4));
		a1.setaContactName(rs.getString(5));
		a1.setaContactNo(rs.getString(6));
		return a1;
	}
}
	//register new ambulance 
	public static int registerNewAmbulance(String pass,String name, String address, String contactper, String contactno) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="insert into ambulance(apass,aname,aaddress,acontactpername,acontactno) values('"+pass+"','"+name+"','"+address+"','"+contactper+"','"+contactno+"')";
		int x=st.executeUpdate(query);
		return x;
		}
	//checks if ambulance agency exists by entering ambulance name and returns ambulance id if found or returns 0. 
			public static int getAmbulanceidbyname(String aname) throws ClassNotFoundException, SQLException {
				Connection con=Connections.connect();	
				Statement st=con.createStatement();
				String query="select * from ambulance where aname='"+aname+"'";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()==false)
					return 0;
				else
					return rs.getInt(1);
			}
			// checks if ambulance agency exists by entering agency name and returns true if found.
			public static boolean findAmbulanceByName(String aname) throws ClassNotFoundException, SQLException {
				Connection con=Connections.connect();	
				Statement st=con.createStatement();
				String query="select * from ambulance where aname='"+aname+"'";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()==false)
					return false;
				else
					return true;
			}
}