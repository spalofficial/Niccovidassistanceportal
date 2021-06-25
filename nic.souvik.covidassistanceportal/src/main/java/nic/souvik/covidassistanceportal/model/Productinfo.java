package nic.souvik.covidassistanceportal.model;

public class Productinfo {
	private int oid;
	private int pid;
	private String asondate;
	private int rate;
	private int availunit;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getAsondate() {
		return asondate;
	}
	public void setAsondate(String asondate) {
		this.asondate = asondate;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getAvailunit() {
		return availunit;
	}
	public void setAvailunit(int availunit) {
		this.availunit = availunit;
	}
}
