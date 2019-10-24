package com.nestCor.nest.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Member implements Serializable{

		private static final long serialVersionUID = 1000L;
		private int mNo;
		private int serviceNo;
		private int bizNo;
		private String userId;
		private String password;
		private String userName;
		private String nickName;
		private String ageGroup;
		private String purpose;
		private String jobField;
		private String alive;
		private String valid;
		private String phone;
		private Date expir_Date;
		private Date enrollDate;
		
		private String admin;
		private String invitation;
		private String approval;
		private Date spaceEnrollDate;
		private String mRightSet;
		public Member() {
		
		}

		

	



		public Member(int mNo, int serviceNo, String userId, String password, String userName, String nickName,
				String ageGroup, String purpose, String jobField, String alive, String valid, String phone,
				Date expir_Date, Date enrollDate) {
			super();
			this.mNo = mNo;
			this.serviceNo = serviceNo;
			this.userId = userId;
			this.password = password;
			this.userName = userName;
			this.nickName = nickName;
			this.ageGroup = ageGroup;
			this.purpose = purpose;
			this.jobField = jobField;
			this.alive = alive;
			this.valid = valid;
			this.phone = phone;
			this.expir_Date = expir_Date;
			this.enrollDate = enrollDate;
		}







		public int getmNo() {
			return mNo;
		}

		public void setmNo(int mNo) {
			this.mNo = mNo;
		}

		public int getServiceNo() {
			return serviceNo;
		}

		public void setServiceNo(int serviceNo) {
			this.serviceNo = serviceNo;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getNickName() {
			return nickName;
		}

		public void setNickName(String nickName) {
			this.nickName = nickName;
		}

		public String getAgeGroup() {
			return ageGroup;
		}

		public void setAgeGroup(String ageGroup) {
			this.ageGroup = ageGroup;
		}

		public String getPurpose() {
			return purpose;
		}

		public void setPurpose(String purpose) {
			this.purpose = purpose;
		}

		public String getJobField() {
			return jobField;
		}

		public void setJobField(String jobField) {
			this.jobField = jobField;
		}

		public String getAlive() {
			return alive;
		}

		public void setAlive(String alive) {
			this.alive = alive;
		}

		public String getValid() {
			return valid;
		}

		public void setValid(String valid) {
			this.valid = valid;
		}

		public Date getExpir_Date() {
			return expir_Date;
		}

		public void setExpir_Date(Date expir_Date) {
			this.expir_Date = expir_Date;
		}

		public Date getEnrollDate() {
			return enrollDate;
		}

		public void setEnrollDate(Date enrollDate) {
			this.enrollDate = enrollDate;
		}







		public String getPhone() {
			return phone;
		}







		public void setPhone(String phone) {
			this.phone = phone;
		}

	

		public int getBizNo() {
			return bizNo;
		}


		public void setBizNo(int bizNo) {
			this.bizNo = bizNo;
		}







		public String getAdmin() {
			return admin;
		}







		public void setAdmin(String admin) {
			this.admin = admin;
		}







		public String getApproval() {
			return approval;
		}







		public void setApproval(String approval) {
			this.approval = approval;
		}







		public Date getSpaceEnrollDate() {
			return spaceEnrollDate;
		}







		public void setSpaceEnrollDate(Date spaceEnrollDate) {
			this.spaceEnrollDate = spaceEnrollDate;
		}

		public String getmRightSet() {
			return mRightSet;
		}


		public void setmRightSet(String mRightSet) {
			this.mRightSet = mRightSet;
		}

		public String getInvitation() {
			return invitation;
		}


		public void setInvitation(String invitation) {
			this.invitation = invitation;
		}


		@Override
		public String toString() {
			return "Member [mNo=" + mNo + ", serviceNo=" + serviceNo + ", bizNo=" + bizNo + ", userId=" + userId
					+ ", password=" + password + ", userName=" + userName + ", nickName=" + nickName + ", ageGroup="
					+ ageGroup + ", purpose=" + purpose + ", jobField=" + jobField + ", alive=" + alive + ", valid="
					+ valid + ", phone=" + phone + ", expir_Date=" + expir_Date + ", enrollDate=" + enrollDate
					+ ", admin=" + admin + ", approval=" + approval + ", spaceEnrollDate=" + spaceEnrollDate + "]";
		}


		

		
		
		
	
	
	
}
