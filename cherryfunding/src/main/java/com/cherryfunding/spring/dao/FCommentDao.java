package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.FCommentVo;

public class FCommentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FCommentMapper.";
	
	public int insert(FCommentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
