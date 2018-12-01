package com.cherryfunding.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VPictureVo;

@Repository
public class VPictureDao {
	@Autowired
	SqlSession sqlSession;
	 
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VPictureMapper.";
	
	public int insert(VPictureVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	public VPictureVo detail(int vpNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", vpNum);
	}
	public List<VPictureVo> list(){
		return sqlSession.selectList(NAMESPACE + "list");
	}
	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}
	public VPictureVo thumbnail(int vNum) {
		VPictureVo vPictureVo = sqlSession.selectOne(NAMESPACE + "thumbnail", vNum);

		if (vPictureVo == null) {
			vPictureVo = new VPictureVo();
			vPictureVo.setvNum(vNum);
			vPictureVo.setSaveName("default");
			vPictureVo.setVpInfo("default");
		}
		return vPictureVo;
	} 
}
