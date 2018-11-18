package com.cherryfunding.spring.service.funding;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FRecommendDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.util.StringLengthCut;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class MainFundingService {

	@Autowired
	private S3Util s3;

	@Autowired
	private FundingDao fdao;

	@Autowired
	private FPictureDao pfdao;

	@Autowired
	private FRecommendDao fRecommendDao;

	public int getRecomm(int fNum) {
		return fRecommendDao.getRecommend(fNum);
	}

	public FundingVo mainEnd() {
		FundingVo fEnd = fdao.mainEnd();
		if (fEnd == null) {
			fEnd = new FundingVo();
		}

		try {
			String title = fEnd.getTitle();
			fEnd.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(fEnd.getfNum()).getSavename();
		fEnd.setSavename(s3.getFileURL("funding/" + thumbnail));// 썸네일
		fEnd.setFpinfo(this.thumbnail(fEnd.getfNum()).getFpinfo()); // 사진정보

		return fEnd;
	}

	public FundingVo mainNew() {
		FundingVo fNew = fdao.mainNew();
		if (fNew == null) {
			fNew = new FundingVo();
		}

		try {
			String title = fNew.getTitle();
			fNew.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(fNew.getfNum()).getSavename();
		fNew.setSavename(s3.getFileURL("funding/" + thumbnail));// 썸네일
		fNew.setFpinfo(this.thumbnail(fNew.getfNum()).getFpinfo()); // 사진정보

		return fNew;
	}

	public FundingVo mainHot() {
		FundingVo fHot = fdao.mainHot();
		if (fHot == null) {
			fHot = new FundingVo();
		}

		try {
			String title = fHot.getTitle();
			fHot.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(fHot.getfNum()).getSavename();
		fHot.setSavename(s3.getFileURL("funding/" + thumbnail));// 썸네일
		fHot.setFpinfo(this.thumbnail(fHot.getfNum()).getFpinfo()); // 사진정보

		return fHot;
	}

	public FundingVo mainPrice() {
		FundingVo fPrice = fdao.mainPrice();
		if (fPrice == null) {
			fPrice = new FundingVo();
		}

		try {
			String title = fPrice.getTitle();
			fPrice.setTitle(StringLengthCut.getString(title, 100));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		String thumbnail = this.thumbnail(fPrice.getfNum()).getSavename();
		fPrice.setSavename(s3.getFileURL("funding/" + thumbnail));// 썸네일
		fPrice.setFpinfo(this.thumbnail(fPrice.getfNum()).getFpinfo()); // 사진정보
		return fPrice;
	}

	public FPictureVo thumbnail(int fNum) {
		return pfdao.thumbnail(fNum);
	}

	public HashMap<String, Object> totFunding() {
		return fdao.totFunding();
	}

	public int todayFundingPrice() { // 오늘 펀딩 금액
		return fdao.todayFundingPrice();
	}

	public int todayFundingCount() { // 오늘 펀딩 갯수
		return fdao.todayFundingCount();
	}

}