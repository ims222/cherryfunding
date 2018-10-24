package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.SListVo;

public class SListDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SListMapper.";
	
	public int insert(SListVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
