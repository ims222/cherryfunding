package com.cherryfunding.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.SPictureVo;

@Repository
public class SPictureDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.SPictureMapper.";

	public int insert(SPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public SPictureVo thumbnail(int sNum) {
		SPictureVo sPictureVo = sqlSession.selectOne(NAMESPACE + "thumbnail", sNum);

		if (sPictureVo == null) {
			sPictureVo = new SPictureVo();
			sPictureVo.setsNum(sNum);
			sPictureVo.setSaveName("default");
			sPictureVo.setsPinfo("default");
		}
		return sPictureVo;
	}
}
