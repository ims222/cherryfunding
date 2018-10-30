package com.cherryfunding.spring.service.charity;

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
public class MainCharityService {

	@Autowired
	private CharityDao cdao;

	@Autowired
	private CPictureDao cfdao;

	public CharityVo mainEnd() {
		CharityVo cEnd = cdao.mainEnd();
		if (cEnd == null) {
			cEnd = new CharityVo();
		}
		cEnd.setSavename(this.thumbnail(cEnd.getcNum()).getSaveName());// 썸네일
		cEnd.setCpinfo(this.thumbnail(cEnd.getcNum()).getCpinfo()); // 사진정보

		return cEnd;
	}
	
	public CharityVo mainNew() {
		CharityVo cNew = cdao.mainNew();
		if (cNew == null) {
			cNew = new CharityVo();
		}
		cNew.setSavename(this.thumbnail(cNew.getcNum()).getSaveName());// 썸네일
		cNew.setCpinfo(this.thumbnail(cNew.getcNum()).getCpinfo()); // 사진정보

		return cNew;
	}
	
	public CharityVo mainHot() {
		CharityVo cHot = cdao.mainHot();
		if (cHot == null) {
			cHot = new CharityVo();
		}
		cHot.setSavename(this.thumbnail(cHot.getcNum()).getSaveName());// 썸네일
		cHot.setCpinfo(this.thumbnail(cHot.getcNum()).getCpinfo()); // 사진정보

		return cHot;
	}
	
	public CharityVo mainPrice() {
		CharityVo cPrice = cdao.mainPrice();
		if (cPrice == null) {
			cPrice = new CharityVo();
		}
		cPrice.setSavename(this.thumbnail(cPrice.getcNum()).getSaveName());// 썸네일
		cPrice.setCpinfo(this.thumbnail(cPrice.getcNum()).getCpinfo()); // 사진정보

		return cPrice;
	}

	public CPictureVo thumbnail(int cNum) {
		return cfdao.thumbnail(cNum);
	}

}