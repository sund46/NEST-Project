package com.nestCor.nest.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SpaceMember implements Serializable {

	private static final long serialVersionUID = 1000L;
	
	private int sNo; 		// 시퀀스 번호
	private int spaceNo; 	// 스페이스 번호
	private int mNo;		// 회원 번호
	private String mRightSet; // 회원 접근 권한
	private Date enrolDate;	// 스페이스 가입일
	private String approvalStatus; // 승인보류 여부
	private int inviteNumber; // 초대 사용자 수
	private String adminStatus;	// 관리자 여부
	
	public SpaceMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SpaceMember(int sNo, int spaceNo, int mNo, String mRightSet, Date enrolDate, String approvalStatus,
			int inviteNumber, String adminStatus) {
		super();
		this.sNo = sNo;
		this.spaceNo = spaceNo;
		this.mNo = mNo;
		this.mRightSet = mRightSet;
		this.enrolDate = enrolDate;
		this.approvalStatus = approvalStatus;
		this.inviteNumber = inviteNumber;
		this.adminStatus = adminStatus;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmRightSet() {
		return mRightSet;
	}

	public void setmRightSet(String mRightSet) {
		this.mRightSet = mRightSet;
	}

	public Date getEnrolDate() {
		return enrolDate;
	}

	public void setEnrolDate(Date enrolDate) {
		this.enrolDate = enrolDate;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public int getInviteNumber() {
		return inviteNumber;
	}

	public void setInviteNumber(int inviteNumber) {
		this.inviteNumber = inviteNumber;
	}

	public String getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SpaceMember [sNo=" + sNo + ", spaceNo=" + spaceNo + ", mNo=" + mNo + ", mRightSet=" + mRightSet
				+ ", enrolDate=" + enrolDate + ", approvalStatus=" + approvalStatus + ", inviteNumber=" + inviteNumber
				+ ", adminStatus=" + adminStatus + "]";
	}
	
}
