package com.sinoway.sinowayCrawer.entity;

public class ToShow {
	private String jd;
	private String wd;
	private String dd;
	
	
	public ToShow(String jd, String wd, String dd) {
		super();
		this.jd = jd;
		this.wd = wd;
		this.dd = dd;
	}
	public String getJd() {
		return jd;
	}
	public void setJd(String jd) {
		this.jd = jd;
	}
	public String getWd() {
		return wd;
	}
	public void setWd(String wd) {
		this.wd = wd;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	
	
}
