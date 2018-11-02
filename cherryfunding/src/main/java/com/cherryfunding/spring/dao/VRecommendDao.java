package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VRecommendVo;

@Repository
public class VRecommendDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VRecommendMapper.";

	public VRecommendVo isRecomm(VRecommendVo vo) {
		return sqlSession.selectOne(NAMESPACE + "isRecomm", vo);
	}

	public int insert(VRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public int delete(VRecommendVo vo) {
		return sqlSession.delete(NAMESPACE + "delete", vo);
	}
}
