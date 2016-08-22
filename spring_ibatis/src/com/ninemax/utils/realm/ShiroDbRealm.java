package com.ninemax.utils.realm;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.ninemax.login.model.Login;
import com.ninemax.login.service.LoginService;

public class ShiroDbRealm extends AuthorizingRealm {

	@Resource
	private LoginService loginService;

	/**
	 * 授权回调函数(将用户的角色和权限添加到认证器中).
	 * 
	 * @param principals 身份认证(唯一)
	 *            
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 认证器
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 获取当前登录的用户名
		String account = (String) super.getAvailablePrincipal(principals);

		Login user = loginService.queryUser(account);
		
		if (null == user) {
			
			return null;
			
		}
		return info;
	}

	/**
	 * 认证回调函数(提交凭证信息时调用)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		// 转换成用户认证
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		// 通过用户部分信息获取用户
		Login user = loginService.queryUser(token.getUsername());
		
		if (user != null) {

			return new SimpleAuthenticationInfo(user.getManagerName(),user.getManagerPassword(), user.getManagerName());

		}
		return null;
	}

}
