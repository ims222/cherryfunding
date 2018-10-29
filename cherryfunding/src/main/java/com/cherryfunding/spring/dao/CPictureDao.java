package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.SPictureVo;

@Repository
public class CPictureDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CPictureMapper.";

	public int insert(CPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<CPictureVo> list(int num) {
		return sqlSession.selectList(NAMESPACE + "list", num);
	}

	public CPictureVo thumbnail(int cNum) {
		CPictureVo cPictureVo = sqlSession.selectOne(NAMESPACE + "thumbnail", cNum);

		if (cPictureVo == null) {
			cPictureVo = new CPictureVo();
			cPictureVo.setcNum(cNum);
			cPictureVo.setSaveName("default");
			cPictureVo.setCpinfo("default");
		}
		return cPictureVo;
	}
}
