package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.SRecommendVo;

@Repository
public class SRecommendDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SRecommendMapper.";

	public SRecommendVo isRecomm(SRecommendVo vo) {
		return sqlSession.selectOne(NAMESPACE + "isRecomm", vo);
	}

	public int insert(SRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public int delete(SRecommendVo vo) {
		return sqlSession.delete(NAMESPACE + "delete", vo);
	}
}
