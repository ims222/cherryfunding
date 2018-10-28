package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.ShareDao;

@Service
public class ShareService {
	
	@Autowired
	private ShareDao dao;
	
	public int getMaxNum() {
		return dao.getMaxNum();
	}
}
