package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.SPictureVo;

public class SPictureDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SPictureMapper.";
	
	public int insert(SPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
