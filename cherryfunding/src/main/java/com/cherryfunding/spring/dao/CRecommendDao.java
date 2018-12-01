package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.CRecommendVo;

@Repository
public class CRecommendDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.cRecommendMapper.";
 
	public int insert(CRecommendVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public CRecommendVo isRecomm(CRecommendVo vo) {
		return sqlSession.selectOne(NAMESPACE + "isRecomm", vo);
	}

	public int delete(CRecommendVo vo) {
		return sqlSession.delete(NAMESPACE + "delete", vo);
	}

	public int getRecommend(int cNum) {
		return sqlSession.selectOne(NAMESPACE + "getRecommend", cNum);
	}
}
