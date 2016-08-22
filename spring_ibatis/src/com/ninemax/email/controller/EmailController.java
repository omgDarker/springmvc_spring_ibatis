package com.ninemax.email.controller;

import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ninemax.email.model.Email;
import com.ninemax.email.service.EmailService;

/**
 * controller
 * 
 * @author Darker
 * 
 */
@Controller
@RequestMapping("/email")
public class EmailController {

	@Resource
	private EmailService emailService;

	@RequestMapping("/sendEmail")
	public String SendEmail() {
		// 设置邮件服务器信息
		Email email = new Email();
		// 文件读取
		Properties prop = new Properties();
		try {
			prop.load(EmailControllerByFile.class.getClassLoader()
					.getResourceAsStream("email.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		email.setMailServerHost(prop.getProperty("ServerHost"));
		email.setMailServerPort(prop.getProperty("ServerPort"));
		email.setValidate(true);
		// 邮箱用户名
		email.setUserName(prop.getProperty("UserName"));
		// 邮箱密码
		email.setPassword(prop.getProperty("Password"));
		// 发件人邮箱
		email.setFromAddress(prop.getProperty("FromAddress"));
		// 收件人邮箱
		email.setToAddress(prop.getProperty("Address"));
		// 邮件标题
		email.setSubject(prop.getProperty("Subject"));
		// 邮件内容
		StringBuffer buffer = new StringBuffer();
		buffer.append("JavaMail 1.4.5 jar包下载地址：http://www.oracle.com/technetwork/java/index-138643.html\n");
		buffer.append("JAF 1.1.1 jar包下载地址：http://www.oracle.com/technetwork/java/javase/downloads/index-135046.html");
		email.setContent(buffer.toString());
		// 发送邮件
		// 发送文体格式
		emailService.sendTextMail(email);
		// 发送html格式
		// emailService.sendHtmlMail(email);
		System.out.println("邮件发送完毕!!!");

		return "email/email";

	}
}
