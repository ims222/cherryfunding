package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.vo.FPictureVo;

@Service
public class FPictureService {

	@Autowired
	private FPictureDao dao;

	public int insert(FPictureVo vo) {
		return dao.insert(vo);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}
}
