package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VRecommendVo;

public class VRecommendDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VRecommendMapper.";
	
	public int insert(VRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
