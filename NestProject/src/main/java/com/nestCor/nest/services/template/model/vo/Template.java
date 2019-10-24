package com.nestCor.nest.services.template.model.vo;

import java.util.Date;

public class Template {
	
	private int tno;
	private int mno;
	private String ttitle;
	private String tcontent;
	private Date tdate;
	public Template() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Template(int tno, int mno, String ttitle, String tcontent, Date tdate) {
		super();
		this.tno = tno;
		this.mno = mno;
		this.ttitle = ttitle;
		this.tcontent = tcontent;
		this.tdate = tdate;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	@Override
	public String toString() {
		return "Template [tno=" + tno + ", mno=" + mno + ", ttitle=" + ttitle + ", tcontent=" + tcontent + ", tdate="
				+ tdate + "]";
	}
	
}
