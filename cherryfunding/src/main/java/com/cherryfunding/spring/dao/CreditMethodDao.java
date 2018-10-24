package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CreditMethodVo;

public class CreditMethodDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CreditMethodMapper.";
	
	public int insert(CreditMethodVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
