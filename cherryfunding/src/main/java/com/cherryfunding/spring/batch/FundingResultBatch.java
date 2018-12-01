package com.cherryfunding.spring.batch;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cherryfunding.spring.service.funding.FundingResultServiceImpl;
import com.cherryfunding.spring.vo.FDetailVo;

@Controller
public class FundingResultBatch {

	@Autowired 
	private FundingResultServiceImpl fundingResultService;

	public void fundingResult() {
		List<HashMap<String, Object>> list = fundingResultService.isSuccess();

		for (HashMap<String, Object> l : list) {
			int fdNum = (Integer) l.get("FDNUM");
			int amount = (Integer) l.get("AMOUNT");// 목표금액
			int camout = (Integer) l.get("CAMOUT");// 현재금액

			FDetailVo fdvo = new FDetailVo();
			fdvo.setFdNum(fdNum);
			if (amount <= camout) { // 성공여부
				fdvo.setState("성공");
			} else {
				fdvo.setState("실패");
			}
			fundingResultService.update(fdvo);
		}
	}
}
