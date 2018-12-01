package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.AlarmVo;

public class AlarmDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.AlarmMapper.";
 
	public int insert(AlarmVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

}
