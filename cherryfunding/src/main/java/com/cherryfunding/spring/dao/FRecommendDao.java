package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.FRecommendVo;

@Repository
public class FRecommendDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FRecommendMapper.";
 
	public int insert(FRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public FRecommendVo isRecomm(FRecommendVo vo) {
		return sqlSession.selectOne(NAMESPACE + "isRecomm", vo);
	}

	public int delete(FRecommendVo vo) {
		return sqlSession.delete(NAMESPACE + "delete", vo);
	}

	public int getRecommend(int fNum) {
		return sqlSession.selectOne(NAMESPACE + "getRecommend", fNum);
	}
}