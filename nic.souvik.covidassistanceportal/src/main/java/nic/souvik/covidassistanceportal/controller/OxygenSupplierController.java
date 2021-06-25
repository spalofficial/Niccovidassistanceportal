package nic.souvik.covidassistanceportal.controller;

import java.sql.*;
import nic.souvik.covidassistanceportal.Connections;
import nic.souvik.covidassistanceportal.model.Oxygensupplier;

public class OxygenSupplierController {
	
	//output all oxygen supplier details with product information for public view.
	public static ResultSet getOxygenSupplierInfo() throws ClassNotFoundException, SQLException {
	Connection con=Connections.connect();	
	Statement st=con.createStatement();
	String query="select oname,oaddress, ocontactpername, ocontactno, pname, asondate, rate, availunit from oxygensupplier, productinfo,producttype  where oxygensupplier.oid=productinfo.oid and productinfo.pid=producttype.pid;";
	return st.executeQuery(query);
	}
	//finds oxygen supplier details with given oxygen supplier id. returns oxygen supplier object or null if not found.
	public static Oxygensupplier findOxygenSupplierByID(int uid) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select * from oxygensupplier where oid="+uid;
		ResultSet rs=st.executeQuery(query);
		if(rs.next()==false) {
			return null;
		}else {
		Oxygensupplier o1=new Oxygensupplier();
		o1.setoId(rs.getInt(1));
		o1.setoPass(rs.getString(2));
		o1.setoName(rs.getString(3));
		o1.setoAddress(rs.getString(4));
		o1.setoContactName(rs.getString(5));
		o1.setoContactNo(rs.getString(6));
		return o1;
	}
}
	//register new oxygen supplier 
	public static int registerNewOxygenSupplier(String pass,String name, String address, String contactper, String contactno) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="insert into oxygensupplier(opass,oname,oaddress,ocontactpername,ocontactno) values('"+pass+"','"+name+"','"+address+"','"+contactper+"','"+contactno+"')";
		int x=st.executeUpdate(query);
		return x;
		}
	//Checks if a oxygen supplier have entered product details already. If entered returns true.
	public static boolean checkproductentry(int uid, int pid) throws SQLException, ClassNotFoundException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select * from productinfo where oid="+uid+" and pid="+pid;
		ResultSet rs=st.executeQuery(query);
		return rs.next();
	}
	//views all product related to a particular oxygen supplier by entering oxygen supplier id.
	public static ResultSet getproductinfobyid(int uid) throws ClassNotFoundException, SQLException {
		Connection con=Connections.connect();	
		Statement st=con.createStatement();
		String query="select oid, p1.pid, pname, asondate, rate, availunit from productinfo p1, producttype p2  where p1.pid=p2.pid and p1.oid="+uid;
		return st.executeQuery(query);
	}
	//views specific product related to a particular oxygen supplier by entering oxygen supplier id and product type.
		public static ResultSet getproductinfobyidandproductid(int uid, int pid) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="select oid, p1.pid, pname, asondate, rate, availunit from productinfo p1, producttype p2  where p1.pid=p2.pid and p1.oid="+uid+" and p1.pid="+pid;
			return st.executeQuery(query);
		}
		// edit product details by supplying oxygen supplier id and product id
		public static int editproductdetails(int oid, int pid, String asondate, int rate, int availunit) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="update productinfo set asondate='"+asondate+"',rate="+rate+",availunit="+availunit+" where oid="+oid+"and pid="+pid;
			int x=st.executeUpdate(query);
			return x;
		}
		// checks if oxygen supplier exists by entering oxygen supplier name and returns true if found.
		public static boolean findOxygenSupplierByName(String oname) throws ClassNotFoundException, SQLException {
	        	Connection con=Connections.connect();	
				Statement st=con.createStatement();
				String query="select * from oxygensupplier where oname='"+oname+"'";
				ResultSet rs=st.executeQuery(query);
				if(rs.next()==false)
					return false;
				else
					return true;
		}
		//checks if oxygen supplier exists by entering oxygen supplier name and returns oxygen supplier id if found or returns 0. 
		public static int getOxygensupplieridbyname(String oname) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="select * from oxygensupplier where oname='"+oname+"'";
			ResultSet rs=st.executeQuery(query);
			if(rs.next()==false)
				return 0;
			else
				return rs.getInt(1);
		}
		// adds product details. 
		public static int addproductdetails(int oid, int pid, String asondate, int rate, int availunit) throws ClassNotFoundException, SQLException {
			Connection con=Connections.connect();	
			Statement st=con.createStatement();
			String query="insert into productinfo(oid,pid,asondate,rate,availunit) values("+oid+","+pid+",'"+asondate+"',"+rate+","+availunit+")";
			int x=st.executeUpdate(query);
			return x;
		}
}
