package com.ninemax.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 邮箱用户名和密码认证器
 * 
 * @author Darker
 * 
 */
public class MyAuthenticator extends Authenticator {

	String userName = null;
	String password = null;

	public MyAuthenticator() {
	}

	public MyAuthenticator(String username, String password) {
		this.userName = username;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
}
