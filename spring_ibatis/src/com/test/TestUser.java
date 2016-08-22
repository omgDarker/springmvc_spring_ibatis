package com.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ninemax.user.service.UserService;

public class TestUser {
	private static UserService userDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		ApplicationContext cxt=new ClassPathXmlApplicationContext("/config/beans.xml");
		userDao=  (UserService) cxt.getBean("userIbatisDao");
	}

//	@Test
//	public void test() {
//		userDao.addUser(new User(null, "gg", "56",null));
//	}
//    
//	@Test
//	public void update(){
//		userDao.update(new User(1, "sss", "11",null));
//	}
	
//	@Test
//	public void getAll(){
//		List<User> list=userDao.getAllUsers();
//		System.out.println(list.size());
//	}
	
	@Test
	public void getOne(){
		System.out.println(userDao.getUsrById(1).getAge());
	}
	@Test
	public void del(){
		userDao.delUser(3);
	}
}
