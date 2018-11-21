package com.cherryfunding.spring.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.UsersDao;
import com.cherryfunding.spring.vo.UsersVo;

@Service
public class UserManageService {
	
	@Autowired UsersDao UserDao;
	
	
	public List<UsersVo> list(){ // 관리자 페이지 user리스트
		return UserDao.list();
	}
	
	public List<UsersVo> idsearch(String idsearch) {
		return UserDao.idsearch(idsearch);
	}
	
	public int sdelete(String id) { // 관리자 페이지 회원 탈퇴
		return UserDao.sdelete(id);
	} 

}
