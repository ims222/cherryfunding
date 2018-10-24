package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.SItemVo;

public class SItemDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SItemMapper.";
	
	public int insert(SItemVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
