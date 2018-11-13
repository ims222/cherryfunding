package com.cherryfunding.spring.dao;

import java.util.List;

import com.cherryfunding.spring.vo.UserInfoVo;

public interface LoginDao{
	public UserInfoVo findUserInfo(String id);
	public List<String> getUserRoles(String id);
}
