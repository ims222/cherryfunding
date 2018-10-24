package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.UsersVo;

@Repository
public class UsersDao {
	@Autowired
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.UsersMapper.";
	
	public int insert(UsersVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	
	public UsersVo login(UsersVo vo) {
		return sqlSession.selectOne(NAMESPACE + "login", vo);
	}
	public List<UsersVo> list(){
		return sqlSession.selectList(NAMESPACE + "list");
	}
}