package com.cherryfunding.spring.service.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CHashtagDao;
import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class InsertCharityServiceImpl implements InsertCharityService{
	@Autowired
	private CHashtagDao cHashtagDao;

	@Autowired
	private CharityDao charityDao;
	
	@Autowired
	private CPictureDao cPictureDao;

	@Override
	public int cinsert(CharityVo cvo) {
		return charityDao.insert(cvo);
	}

	@Override
	public int chinsert(CHashtagVo chvo) {
		return cHashtagDao.insert(chvo);
	}

	@Override
	public int cpinsert(CPictureVo cpvo) {
		return cPictureDao.insert(cpvo);
	}
}
