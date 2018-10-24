package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.ERecommendVo;

public class ERecommendDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.ERecommendMapper.";
	
	public int insert(ERecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
