package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Repository
public class FPictureDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FPictureMapper.";

	public int insert(FPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}
	
	public List<FPictureVo> list(int num) {
		return sqlSession.selectList(NAMESPACE + "list", num);
	}
	
	public String thumbnail(int fNum) {
		return sqlSession.selectOne(NAMESPACE + "thumbnail", fNum);
	}
	
}
