package com.cherryfunding.spring.service.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cherryfunding.spring.dao.SItemDao;
import com.cherryfunding.spring.dao.SPictureDao;
import com.cherryfunding.spring.dao.ShareDao;
import com.cherryfunding.spring.vo.SItemVo;
import com.cherryfunding.spring.vo.SPictureVo;
import com.cherryfunding.spring.vo.ShareVo;

@Transactional
@Service
public class InsertSharingServiceImpl implements InsertSharingService {

	@Autowired
	private ShareDao shareDao;

	@Autowired
	private SItemDao sItemDao;

	@Autowired
	private SPictureDao sPictureDao;

	@Override
	public int sInsert(ShareVo shareVo) {
		return shareDao.insert(shareVo);
	}

	@Override
	public int siInsert(SItemVo sItemVo) {
		return sItemDao.insert(sItemVo);
	}

	@Override
	public int spInsert(SPictureVo sPictureVo) {
		return sPictureDao.insert(sPictureVo);
	}

}
