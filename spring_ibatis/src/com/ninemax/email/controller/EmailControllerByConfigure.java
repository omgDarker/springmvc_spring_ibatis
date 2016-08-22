package com.ninemax.email.controller;

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
@RequestMapping("/email3")
public class EmailControllerByConfigure {

	@Resource
	private EmailService emailService;
	
	@RequestMapping("/sendEmail")
	public String SendEmail() {
		// 设置邮件服务器信息
		Email email = new Email();
		email.setMailServerHost("smtp.163.com");
		email.setMailServerPort("25");
		email.setValidate(true);
		// 邮箱用户名
		email.setUserName("18513028506@163.com");
		// 邮箱密码
		email.setPassword("kukuniu521");
		// 发件人邮箱
		email.setFromAddress("18513028506@163.com");
		// 收件人邮箱
		email.setToAddress("13264389469@163.com");
		// 邮件标题
		email.setSubject("测试Java程序发送邮件");
		// 邮件内容
		StringBuffer buffer = new StringBuffer();
		buffer.append("JavaMail 1.4.5 jar包下载地址：http://www.oracle.com/technetwork/java/index-138643.html\n");
		buffer.append("JAF 1.1.1 jar包下载地址：http://www.oracle.com/technetwork/java/javase/downloads/index-135046.html");
		email.setContent(buffer.toString());
		// 发送邮件
		// 发送文体格式
		emailService.sendTextMail(email);
		// 发送html格式
		//emailService.sendHtmlMail(email);
		System.out.println("邮件发送完毕!!!");
		
		return "email/email";
		
	}
}
