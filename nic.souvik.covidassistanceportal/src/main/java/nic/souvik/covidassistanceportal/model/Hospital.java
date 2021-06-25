package nic.souvik.covidassistanceportal.model;

public class Hospital {
	private int hId;
	private String hPass;
	private String hName;
	private String hAddress;
	private String hContactName;
	private String hContactNo;
	public int gethId() {
		return hId;
	}
	public void sethId(int hId) {
		this.hId = hId;
	}
	public String gethPass() {
		return hPass;
	}
	public void sethPass(String hPass) {
		this.hPass = hPass;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public String gethContactName() {
		return hContactName;
	}
	public void sethContactName(String hContactName) {
		this.hContactName = hContactName;
	}
	public String gethContactNo() {
		return hContactNo;
	}
	public void sethContactNo(String hContactNo) {
		this.hContactNo = hContactNo;
	}
}