package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.CharityVo;

@Repository
public class CharityDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CharityMapper.";
	public int insert(CharityVo vo) { 
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int update(CharityVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

	public CharityVo select(int num) {
		return sqlSession.selectOne(NAMESPACE + "select", num);
	}

	public List<CharityVo> list() {
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<CharityVo> prepare() { 
		return sqlSession.selectList(NAMESPACE + "prepare");
	}

	public List<CharityVo> end() { 
		return sqlSession.selectList(NAMESPACE + "end");
	}
	
	public List<CharityVo> ing() {
		return sqlSession.selectList(NAMESPACE + "ing");
	}
}