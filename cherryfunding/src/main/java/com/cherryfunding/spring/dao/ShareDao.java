package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.ShareVo;

@Repository
public class ShareDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.ShareMapper.";
 
	public int insert(ShareVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<HashMap<String, Object>> list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "list", map);
	}

	public ShareVo detail(int sNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", sNum);
	}

	public int getTotCount() {
		return sqlSession.selectOne(NAMESPACE + "getTotCount");
	}
}
