package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CDetailVo;

public class CDetailDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CDetailMapper.";
	
	public int insert(CDetailVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
