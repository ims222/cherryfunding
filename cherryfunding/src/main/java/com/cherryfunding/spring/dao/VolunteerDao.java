package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VolunteerVo;

@Repository
public class VolunteerDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VolunteerMapper.";
	public int insert(VolunteerVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	public VolunteerVo detail(int vNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", vNum);
	}
	public List<VolunteerVo> list(){
		return sqlSession.selectList(NAMESPACE + "list");
	}
	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}
}
