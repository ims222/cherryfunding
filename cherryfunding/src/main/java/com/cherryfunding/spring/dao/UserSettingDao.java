package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.UsersSettingVo;

public class UserSettingDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.UserSettingMapper.";
	
	public int insert(UsersSettingVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
