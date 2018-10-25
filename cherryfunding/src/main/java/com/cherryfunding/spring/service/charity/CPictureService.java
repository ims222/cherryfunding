package com.cherryfunding.spring.service.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.vo.CPictureVo;


@Service
public class CPictureService {

	@Autowired
	private CPictureDao dao;

	public int insert(CPictureVo vo) {
		return dao.insert(vo);
	}

	public int getMaxNum() {
		return dao.getMaxNum();
	}
	
	public List<CPictureVo> list(int num) {
		return dao.list(num);
	}
}
