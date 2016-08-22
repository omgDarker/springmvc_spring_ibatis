package com.ninemax.user.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ninemax.user.model.User;
import com.ninemax.user.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	private SqlMapClient sqlMapClient;

	@Override
	public void addUser(User user) {
		try {
			sqlMapClient.insert("adduser", user);
			// Map<String,Integer> map = new HashMap<String,Integer> ();
			// map.put("userId", user.getUserId());
			// map.put("flag", 1);
			// //添加flag=1
			// sqlMapClient.update("falseDel",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers(int currentPage) {
		
		List<User> users = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("flag", 1);
		map.put("n", (currentPage-1)*7);
		map.put("m", 7);
		
		try {
			
			users = sqlMapClient.queryForList("selall", map);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return users;
	}

	@Override
	public User getUsrById(int userId) {
		
		User user = null;
		
		try {
			
			user = (User) sqlMapClient.queryForObject("selById", userId);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		return user;
	}

	@Override
	public void delUser(int user) {
		try {
			
			sqlMapClient.delete("del", user);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	@Override
	public void update(User user) {
		
		try {
			
			sqlMapClient.update("update", user);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

	@Override
	public List<Map<String, Integer>> queryCount(int count) {
		
		// 存放分页信息
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 存放分页集合
		List<Map<String, Integer>> list = new ArrayList<Map<String, Integer>>();
		// 存放信息
		// 1.每页显示的条数
		map.put("visiblePages", 10);
		// 2.当前页
		map.put("currentPage", 1);
		// 3.总页数
		map.put("totalPages", count / 4 == 0 ? 1 : (count / 4) + 1);
		// 存放集合
		list.add(map);

		return list;
	}

	@Override
	public void falseDel(int id) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("userId", id);
		map.put("flag", -1);
		
		try {
			
			sqlMapClient.update("falseDel", map);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public int count() {
		
		List<User> count = null;
		
		try {
			count = sqlMapClient.queryForList("selCount", 1);

		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return count.size();
	}

}
