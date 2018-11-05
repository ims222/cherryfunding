package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VolunteerDao;
import com.cherryfunding.spring.vo.VolunteerVo;

@Service
public class VolunteerService {
	@Autowired
	private VolunteerDao volunteerDao;
	
	public int getMaxNum() {
		return volunteerDao.getMaxNum();
	}
	
	public int insert(VolunteerVo vo) {
		return volunteerDao.insert(vo);
	}
	
	public VolunteerVo detail(int vNum) {
		return volunteerDao.detail(vNum);
	}
	
	public int getMembers(int vNum) {
		return volunteerDao.getMembers(vNum);
	}
	
	public List<VolunteerVo> list(){
		return volunteerDao.list();
	}
}
