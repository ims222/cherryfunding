package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.UserSettingVo;

@Repository
public class UserSettingDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.UserSettingMapper.";

	public int insert(String id) {
		return sqlSession.insert(NAMESPACE + "insert", id);
	}
	public UserSettingVo getInfo(String id) {
		return sqlSession.selectOne(NAMESPACE + "getInfo", id);
	}
	public int update(UserSettingVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}
	
}
