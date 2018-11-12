package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class IngCharityListService {
	@Autowired
	private CharityDao dao;

	@Autowired
	private CPictureDao cpdao;

	public List<CharityVo> list(HashMap<String, Object> map) {
		return dao.ing(map);
	}

	public CPictureVo thumbnail(int cNum) {
		return cpdao.thumbnail(cNum);
	}
	public List<String> relatedWords(String keyword, String field) {
		System.out.println("서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("field", field);
		List<String> list = dao.relatedWords(map);
		return list;
	}

}

