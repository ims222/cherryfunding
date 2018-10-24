package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.VPictureVo;

public class VPictureDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VPictureMapper.";
	
	public int insert(VPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
