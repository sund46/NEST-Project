package com.nestCor.nest.payment.model.dao;

import java.util.List;
import java.util.Map;

import com.nestCor.nest.payment.model.vo.Payment;
import com.nestCor.nest.payment.model.vo.Service;

public interface PaymentDao {
	
	Map<String,Service> selectServiceList();
	int insertBusinessPayment(int mNo);
	int insertPremiumPayment(int mNo);

}
