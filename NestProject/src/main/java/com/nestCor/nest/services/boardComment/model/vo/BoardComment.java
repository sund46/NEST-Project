package com.nestCor.nest.services.boardComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardComment implements Serializable{
	private static final long serialVersionUID = 2001L;
	
	private int cno;
	private int mno;
	private int bno;
	private String ccontent;
	private int clevel;
	private int likecount;
	private String bcdate;
	private String bcdelete;
	private String bcnickname;
	
	
	public BoardComment() {
		super();
	}

	

	public BoardComment(int bno) {
		super();
		this.bno = bno;
	}



	public BoardComment(int cno, int mno, int bno, String ccontent, int clevel, int likecount, String bcdate,
			String bcdelete, String bcnickname) {
		super();
		this.cno = cno;
		this.mno = mno;
		this.bno = bno;
		this.ccontent = ccontent;
		this.clevel = clevel;
		this.likecount = likecount;
		this.bcdate = bcdate;
		this.bcdelete = bcdelete;
		this.bcnickname = bcnickname;
	}

	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getCcontent() {
		return ccontent;
	}


	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}


	public int getClevel() {
		return clevel;
	}


	public void setClevel(int clevel) {
		this.clevel = clevel;
	}


	public int getLikecount() {
		return likecount;
	}


	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}


	public String getBcdate() {
		return bcdate;
	}


	public void setBcdate(String bcdate) {
		this.bcdate = bcdate;
	}


	public String getBcdelete() {
		return bcdelete;
	}


	public void setBcdelete(String bcdelete) {
		this.bcdelete = bcdelete;
	}


	
	public String getBcnickname() {
		return bcnickname;
	}



	public void setBcnickname(String bcnickname) {
		this.bcnickname = bcnickname;
	}



	@Override
	public String toString() {
		return "BoardComment [cno=" + cno + ", mno=" + mno + ", bno=" + bno + ", ccontent=" + ccontent + ", clevel="
				+ clevel + ", likecount=" + likecount + ", bcdate=" + bcdate + ", bcdelete=" + bcdelete
				+ ", bcnickname=" + bcnickname + "]";
	}



	

	

}



