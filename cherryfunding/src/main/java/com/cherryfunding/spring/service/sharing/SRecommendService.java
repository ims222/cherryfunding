package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SRecommendDao;
import com.cherryfunding.spring.vo.SRecommendVo;

@Service
public class SRecommendService {

	@Autowired
	private SRecommendDao sRecommendDao;

	public SRecommendVo isRecomm(SRecommendVo vo) {
		return sRecommendDao.isRecomm(vo); 
	}

	public int insert(SRecommendVo vo) {
		return sRecommendDao.insert(vo);
	}

	public int getMaxNum() {
		return sRecommendDao.getMaxNum();
	}

	public int delete(SRecommendVo vo) {
		return sRecommendDao.delete(vo);
	}

	public int getRecommend(int sNum) {
		return sRecommendDao.getRecommend(sNum);
	}

}
