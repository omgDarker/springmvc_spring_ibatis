package com.ninemax.login.service;

import org.springframework.stereotype.Service;

import com.ninemax.login.model.Login;

/**
 * 登陆Service
 * 
 * @author Darker
 *
 */
@Service
public interface LoginService {
	
	// 登陆
	public boolean login(String managerName,String managerPassword);
	
	// 查询用户是否存在
	public boolean isExist(String managerName);
	
	// 修改用户密码
	public boolean modifyPassword(String managerName,String managerPassword);
	
	// 查询用户是否存在
	public Login queryUser(String managerName);
}
