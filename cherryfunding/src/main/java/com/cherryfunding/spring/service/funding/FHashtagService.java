package com.cherryfunding.spring.service.funding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FHashtagDao;
import com.cherryfunding.spring.vo.FHashtagVo;

@Service
public class FHashtagService {
	@Autowired
	private FHashtagDao dao;

	public int insert(FHashtagVo vo) { 
		return dao.insert(vo);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}
	
	
}
