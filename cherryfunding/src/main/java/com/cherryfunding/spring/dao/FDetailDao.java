package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.FDetailVo;

public class FDetailDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FDetailMapper.";
	
	public int insert(FDetailVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}