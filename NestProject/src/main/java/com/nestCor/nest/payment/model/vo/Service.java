package com.nestCor.nest.payment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Service implements Serializable {
	
	private static final long serialVersionUID = 1000L;
	
	private int serviceNo;
	private String serviceName;
	private int price;
	
	public Service() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Service(int serviceNo, String serviceName, int price) {
		super();
		this.serviceNo = serviceNo;
		this.serviceName = serviceName;
		this.price = price;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Service [serviceNo=" + serviceNo + ", serviceName=" + serviceName + ", price=" + price + "]";
	}
	
}
