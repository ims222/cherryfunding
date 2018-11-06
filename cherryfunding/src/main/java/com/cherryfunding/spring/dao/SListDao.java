package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.SListVo;

@Repository
public class SListDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SListMapper.";

	public int insert(SListVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<HashMap<String, Object>> listBysNum(int sNum) {
		return sqlSession.selectList(NAMESPACE + "listBysNum", sNum);
	}

	public List<HashMap<String, Object>> isConfirm(int sNum) {
		return sqlSession.selectList(NAMESPACE + "isConfirm", sNum);
	}

	public int confirm(int slNum) {
		return sqlSession.update(NAMESPACE + "confirm", slNum);
	}

	public SListVo detail(int slNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", slNum);
	}

}
