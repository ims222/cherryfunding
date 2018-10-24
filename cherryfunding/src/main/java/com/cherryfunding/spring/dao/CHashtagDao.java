package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CHashtagVo;

public class CHashtagDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CHashtagMapper.";
	
	public int insert(CHashtagVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
