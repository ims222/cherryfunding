package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.ShareVo;

public class ShareDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.ShareMapper.";
	
	public int insert(ShareVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
