package com.cherryfunding.spring.service.sharing;

import com.cherryfunding.spring.vo.SItemVo;
import com.cherryfunding.spring.vo.SPictureVo;
import com.cherryfunding.spring.vo.ShareVo;

public interface InsertSharingService {

	int sInsert(ShareVo shareVo);
	int siInsert(SItemVo sItemVo);
	int spInsert(SPictureVo sPictureVo);
	
} 
