package com.ninemax.login.controller;

import java.awt.Color;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ninemax.login.model.Login;
import com.ninemax.login.service.LoginService;
import com.ninemax.utils.ValidateCode;

/**
 * 登陆Controller
 * 
 * @author Darker
 *
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Resource
	private LoginService loginService;
	
	/**
	 * 登陆
	 * @param managerName 登录名
	 * @param managerPassword 登陆密码
	 * @param validateCode 验证码
	 * @param session
	 * @return
	 */
	@RequestMapping("/login")
	public String login(String managerName, String managerPassword,String validateCode, HttpSession session) {

		// 验证验证码是否正确
		if ("".equals(validateCode)|| !validateCode.equals(session.getAttribute("validateCode"))) {

			return "redirect:/";

		}
		if (true == loginService.login(managerName==""?"":managerName, managerPassword==""?"":managerPassword)) {
			// 将管理员姓名放入到session
			session.setAttribute("ManagerName", managerName);
			// 跳转到用户方法
			return "redirect:/user/index";
		}

		return "login/login";

	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 清除session
		session.invalidate();
		
		return "login/login";
	}
	
	/**
	 * 忘记密码
	 * @param managerName 登陆名
	 * @param managerPassword 登陆密码
	 * @param response 
	 */
	@RequestMapping("/forgotPassword")
	public void forgotPassword(String managerName, String managerPassword,HttpServletResponse response) {
		try {
			// 设置ajax返回类型
			response.setContentType("text/html;charset=UTF-8");
			// 获得输出流
			OutputStream printWriter = response.getOutputStream();
			// 查询用户是否存在
			boolean flag = loginService.isExist(managerName==""?"":managerName);
			// 修改用户密码
			if (true==flag) {

				boolean isSuccess = loginService.modifyPassword(managerName,managerPassword);

				if (isSuccess == true) {

					printWriter.write("success".getBytes());

				} else {

					printWriter.write("fail".getBytes());
				}

			} else {

				printWriter.write("fail".getBytes());
			}
			// 关闭输出流
			printWriter.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}

	}

	/**
	 * 展示用户登陆信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/profile")
	public String profile(HttpServletRequest request, HttpServletResponse response) {

		return "";
	}

	/**
	 * 生成验证码
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/validateCode")
	public void validateCode(HttpServletRequest request,HttpServletResponse response) throws Exception {
		// 设置响应头信息
		response.setHeader("Cache-Control", "no-cache");
		// 返回一个新的验证码
		String verifyCode = ValidateCode.generateTextCode(ValidateCode.TYPE_NUM_ONLY, 4, null);
		// 将新的验证码放入到session里面
		request.getSession().setAttribute("validateCode", verifyCode);
		// 设置响应类型
		response.setContentType("image/jpeg");
		// 生成验证码图片
		BufferedImage bim = ValidateCode.generateImageCode(verifyCode, 120, 40,4, true, Color.WHITE, Color.BLACK, null);
		// 渲染页面
		ImageIO.write(bim, "JPEG", response.getOutputStream());
	}
	
	/**
	 * shiro授权登陆
	 * @param user 用户名
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/login2")
	public String login(Login currUser, HttpSession session,HttpServletRequest request) {
		// 获取session中的验证码
		String sessionCode = (String) session.getAttribute("validateCode");
		// 获取form表单中的验证码
		// String formCode=req.getParameter("validateCode");
		String formCode = WebUtils.getCleanParam(request, "validateCode");
		// 判断验证码是否正确
		// if(sessionCode!=formCode){
		// return "redirect:/";
		// }
		if (StringUtils.isEmpty(formCode)|| !StringUtils.equals(sessionCode, formCode)) {
			return "redirect:/";
		}
		// 得到主体(将登陆URL过滤掉,才可以得到主体,否则报错)
		Subject user = SecurityUtils.getSubject();
		// 获取用户凭证信息
		UsernamePasswordToken token = new UsernamePasswordToken(currUser.getManagerPassword(), currUser.getManagerPassword());
		// "已记住"和"已认证"是有区别的,并非是认证通过的用户
		token.setRememberMe(true);
		try {
			// 将管理员姓名放入到session
			session.setAttribute("ManagerName",request.getParameter("managerName"));
			// 提交凭证信息(token:数据库,user:请求传过来的值)
			user.login(token);
			// 跳转到用户方法
			return "redirect:/user/index";
		} catch (Exception e) {
			
			return "login/login2";
			
		}

	}
	
	/**
	 * shiro退出
	 * 
	 * @return
	 */
	@RequestMapping("/logout2")
	public String logout() {
		// 得到主体(将登陆URL过滤掉,才可以得到主体,否则报错)
		Subject currentUser = SecurityUtils.getSubject();
		// 用户退出后,不能直接通过URL来访问页面,需要登陆
		currentUser.logout();
		
		return "login/login2";
	}
}
