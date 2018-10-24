package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.SRecommendVo;

public class SRecommendDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SRecommendMapper.";
	
	public int insert(SRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
