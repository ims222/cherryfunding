package com.cherryfunding.spring.service.charity;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CRecommendDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.util.StringLengthCut;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Service
public class MainCharityService {

	@Autowired
	private S3Util s3;

	@Autowired
	private CharityDao cdao;

	@Autowired
	private CPictureDao cfdao;

	@Autowired
	private CRecommendDao cRecommendDao;

	public CharityVo mainEnd() {
		CharityVo cEnd = cdao.mainEnd();
		if (cEnd == null) {
			cEnd = new CharityVo();
		}

		try {
			String title = cEnd.getTitle();
			cEnd.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(cEnd.getcNum()).getSaveName();
		cEnd.setSavename(s3.getFileURL("charity/" + thumbnail));// 썸네일
		cEnd.setCpinfo(this.thumbnail(cEnd.getcNum()).getCpinfo()); // 사진정보

		return cEnd;
	}

	public CharityVo mainNew() {
		CharityVo cNew = cdao.mainNew();
		if (cNew == null) {
			cNew = new CharityVo();
		}

		try {
			String title = cNew.getTitle();
			cNew.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(cNew.getcNum()).getSaveName();
		cNew.setSavename(s3.getFileURL("charity/" + thumbnail));// 썸네일
		cNew.setCpinfo(this.thumbnail(cNew.getcNum()).getCpinfo()); // 사진정보

		return cNew;
	}

	public CharityVo mainHot() {
		CharityVo cHot = cdao.mainHot();
		if (cHot == null) {
			cHot = new CharityVo();
		}

		try {
			String title = cHot.getTitle();
			cHot.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(cHot.getcNum()).getSaveName();
		cHot.setSavename(s3.getFileURL("charity/" + thumbnail));// 썸네일
		cHot.setCpinfo(this.thumbnail(cHot.getcNum()).getCpinfo()); // 사진정보

		return cHot;
	}

	public CharityVo mainPrice() {
		CharityVo cPrice = cdao.mainPrice();
		if (cPrice == null) {
			cPrice = new CharityVo();
		}

		try {
			String title = cPrice.getTitle();
			cPrice.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(cPrice.getcNum()).getSaveName();
		cPrice.setSavename(s3.getFileURL("charity/" + thumbnail));// 썸네일
		cPrice.setCpinfo(this.thumbnail(cPrice.getcNum()).getCpinfo()); // 사진정보

		return cPrice;
	}

	public CPictureVo thumbnail(int cNum) {
		return cfdao.thumbnail(cNum);
	}

	public HashMap<String, Object> totCharity() {
		return cdao.totCharity();
	}

	public int todayCharityPrice() {
		return cdao.todayCharityPrice();
	}

	public int todayCharityCount() {
		return cdao.todayCharityCount();
	}

	public int getRecomm(int cNum) {
		return cRecommendDao.getRecommend(cNum);
	}

}