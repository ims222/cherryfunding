package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.ECommentVo;

public class ECommentDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.ECommentMapper.";
	 
	public int insert(ECommentVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
