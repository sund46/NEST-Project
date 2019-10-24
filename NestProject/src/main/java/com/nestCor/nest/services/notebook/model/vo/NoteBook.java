package com.nestCor.nest.services.notebook.model.vo;

import java.io.Serializable;
import java.util.Date;

public class NoteBook implements Serializable{
	private static final long serialVersionUID = 3000L;
	
	private int nbno;
	private int mno;
	private String nbtitle;
	private String nbcontent;
	private String nbtype;
	private Date nbDate;
	
	public Date getNbDate() {
		return nbDate;
	}

	public void setNbDate(Date nbDate) {
		this.nbDate = nbDate;
	}

	public NoteBook() {}

	public NoteBook(int mno, String nbtitle, String nbcontent, String nbtype) {
		super();
		this.mno = mno;
		this.nbtitle = nbtitle;
		this.nbcontent = nbcontent;
		this.nbtype = nbtype;
	}

	public NoteBook(int nbno, int mno, String nbtitle, String nbcontent, String nbtype) {
		super();
		this.nbno = nbno;
		this.mno = mno;
		this.nbtitle = nbtitle;
		this.nbcontent = nbcontent;
		this.nbtype = nbtype;
	}
	
	public NoteBook(int mno) {this.mno = mno;}

	public int getNbno() {
		return nbno;
	}

	public void setNbno(int nbno) {
		this.nbno = nbno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getNbtitle() {
		return nbtitle;
	}

	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}

	public String getNbcontent() {
		return nbcontent;
	}

	public void setNbcontent(String nbcontent) {
		this.nbcontent = nbcontent;
	}

	public String getNbtype() {
		return nbtype;
	}

	public void setNbtype(String nbtype) {
		this.nbtype = nbtype;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "NoteBook [nbno=" + nbno + ", mno=" + mno + ", nbtitle=" + nbtitle + ", nbcontent=" + nbcontent
				+ ", nbtype=" + nbtype + "]";
	}
	
	
}
