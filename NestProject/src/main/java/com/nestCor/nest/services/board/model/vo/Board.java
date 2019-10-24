package com.nestCor.nest.services.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable{
	private static final long serialVersionUID = 2001L;
	
	private int bno;
	private String cate1_code;
	private String cate2_code;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bdate;
	private int bcount;
	private String bdelete;
	private int commentcnt;
	
	
	public Board() {
		super();
	}
	
	
	
	public Board(String cate1_code, String cate2_code) {
		super();
		this.cate1_code = cate1_code;
		this.cate2_code = cate2_code;
	}

	public Board(int bno, String cate1_code, String cate2_code, String btitle, String bcontent, String bwriter,
			Date bdate, int bcount, String bdelete, int commentcnt) {
		super();
		this.bno = bno;
		this.cate1_code = cate1_code;
		this.cate2_code = cate2_code;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bdate = bdate;
		this.bcount = bcount;
		this.bdelete = bdelete;
		this.commentcnt = commentcnt;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public String getCate1_code() {
		return cate1_code;
	}



	public void setCate1_code(String cate1_code) {
		this.cate1_code = cate1_code;
	}



	public String getCate2_code() {
		return cate2_code;
	}



	public void setCate2_code(String cate2_code) {
		this.cate2_code = cate2_code;
	}



	public String getBtitle() {
		return btitle;
	}



	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}



	public String getBcontent() {
		return bcontent;
	}



	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}



	public String getBwriter() {
		return bwriter;
	}



	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}



	public Date getBdate() {
		return bdate;
	}



	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}



	public int getBcount() {
		return bcount;
	}



	public void setBcount(int bcount) {
		this.bcount = bcount;
	}



	public String getBdelete() {
		return bdelete;
	}



	public void setBdelete(String bdelete) {
		this.bdelete = bdelete;
	}

	
	
	public int getCommentcnt() {
		return commentcnt;
	}



	public void setCommentcnt(int commentcnt) {
		this.commentcnt = commentcnt;
	}



	@Override
	public String toString() {
		return "Board [bno=" + bno + ", cate1_code=" + cate1_code + ", cate2_code=" + cate2_code + ", btitle=" + btitle
				+ ", bcontent=" + bcontent + ", bwriter=" + bwriter + ", bdate=" + bdate + ", bcount=" + bcount
				+ ", bdelete=" + bdelete + ", commentcnt=" + commentcnt + "]";
	}
	
	
	
}



