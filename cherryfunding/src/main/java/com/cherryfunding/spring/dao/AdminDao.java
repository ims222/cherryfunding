package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.AdminVo;


public class AdminDao {
	@Autowired
	SqlSession sqlSession;
 
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.AdminMapper.";
	
	public int insert(AdminVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
