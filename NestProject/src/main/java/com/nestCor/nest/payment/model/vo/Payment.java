package com.nestCor.nest.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable {

	private static final long serialVersionUID = 1000L;

	private int pNo;
	private int mNo;
	private int serviceNo;
	private int price;
	private Date payDate;

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Payment(int pNo, int mNo, int serviceNo, int price, Date payDate) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.serviceNo = serviceNo;
		this.price = price;
		this.payDate = payDate;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Payment [pNo=" + pNo + ", mNo=" + mNo + ", serviceNo=" + serviceNo + ", price=" + price + ", payDate="
				+ payDate + "]";
	}

}
