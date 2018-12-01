package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class CharityService {
	@Autowired
	private CharityDao dao;

	@Autowired
	private CPictureDao cpdao;
 
	public List<CharityVo> list() {
		return dao.list();
	}

	public CharityVo select(int cNum) {
		return dao.select(cNum);
	}

	public int insert(CharityVo vo) {
		return dao.insert(vo);
	}

	public int update(CharityVo vo) {
		return dao.update(vo);
	}

	public int delete(int cNum) {
		return dao.delete(cNum);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}

	public CPictureVo thumbnail(int cNum) {
		return cpdao.thumbnail(cNum);
	}
	
	public int wait(int cNum) { // 컨펌취소
		return dao.wait(cNum);
	}
	
	public List<CharityVo> waitList() { // 대기 목록
		return dao.waitList();
	}
	
	public int confirm(HashMap<Object, Object> map) { // 컨펌
		return dao.confirm(map);
	}
	public List<CharityVo> confirmList() { // 대기 목록
		return dao.confirmList();
	}

	
	
	
	
	

}