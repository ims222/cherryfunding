package com.cherryfunding.spring.service.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.Admin_DAO;
import com.cherryfunding.spring.vo.AdminVo;

@Service
public class Ad_Service {
	
	@Autowired private Admin_DAO dao;
	
	public int insert(AdminVo vo) { //관리자 회원가입
		return dao.insert(vo);
	} 
	
	public AdminVo login(HashMap<String, String> map) { //관리자 로그인
		return dao.login(map);
	}
	
	public String search(String aid) {
		return dao.search(aid);
	}
	
	

}
