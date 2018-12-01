package com.cherryfunding.spring.service.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class CharityUpdateService {

	@Autowired
	private CharityDao charityDao;

	public int update(CharityVo vo) {
		return charityDao.update(vo);
	} 

	public CharityVo detail(int cNum) {
		return charityDao.select(cNum);
	}
}
