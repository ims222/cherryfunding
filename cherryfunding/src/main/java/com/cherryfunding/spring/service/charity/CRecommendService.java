package com.cherryfunding.spring.service.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CRecommendDao;
import com.cherryfunding.spring.vo.CRecommendVo;

@Service
public class CRecommendService {

	@Autowired
	private CRecommendDao cRecommendDao;

	public int insert(CRecommendVo vo) {
		return cRecommendDao.insert(vo);
	} 

	public int getMaxNum() {
		return cRecommendDao.getMaxNum();
	}

	public CRecommendVo isRecomm(CRecommendVo vo) {
		return cRecommendDao.isRecomm(vo);
	}

	public int delete(CRecommendVo vo) {
		return cRecommendDao.delete(vo);
	}

	public int getRecommend(int cNum) {
		return cRecommendDao.getRecommend(cNum);
	}

}
