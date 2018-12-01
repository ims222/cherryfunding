package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.EHashtagVo;

public class EHashtagDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.EHashtagMapper.";
	 
	public int insert(EHashtagVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
