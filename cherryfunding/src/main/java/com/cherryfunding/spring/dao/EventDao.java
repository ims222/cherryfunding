package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.EventVo;

public class EventDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.EventMapper.";
	 
	public int insert(EventVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

}
