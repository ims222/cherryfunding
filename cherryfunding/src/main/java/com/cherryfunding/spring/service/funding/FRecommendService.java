package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FRecommendDao;
import com.cherryfunding.spring.vo.FRecommendVo;

@Service
public class FRecommendService {

	@Autowired
	private FRecommendDao fRecommendDao;

	public int insert(FRecommendVo vo) {
		return fRecommendDao.insert(vo);
	}

	public int getMaxNum() {
		return fRecommendDao.getMaxNum();
	}

	public FRecommendVo isRecomm(FRecommendVo vo) {
		return fRecommendDao.isRecomm();
	}

	public int delete(FRecommendVo vo) {
		return fRecommendDao.delete(vo);
	}

}
