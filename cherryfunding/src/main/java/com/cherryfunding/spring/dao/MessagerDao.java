package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.MessengerVo;

@Repository
public class MessagerDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.MessengerMapper.";

	public int insert(MessengerVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	} 

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNUm");
	}
}
