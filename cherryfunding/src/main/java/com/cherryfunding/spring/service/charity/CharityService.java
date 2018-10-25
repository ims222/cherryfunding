package com.cherryfunding.spring.service.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class CharityService {
	@Autowired
	private CharityDao dao;

	@Autowired
	private CPictureDao cpdao;

	public List<CharityVo> list() {
		return dao.list();
	}

	public CharityVo select(int num) {
		return dao.select(num);
	}

	public int insert(CharityVo vo) {
		return dao.insert(vo);
	}

	public int update(CharityVo vo) {
		return dao.update(vo);
	}

	public int delete(int num) {
		return dao.delete(num);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}

	public CPictureVo thumbnail(int fNum) {
		return cpdao.thumbnail(fNum);
	}

}