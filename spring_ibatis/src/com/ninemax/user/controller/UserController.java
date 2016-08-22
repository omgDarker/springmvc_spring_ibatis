package com.ninemax.user.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ninemax.user.model.User;
import com.ninemax.user.service.UserService;

/**
 * 用户Controller
 * 
 * @author Darker
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userservice;

	/**
	 * 初始化界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest request) {

		// 获得总条数
		int count = userservice.count();

		request.setAttribute("sumTotal", count);

		return "user/userList";
	}

	/**
	 * 查询用户数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/queryUser")
	@ResponseBody
	public List<User> queryUser(HttpServletRequest request) {
		// 得到当前页码
		String currentPage = request.getParameter("currentPage");

		if (currentPage == null) {

			currentPage = "1";
		}
		// 查找集合
		List<User> users = userservice.getAllUsers(Integer.valueOf(currentPage));

		return users;

	}

	/**
	 * 初始化新增用户界面
	 * 
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toAdd() {
		
		return "user/addUser";
		
	}

	/**
	 * 初始化更新用户界面
	 * @param id 用户ID
	 * @param request
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(int id, HttpServletRequest request) {
		// 查找要更新的数据
		User user = userservice.getUsrById(id);
		// 放入作用域
		request.setAttribute("user", user);
		
		return "user/updateUser";
	}

	/**
	 * 更新用户操作
	 * 
	 * @param user 用户对象
	 * @param response
	 */
	@RequestMapping("/update")
	public void update(User user, HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			// 获得输出流
			OutputStream printWriter = response.getOutputStream();
			// 对字符串进行转码操作
			User newuser = null;
			// 转码字符串 ，防止乱码
			newuser = new User(Integer.parseInt(
					URLDecoder.decode(user.getUserId().toString(), "utf-8")), 
					URLDecoder.decode(user.getUserName(), "utf-8"), 
					URLDecoder.decode(user.getAge(), "utf-8"), 
					URLDecoder.decode(user.getFlag(),"utf-8"));

			userservice.update(newuser);
			
			printWriter.write("success".getBytes());
			// 关闭链接
			printWriter.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	/**
	 * 假删除
	 * 
	 * @param id 删除的ID
	 * @param response 响应
	 * @return
	 */
	@RequestMapping("/falseDel")
	public void falseDel(int id, HttpServletResponse response) {
		try {
			// 删除对应的数据库数据
			userservice.falseDel(id);
			// 设置ajax返回类型
			response.setContentType("text/html;charset=UTF-8");
			// 得到输出流
			OutputStream printWriter = response.getOutputStream();
			// 输出提示信息
			printWriter.write("success".getBytes());
			// 关闭链接
			printWriter.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

	/**
	 * 增加用户操作
	 * 
	 * @param name 用户名
	 * @param age 年龄
	 * @param flag 标识符
	 * @param response 
	 */
	@RequestMapping("/add")
	public void add(String name, String age, String flag,HttpServletResponse response) {
		try {
			// 设置ajax的返回类型
			response.setContentType("text/html;charset=UTF-8");
			// 获得输出流
			OutputStream printWriter = response.getOutputStream();
			
			User user = null;
			
			user = new User(null, 
							URLDecoder.decode(name, "utf-8"),
							URLDecoder.decode(age, "utf-8"), 
							URLDecoder.decode(flag,"utf-8"));
			userservice.addUser(user);
			// 提示信息
			printWriter.write("su".getBytes());
			// 关闭链接
			printWriter.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}
	
	/**
	 * 删除操作
	 * 
	 * @param id 删除的ID
	 * @param request 请求
	 * @return
	 */
//	 @RequestMapping("/del")
//	 public String del(HttpServletRequest request, Integer id) {
//	 // 删除对应的数据库数据
//	 userservice.delUser(id);
//	 // 获取数据集合
//	 List<User> users = userservice.getAllUsers();
//	 // 放入作用域
//	 request.setAttribute("userlist", users);
//	
//	 return "Index";
//	
//	 }

}
