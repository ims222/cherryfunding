package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class CharityConfirmService {

	@Autowired
	private CharityDao charityDao;

	public List<CharityVo> waitList() { // 대기 목록
		return charityDao.waitList();
	}

	public List<CharityVo> confirmList() { // 승인 목록
		return charityDao.confirmList();
	}

	public int confirm(int cNum) { // 컨펌
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("cNum", cNum);
		return charityDao.confirm(map);
	}

	public int wait(int cNum) { // 컨펌취소
		return charityDao.wait(cNum);
	}

	public List<CharityVo> list() {
		return charityDao.list();
	}
}
