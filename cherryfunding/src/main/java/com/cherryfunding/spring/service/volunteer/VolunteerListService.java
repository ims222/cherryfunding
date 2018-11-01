package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VPictureDao;
import com.cherryfunding.spring.dao.VolunteerDao;
import com.cherryfunding.spring.vo.VPictureVo;
import com.cherryfunding.spring.vo.VolunteerVo;

@Service
public class VolunteerListService {
	
	@Autowired
	private VolunteerDao volunteerDao;
	
	@Autowired
	private VPictureDao vPictureDao;
	
	public List<VolunteerVo> list(){
		return volunteerDao.list();
	}
	
	public VPictureVo thumbnail(int vNum) {
		return vPictureDao.thumbnail(vNum);
	}
	
	
}
