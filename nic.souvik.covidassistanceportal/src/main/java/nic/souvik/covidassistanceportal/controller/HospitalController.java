package nic.souvik.covidassistanceportal.controller;

import java.sql.*;
import nic.souvik.covidassistanceportal.Connections;
import nic.souvik.covidassistanceportal.model.Hospital;


public class HospitalController {
	
	//output all hospital details with bed informations for public view.
	public static ResultSet getHospitalInfo() throws ClassNotFoundException, SQLException {
	Connection con=Connections.connect();	
	Statement st=con.createStatement();
	String query="select hname,haddress, hcontactpername, hcontactno, cname, totalbed, bedocc, bedavail from hospital, covidbedinfo,covidbedtype  where hospital.hid=covidbedinfo.hid and covidbedinfo.cid=covidbedtype.cid;";
	return st.executeQuery(query);
	}
	//finds hospital details with given hospital id. returns hospital object or null if not found.
	public static Hospital findHospitalByID(int uid) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select * from hospital where hid="+uid;
		ResultSet rs=st.executeQuery(query);
		if(rs.next()==false) {
			return null;
		}else {
		Hospital h1=new Hospital();
		h1.sethId(rs.getInt(1));
		h1.sethPass(rs.getString(2));
		h1.sethName(rs.getString(3));
		h1.sethAddress(rs.getString(4));
		h1.sethContactName(rs.getString(5));
		h1.sethContactNo(rs.getString(6));
		return h1;
	}
}
	//register new hospital 
	public static int registerNewHospital(String pass,String name, String address, String contactper, String contactno) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="insert into hospital(hpass,hname,haddress,hcontactpername,hcontactno) values('"+pass+"','"+name+"','"+address+"','"+contactper+"','"+contactno+"')";
		int x=st.executeUpdate(query);
		return x;
		}
	//Checks if a hospital have entered the bed details already. If entered returns true.
	public static boolean checkbedentry(int uid, int cid) throws SQLException, ClassNotFoundException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select * from covidbedinfo where hid="+uid+" and cid="+cid;
		ResultSet rs=st.executeQuery(query);
		return rs.next();
	}
	//views all bed related to a particular hospital by entering hospital id.
	public static ResultSet getbedinfobyid(int uid) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select hid,c1.cid,cname,totalbed,bedocc,bedavail from covidbedinfo c1, covidbedtype c2  where c1.cid=c2.cid and c1.hid="+uid;
		return st.executeQuery(query);
	}
	//views specific bed related to a particular hospital by entering hospital id and bed type.
		public static ResultSet getbedinfobyidandbedid(int uid, int cid) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="select hid,c1.cid,cname,totalbed,bedocc,bedavail from covidbedinfo c1, covidbedtype c2  where c1.cid=c2.cid and c1.hid="+uid+" and c1.cid="+cid;
			return st.executeQuery(query);
		}
		// edit covid bed details by supplying hospital id and bed id
		public static int editbeddetails(int hid, int cid, int totalbed, int bedocc, int availbed) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="update covidbedinfo set totalbed="+totalbed+",bedocc="+bedocc+",bedavail="+availbed+" where hid="+hid+"and cid="+cid;
			int x=st.executeUpdate(query);
			return x;
		}
		// checks if hospital exists by entering hospital name and returns true if found.
		public static boolean findHospitalByName(String hname) throws ClassNotFoundException, SQLException {
	        	Connection con=Connections.connect();	
				Statement st=con.createStatement();
				String query="select * from hospital where hname='"+hname+"'";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()==false)
					return false;
				else
					return true;
		}
		//checks if hospital exists by entering hospital name and returns hospital id if found or returns 0. 
		public static int getHospitalidbyname(String hname) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="select * from hospital where hname='"+hname+"'";
			ResultSet rs=st.executeQuery(query);
			if(rs.next()==false)
				return 0;
			else
				return rs.getInt(1);
		}
		// adds bed details. 
		public static int addbeddetails(int hid, int cid, int totalbed, int bedocc, int bedavail) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="insert into covidbedinfo(hid,cid,totalbed,bedocc,bedavail) values("+hid+","+cid+","+totalbed+","+bedocc+","+bedavail+")";
			int x=st.executeUpdate(query);
			return x;
		}
}
