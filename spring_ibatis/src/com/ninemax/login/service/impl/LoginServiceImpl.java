package com.ninemax.login.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ninemax.login.model.Login;
import com.ninemax.login.service.LoginService;

/**
 * 登陆serviceImpl
 * 
 * @author Darker
 *
 */
@Repository
public class LoginServiceImpl implements LoginService{
	
	@Resource
	private SqlMapClient sqlMapClient;
	
	@Override
	public boolean login(String managerName,String managerPassword) {
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("managerName", managerName);
		map.put("managerPassword", managerPassword);
		
		try {
			Object user=sqlMapClient.queryForObject("sel",map);
			
			if(""!=user&&null!=user){
				
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean isExist(String managerName) {
		
		try {
			Object user=sqlMapClient.queryForObject("selByName",managerName);
			
			if(user!=null&&""!=user){
				
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean modifyPassword(String managerName, String managerPassword) {
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("managerName", managerName);
		map.put("managerPassword", managerPassword);
		
		try {
			//成功为1,失败为0
			int isSuccess=sqlMapClient.update("modifyPassword",map);
			
			if(isSuccess>=0){
				
				return true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public Login queryUser(String managerName) {
		
		try {
			Login user=(Login) sqlMapClient.queryForObject("selByName",managerName);
			
			if(null!=user&&!"".equals(user)){
				
				return user;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
