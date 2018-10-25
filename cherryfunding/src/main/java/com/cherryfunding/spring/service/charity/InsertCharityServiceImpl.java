package com.cherryfunding.spring.service.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CHashtagDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.FHashtagDao;
import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RewardDao;
import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;

@Service
public class InsertCharityServiceImpl implements InsertCharityService{
	@Autowired
	private CHashtagDao cHashtagDao;

	@Autowired
	private CharityDao charityDao;

	@Override
	public int cinsert(CharityVo cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chinsert(CHashtagVo chvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cpinsert(CPictureVo fpvo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
