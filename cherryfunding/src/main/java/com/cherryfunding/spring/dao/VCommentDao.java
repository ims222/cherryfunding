package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VCommentVo;

public class VCommentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VCommentMapper.";
	
	public int insert(VCommentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
