package com.work.entity;

import java.util.Date;

public class SystemInfo {
	private int id;
	private String author;
	private String addres;
	private String phone;
	private String systemLogo;
	private Date time;
	private String systemName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSystemLogo() {
		return systemLogo;
	}
	public void setSystemLogo(String systemLogo) {
		this.systemLogo = systemLogo;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getAddres() {
		return addres;
	}
	public void setAddres(String addres) {
		this.addres = addres;
	}
	public String toString() {
		return "SystemInfo [id=" + id + ", author=" + author + ", addres=" + addres + ", phone=" + phone
				+ ", systemLogo=" + systemLogo + ", time=" + time + ", systemName=" + systemName + "]";
	}
	
}
