package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VListVo;

public class VListDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VListMapper.";
	
	public int insert(VListVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
