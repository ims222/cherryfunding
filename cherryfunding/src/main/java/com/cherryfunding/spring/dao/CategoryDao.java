package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.cherryfunding.spring.vo.CategoryVo;

public class CategoryDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CategoryMapper.";
	
	public int insert(CategoryVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
}
