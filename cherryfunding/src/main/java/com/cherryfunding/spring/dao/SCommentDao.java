package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.SCommentVo;

public class SCommentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SCommentMapper.";
	
	public int insert(SCommentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	
}
