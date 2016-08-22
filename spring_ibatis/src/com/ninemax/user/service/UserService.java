package com.ninemax.user.service;

import java.util.List;
import java.util.Map;
import com.ninemax.user.model.User;

public interface UserService {
	
	//添加用户操作
	public void addUser(User user);

	//查询用户集合
	public List<User> getAllUsers(int currentPage);

	//根据用户ID查询
	public User getUsrById(int userId);
	
	//根据用户ID删除用户
	public void delUser(int user);

	//更新用户
	public void update(User user);
	
	//分页
	public List<Map<String,Integer>> queryCount(int count);
	
	//非物理删除
	public void falseDel(int id);
	
	//查询总条数
	public int count();
}
