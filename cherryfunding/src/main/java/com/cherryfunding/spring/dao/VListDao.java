package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VListVo;
import com.cherryfunding.spring.vo.VRecommendVo;

@Repository
public class VListDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VListMapper.";
	
	public VListVo isApply(VListVo vo) {
		return sqlSession.selectOne(NAMESPACE + "isApply", vo);
	}

	public int insert(VListVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public int delete(VListVo vo) {
		return sqlSession.delete(NAMESPACE + "delete", vo);
	}
}
