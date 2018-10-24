package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CRecommendVo;

public class CRecommend {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CRecommendMapper.";
	
	public int insert(CRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
