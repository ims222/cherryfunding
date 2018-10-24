package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.PaymentVo;

public class PaymentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.PaymentMapper.";
	
	public int insert(PaymentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
