package com.cherryfunding.spring.service.charity;

import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.RewardVo;

public interface InsertCharityService {
	int cinsert(CharityVo cvo); //???��
	int chinsert(CHashtagVo chvo);//?��?��?��?��
	int cpinsert(CPictureVo cpvo);//???��?��?���?
}