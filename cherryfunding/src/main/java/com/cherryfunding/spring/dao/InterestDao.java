package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.InterestVo;

public class InterestDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.InterestMapper.";
	
	public int insert(InterestVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
