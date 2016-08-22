package com.ninemax.birthday.model;

public class Birthday {

	private Integer Id;

	private String username;

	private String age;

	private String birthday;

	public Birthday() {

	}

	public Birthday(Integer Id, String username, String age, String birthday) {
		this.Id = Id;
		this.username = username;
		this.age = age;
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "Birthday [Id=" + Id + ", username=" + username + ", age=" + age
				+ ", birthday=" + birthday + "]";
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
