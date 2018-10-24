package com.cherryfunding.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.Admin_Dao;
import com.cherryfunding.spring.vo.AdminVo;

@Service
public class Admin_service {
	
	@Autowired private Admin_Dao dao;
	
	public void setDao(Admin_Dao dao) {
		this.dao=dao;
	}
	
	public int insert(AdminVo vo) {
		return dao.insert(vo);
	}

}
