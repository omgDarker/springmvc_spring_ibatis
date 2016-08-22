package com.ninemax.email.service;

import org.springframework.stereotype.Service;

import com.ninemax.email.model.Email;

@Service
public interface EmailService {
	
	// 发送html格式邮件
	public boolean sendHtmlMail(Email email);
	// 设置发送邮件的内容
	public boolean sendTextMail(Email email);
}
