package com.cherryfunding.spring.service.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VRecommendDao;
import com.cherryfunding.spring.vo.VRecommendVo;

@Service
public class VRecommendService {

	@Autowired
	private VRecommendDao vRecommendDao;
	
	public VRecommendVo isRecomm(VRecommendVo vo) {
		return vRecommendDao.isRecomm(vo);
	}

	public int insert(VRecommendVo vo) {
		return vRecommendDao.insert(vo);
	}

	public int getMaxNum() {
		return vRecommendDao.getMaxNum();
	}

	public int delete(VRecommendVo vo) {
		return vRecommendDao.delete(vo);
	}
	
	public int getRecomm(int vNum) {
		return vRecommendDao.getRecomm(vNum);
	}
	
}
