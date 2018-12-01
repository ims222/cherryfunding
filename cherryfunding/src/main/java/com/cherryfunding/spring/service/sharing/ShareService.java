package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.ShareDao;
import com.cherryfunding.spring.vo.ShareVo;

@Service
public class ShareService {
	
	@Autowired
	private ShareDao shareDao;
	 
	public int getMaxNum() {
		return shareDao.getMaxNum();
	}
	
	public ShareVo detail(int sNum) {
		return shareDao.detail(sNum);
	}
}
