package com.cherryfunding.spring.service.charity;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class SearchCharityService {
	
	@Autowired CharityDao CharityDao;
	
	public List<CharityVo> searchwaitList(HashMap<String, String>map){ 
		
		return CharityDao.searchwaitList(map); // 검색 찾기 기능 confirm ='n'인 경우
	}
	public List<CharityVo> searchconfirmList(HashMap<String, String>map){
		
		return CharityDao.searchconfirmList(map);
	}

}
