package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VPictureDao;
import com.cherryfunding.spring.vo.VPictureVo;

@Service
public class VPictureService {
	@Autowired
	private VPictureDao vPictureDao;
	
	public int getMaxNum() {
		return vPictureDao.getMaxNum(); 
	}
	
	public int insert(VPictureVo vo) {
		return vPictureDao.insert(vo);
	}
	
	public VPictureVo detail(int vpNum) {
		return vPictureDao.detail(vpNum);
	}
	
	public List<VPictureVo> list(){
		return vPictureDao.list();
	}
}
