package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CCommentVo;

public class CCommentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CCommentMapper.";
	
	public int insert(CCommentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
