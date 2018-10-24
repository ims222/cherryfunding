package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CharityVo;

public class CharityDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CharityMapper.";
	
	public int insert(CharityVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
