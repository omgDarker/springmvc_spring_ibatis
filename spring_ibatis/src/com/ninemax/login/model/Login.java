package com.ninemax.login.model;

public class Login {

	private Integer managerId;

	private String managerName;

	private String managerPassword;

	private String flag;

	public String getManagerName() {
		return managerName;
	}

	@Override
	public String toString() {
		return "Login [managerId=" + managerId + ", managerName=" + managerName
				+ ", managerPassword=" + managerPassword + ", flag=" + flag
				+ "]";
	}

	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPassword() {
		return managerPassword;
	}

	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}
