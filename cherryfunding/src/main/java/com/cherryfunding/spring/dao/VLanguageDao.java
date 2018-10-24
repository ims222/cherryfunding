package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VLanguageVo;

public class VLanguageDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VLanguageMapper.";
	
	public int insert(VLanguageVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
