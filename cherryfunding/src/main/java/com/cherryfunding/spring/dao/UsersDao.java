package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.UsersVo;

@Repository
public class UsersDao {
	@Autowired
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.cherryfunding.spring.mybatis.UsersMapper.";

	public int insert(UsersVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public UsersVo login(UsersVo vo) {
		return sqlSession.selectOne(NAMESPACE + "login", vo);
	}

	public List<UsersVo> list() {
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public UsersVo detail(String id) {
		return sqlSession.selectOne(NAMESPACE + "detail", id);
	}

	public int update(UsersVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}

	public int delete(HashMap<String, String> map) {
		return sqlSession.delete(NAMESPACE + "delete", map);
	}

	public UsersVo userlogin(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE + "userlogin", map);
	}

	public int withdraw(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + "withdraw", map);
	}

	public UsersVo nickCheck(String nick) {
		return sqlSession.selectOne(NAMESPACE + "nickCheck", nick);
	}

	public int deposit(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + "deposit", map);
	}

}