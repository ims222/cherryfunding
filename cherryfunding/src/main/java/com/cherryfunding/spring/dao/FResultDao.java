package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.FResultVo;

public class FResultDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FResultMapper.";
	
	public int insert(FResultVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
