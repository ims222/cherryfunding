package com.cherryfunding.spring.service.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class PrepareCharityListService {
	@Autowired
	private CharityDao cdao;
	
	@Autowired
	private CPictureDao cpdao;
	
	public List<CharityVo> list(){
		return cdao.prepare();
	}
	
	public CPictureVo thumbnail(int fNum) {
		return cpdao.thumbnail(fNum);
	}
}
