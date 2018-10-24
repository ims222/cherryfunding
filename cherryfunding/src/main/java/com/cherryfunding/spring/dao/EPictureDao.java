package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.EPictureVo;

public class EPictureDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.EPictureMapper.";
	
	public int insert(EPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
