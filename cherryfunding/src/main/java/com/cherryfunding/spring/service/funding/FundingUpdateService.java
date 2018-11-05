package com.cherryfunding.spring.service.funding;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FundingDao;

@Service
public class FundingUpdateService {

	@Autowired
	private FundingDao fundingDao;

	public int editContent(HashMap<String, Object> map) {
		return fundingDao.editContent(map);
	}
}
