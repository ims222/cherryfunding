package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CRecommendVo;
import com.cherryfunding.spring.vo.EpilogueVo;

public class EpilogueDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.EpilogueMapper.";
	
	public int insert(EpilogueVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
