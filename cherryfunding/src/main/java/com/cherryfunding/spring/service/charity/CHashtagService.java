package com.cherryfunding.spring.service.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CHashtagDao;
import com.cherryfunding.spring.vo.CHashtagVo;


@Service
public class CHashtagService {
	@Autowired
	private CHashtagDao dao;

	public int insert(CHashtagVo vo) {
		return dao.insert(vo);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}
	
	
}
