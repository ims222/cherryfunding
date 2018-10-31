package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class FundingConfirmService {

	@Autowired
	private FundingDao fundingDao;

	public List<FundingVo> waitList() { // 대기 목록
		return fundingDao.waitList();
	}

	public int confirm(int fNum) { // 컨펌
		return fundingDao.confirm(fNum);
	}

	public List<FundingVo> list() {
		return fundingDao.list();
	}

}
