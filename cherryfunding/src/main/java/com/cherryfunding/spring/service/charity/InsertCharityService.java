package com.cherryfunding.spring.service.charity;

import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.RewardVo;

public interface InsertCharityService {
	int cinsert(CharityVo cvo); //???î©
	int chinsert(CHashtagVo chvo);//?ï¥?ãú?Éú?Å¨
	int cpinsert(CPictureVo cpvo);//???î©?Öå?ù¥Î∏?
}
