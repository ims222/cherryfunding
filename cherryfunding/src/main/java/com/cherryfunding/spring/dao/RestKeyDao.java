package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RestKeyDao {

	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.RestKeyMapper.";

	public String getKeyValue(String keyName) {
		return sqlSession.selectOne(NAMESPACE + "getKeyValue", keyName);
	}
}
