package com.nestCor.nest.payment.model.service;

import java.util.Map;

import com.nestCor.nest.payment.model.vo.Payment;
import com.nestCor.nest.payment.model.vo.Service;


public interface PaymentService {
	
	Map<String,Service> selectServiceList();
	int insertBusinessPayment(int mNo);
	int insertPremiumPayment(int mNo);

}
