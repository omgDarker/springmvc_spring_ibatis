package com.ninemax.user.model;



public class User {
		
    private Integer userId;
	
	private String userName;
	
	private String age;
	
	private String flag;

	public User() {
		
	}

	public User(Integer userId, String userName, String age, String flag) {
		
		this.userId = userId;
		this.userName = userName;
		this.age = age;
		this.flag = flag;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
}
