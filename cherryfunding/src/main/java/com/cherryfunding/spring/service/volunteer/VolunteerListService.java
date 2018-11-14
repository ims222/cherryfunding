package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VPictureDao;
import com.cherryfunding.spring.dao.VolunteerDao;
import com.cherryfunding.spring.vo.VPictureVo;
import com.cherryfunding.spring.vo.VolunteerVo;
//사용 안하고 있는 서비스
@Service
public class VolunteerListService {
	
	@Autowired
	private VolunteerDao volunteerDao;
	
	@Autowired
	private VPictureDao vPictureDao;
	
	public List<VolunteerVo> list(){
		return volunteerDao.list();
	}
	
	public List<VolunteerVo> getFirstSix(){
		return volunteerDao.getFirstSix();
	}
	
	public VPictureVo thumbnail(int vNum) {
		return vPictureDao.thumbnail(vNum);
	}
	
	
}
