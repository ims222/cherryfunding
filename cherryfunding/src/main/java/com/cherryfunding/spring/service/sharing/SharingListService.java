package com.cherryfunding.spring.service.sharing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SPictureDao;
import com.cherryfunding.spring.dao.ShareDao;
import com.cherryfunding.spring.vo.SPictureVo;
import com.cherryfunding.spring.vo.ShareVo;

@Service
public class SharingListService {

	@Autowired
	private ShareDao shareDao;
	
	@Autowired
	private SPictureDao sPictureDao;
	
	public List<ShareVo> list(){
		return shareDao.list();
	}
	
	public SPictureVo thumbnail(int sNum) {
		return sPictureDao.thumbnail(sNum);
	}
}
