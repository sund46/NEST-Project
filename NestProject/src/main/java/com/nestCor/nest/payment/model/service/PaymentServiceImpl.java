package com.nestCor.nest.payment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nestCor.nest.payment.model.dao.PaymentDao;
import com.nestCor.nest.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;

	@Override
	public Map<String, com.nestCor.nest.payment.model.vo.Service> selectServiceList() {
		
		return paymentDao.selectServiceList();
	}
	
	@Override
	public int insertPremiumPayment(int mNo) {
		
		return paymentDao.insertPremiumPayment(mNo);
	}

	@Override
	public int insertBusinessPayment(int mNo) {
		
		return paymentDao.insertBusinessPayment(mNo);
	}

}
