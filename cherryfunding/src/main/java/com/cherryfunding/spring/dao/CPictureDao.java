package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CPictureVo;

public class CPictureDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CPictureMapper.";
	
	public int insert(CPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
