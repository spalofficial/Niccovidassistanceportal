package nic.souvik.covidassistanceportal;
import java.sql.*;
public class Connections {
	public static Connection connect() throws ClassNotFoundException, SQLException {
	Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://localhost:5432/nicscovid";
	String uname="souvik";
	String passwd="nicsouvik21";
    return DriverManager.getConnection(url,uname,passwd);
	}
}
