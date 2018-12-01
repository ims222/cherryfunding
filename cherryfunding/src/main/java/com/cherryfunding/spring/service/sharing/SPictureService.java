package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SPictureDao;

@Service
public class SPictureService {

	@Autowired
	private SPictureDao sPictureDao;
	
	public int getMaxNum() { 
		return sPictureDao.getMaxNum();
	}
}
