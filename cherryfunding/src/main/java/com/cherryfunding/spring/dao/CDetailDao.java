package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

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
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public CDetailVo select(int cdNum) {
		return sqlSession.selectOne(NAMESPACE + "select", cdNum);
	}
	
	public List<HashMap<String, Object>> listBycNum(int cNum) {
		return sqlSession.selectList(NAMESPACE + "listBycNum", cNum);
	}

	public int countCdetailbycNum(int cNum) {
		return sqlSession.selectOne(NAMESPACE + "countCdetailbycNum", cNum);
	}

}
