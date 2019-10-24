package com.nestCor.nest.business.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BusinessMember implements Serializable {

	private static final long serialVersionUID = 1000L;
	private int bizmNo;
	private int bizNo;
	private int mNo;
	private String admin;
	private String invitation;
	private String approval;
	private Date enrolldate;
	private String active;
	
	public BusinessMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BusinessMember(int bizmNo, int bizNo, int mNo, String admin, String invitation, String approval,
			Date enrolldate, String active) {
		super();
		this.bizmNo = bizmNo;
		this.bizNo = bizNo;
		this.mNo = mNo;
		this.admin = admin;
		this.invitation = invitation;
		this.approval = approval;
		this.enrolldate = enrolldate;
		this.active = active;
	}

	public int getBizmNo() {
		return bizmNo;
	}

	public void setBizmNo(int bizmNo) {
		this.bizmNo = bizmNo;
	}

	public int getBizNo() {
		return bizNo;
	}

	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getInvitation() {
		return invitation;
	}

	public void setInvitation(String invitation) {
		this.invitation = invitation;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BusinessMember [bizmNo=" + bizmNo + ", bizNo=" + bizNo + ", mNo=" + mNo + ", admin=" + admin
				+ ", invitation=" + invitation + ", approval=" + approval + ", enrolldate=" + enrolldate + ", active="
				+ active + "]";
	}
	
	

}
