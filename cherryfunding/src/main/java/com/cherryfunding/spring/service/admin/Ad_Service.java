package com.cherryfunding.spring.service.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.Admin_DAO;
import com.cherryfunding.spring.vo.AdminVo;

@Service
public class Ad_Service {
	
	@Autowired private Admin_DAO dao;
	
	public int insert(AdminVo vo) {
		System.out.println("services 접근");
		return dao.insert(vo);
	}
	
	public AdminVo login(HashMap<String, String> map) {
		System.out.println("services 접근");
		return dao.login(map);
	}
	

}
