package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FDetailDao;
import com.cherryfunding.spring.vo.FDetailVo;

@Service
public class FundingParticipantsService {

	@Autowired
	private FDetailDao fDetailDao;

	public List<FDetailVo> listByfNum(int fNum) {
		return fDetailDao.listByfNum(fNum);
	}
}
