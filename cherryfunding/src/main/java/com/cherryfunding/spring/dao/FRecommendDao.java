package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.FRecommendVo;

public class FRecommendDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FRecommendMapper.";
	public int insert(FRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
