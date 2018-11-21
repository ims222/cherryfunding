package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.CDetailVo;

@Repository
public class CDetailDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CDetailMapper.";

	public int insert(CDetailVo vo) {
		System.out.println(vo.toString());
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public CDetailVo select(int cdNum) {
		return sqlSession.selectOne(NAMESPACE + "select", cdNum);
	}

}
