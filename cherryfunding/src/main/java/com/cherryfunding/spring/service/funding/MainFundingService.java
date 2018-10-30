package com.cherryfunding.spring.service.funding;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.util.S3Util;
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

	public FundingVo mainEnd() {
		FundingVo fEnd = fdao.mainEnd();
		if (fEnd == null) {
			fEnd = new FundingVo();
		}
		String thumbnail = this.thumbnail(fEnd.getFnum()).getSavename();
		fEnd.setSavename(s3.getFileURL("funding/"+ thumbnail));// 썸네일
		fEnd.setFpinfo(this.thumbnail(fEnd.getFnum()).getFpinfo()); // 사진정보

		return fEnd;
	}

	public FundingVo mainNew() {
		FundingVo fNew = fdao.mainNew();
		if (fNew == null) {
			fNew = new FundingVo();
		}
		String thumbnail = this.thumbnail(fNew.getFnum()).getSavename();
		fNew.setSavename(s3.getFileURL("funding/"+ thumbnail));// 썸네일
		fNew.setFpinfo(this.thumbnail(fNew.getFnum()).getFpinfo()); // 사진정보

		return fNew;
	}

	public FundingVo mainHot() {
		FundingVo fHot = fdao.mainHot();
		if (fHot == null) {
			fHot = new FundingVo();
		}
		String thumbnail = this.thumbnail(fHot.getFnum()).getSavename();
		fHot.setSavename(s3.getFileURL("funding/"+ thumbnail));// 썸네일
		fHot.setFpinfo(this.thumbnail(fHot.getFnum()).getFpinfo()); // 사진정보

		return fHot;
	}

	public FundingVo mainPrice() {
		FundingVo fPrice = fdao.mainPrice();
		if (fPrice == null) {
			fPrice = new FundingVo();
		}
		String thumbnail = this.thumbnail(fPrice.getFnum()).getSavename();
		fPrice.setSavename(s3.getFileURL("funding/"+ thumbnail));// 썸네일
		fPrice.setFpinfo(this.thumbnail(fPrice.getFnum()).getFpinfo()); // 사진정보
		return fPrice;
	}

	public FPictureVo thumbnail(int fNum) {
		return pfdao.thumbnail(fNum);
	}

	public HashMap<String, Object> totFunding() {
		return fdao.totFunding();
	}

	public HashMap<String, Object> todayFunding() {
		return fdao.todayFunding();
	}

}