package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.AdminVo;

@Repository
public class Admin_Dao {
		
	@Autowired private SqlSession sqlsession;//자동으로 세션 주입
	
	private static final String NAMESPACE ="com.cherryfunding.spring.mybatis.AdminMapper";
	
	public int insert(AdminVo vo) {
		return sqlsession.insert(NAMESPACE+".insert",vo);
	}

}
