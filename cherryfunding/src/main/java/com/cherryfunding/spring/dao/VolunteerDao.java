package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VolunteerVo;

public class VolunteerDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VolunteerMapper.";
	public int insert(VolunteerVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
