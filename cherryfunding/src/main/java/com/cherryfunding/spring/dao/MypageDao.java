package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.MypageVo;


@Repository
public class MypageDao {
	@Autowired
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.MypageMapper.";
	
	public int charitySum(String id) {
		return sqlSession.selectOne(NAMESPACE + "charitySum", id);
	}
	
	public int fundingSum(String id) {
		return sqlSession.selectOne(NAMESPACE + "fundingSum", id);
	}
	
	public List<MypageVo> charityList(String id){
		return sqlSession.selectList(NAMESPACE + "charityList", id);
	}
	
	public List<MypageVo> fundingList(String id){
		return sqlSession.selectList(NAMESPACE + "fundingList", id);
	}
}