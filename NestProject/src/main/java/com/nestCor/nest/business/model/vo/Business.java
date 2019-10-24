package com.nestCor.nest.business.model.vo;

import java.io.Serializable;

public class Business implements Serializable {

	private static final long serialVersionUID = 1000L;
	private int bizNo;
	private String bizName;
	private int maximumMember;
	
	public Business() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Business(int bizNo, String bizName, int maximumMember) {
		super();
		this.bizNo = bizNo;
		this.bizName = bizName;
		this.maximumMember = maximumMember;
	}

	public int getBizNo() {
		return bizNo;
	}

	public void setBizNo(int bizNo) {
		this.bizNo = bizNo;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public int getMaximumMember() {
		return maximumMember;
	}

	public void setMaximumMember(int maximumMember) {
		this.maximumMember = maximumMember;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Business [bizNo=" + bizNo + ", bizName=" + bizName + ", maximumMember=" + maximumMember + "]";
	}
	

}
