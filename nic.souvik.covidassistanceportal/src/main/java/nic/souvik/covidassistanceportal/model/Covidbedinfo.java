package nic.souvik.covidassistanceportal.model;

public class Covidbedinfo {
	private int hid;
	private int cid;
	private int totalbed;
	private int bedocc;
	private int bedavail;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTotalbed() {
		return totalbed;
	}
	public void setTotalbed(int totalbed) {
		this.totalbed = totalbed;
	}
	public int getBedocc() {
		return bedocc;
	}
	public void setBedocc(int bedocc) {
		this.bedocc = bedocc;
	}
	public int getBedavail() {
		return bedavail;
	}
	public void setBedavail(int bedavail) {
		this.bedavail = bedavail;
	}

}
