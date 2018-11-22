package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.FPictureVo;

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

	public FPictureVo thumbnail(int fNum) {
		FPictureVo fPictureVo = sqlSession.selectOne(NAMESPACE + "thumbnail", fNum);
		if (fPictureVo == null) {
			fPictureVo = new FPictureVo();
			fPictureVo.setfNum(fNum);
			fPictureVo.setSavename("default");
			fPictureVo.setFpinfo("default");
		}
		return fPictureVo;
	}
	public String thumbnailString(int fNum) {
		FPictureVo savename = sqlSession.selectOne(NAMESPACE + "thumbnail", fNum);
		if (savename == null) {
			savename = new FPictureVo();
			savename.setfNum(fNum);
			savename.setSavename("default");
			savename.setFpinfo("default");
		}
		return savename.getSavename();
	}

}
