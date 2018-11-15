package com.cherryfunding.spring.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.AdminVo;

@Repository
public class Admin_DAO {
	
	@Autowired private SqlSession sqlsession; //sql 세션 주입
	private static final String NAMESPACE ="com.cherryfunding.spring.mybatis.AdminMapper";//mapper
	
	public int insert(AdminVo vo) {
		System.out.println("Dao접근");
		return sqlsession.insert(NAMESPACE+".insert",vo);
	}
	
	public AdminVo login(HashMap<String,String> map) {
		System.out.println("Dao접근");
		return sqlsession.selectOne(NAMESPACE+".login",map);
	}
	
	public String search(String aid) {
		return sqlsession.selectOne(NAMESPACE+".search",aid);
	}
	
	

}
