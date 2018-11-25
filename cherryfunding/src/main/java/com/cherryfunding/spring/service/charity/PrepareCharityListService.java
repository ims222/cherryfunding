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
public class PrepareCharityListService {
	@Autowired
	private CharityDao cdao;
	
	@Autowired
	private CPictureDao cpdao;
	
	public List<HashMap<String, Object>> list(HashMap<String, Object> map){
		return cdao.prepare(map);
	}
	
	public CPictureVo thumbnail(int cNum) {
		return cpdao.thumbnail(cNum);
	}
	
	public int getTotCountPrepare(HashMap<String, Object> map) {
		return cdao.getTotCountPrepare(map);
	}
}
