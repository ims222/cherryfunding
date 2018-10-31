package com.cherryfunding.spring.service.user;

import com.cherryfunding.spring.vo.UsersVo;

public interface InputUsersService {

	int inputUsers(UsersVo vo); //회원

	int inputUserSetting(String id); //회원설정
}
