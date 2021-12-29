package com.work.entity;

public class Auditor {
	private String user_id;
	private String password;
	private String userName;
	private int level;
	private String area;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "Auditor [user_id=" + user_id + ", password=" + password + ", userName=" + userName + ", level=" + level
				+ ", area=" + area + "]";
	}
	
	

}
