package com.nestCor.nest.payment.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.payment.model.vo.Payment;
import com.nestCor.nest.payment.model.vo.Service;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Map<String, Service> selectServiceList() {
//		System.out.println(sqlSession.selectList("payment.selectServiceList"));
		
		List list = new ArrayList();
		list = sqlSession.selectList("payment.selectServiceList");
		
		Map<String,Service> map = new HashMap<>();
		
		map.put("basic", (Service)list.get(0));
		map.put("premium", (Service)list.get(1));
		map.put("business", (Service)list.get(2));

		
		return map;
	}

	@Override
	public int insertPremiumPayment(int mNo) {
		return sqlSession.insert("payment.insertPremiumPayment", mNo);
	}

	@Override
	public int insertBusinessPayment(int mNo) {
		return sqlSession.insert("payment.insertBusinessPayment", mNo);
	}


}
