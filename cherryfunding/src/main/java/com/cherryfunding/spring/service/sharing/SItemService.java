package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SItemDao;

import com.cherryfunding.spring.dao.SItemDao;

@Service
public class SItemService {

	@Autowired
	private SItemDao dao;
	
	public int getMaxNum() {
		return dao.getMaxNum();
	}
}
