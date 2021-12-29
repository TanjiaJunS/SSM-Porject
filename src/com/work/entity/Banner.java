package com.work.entity;

import java.util.Date;

public class Banner {
	private int id;
	private String title;
	private String image;
	private int orderStatus;
	private Date create_time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getCreat_time() {
		return create_time;
	}
	public void setCreat_time(Date creat_time) {
		this.create_time = creat_time;
	}
	
	@Override
	public String toString() {
		return "Banner [id=" + id + ", title=" + title + ", image=" + image + ", orderStatus=" + orderStatus + ", creat_time="
				+ create_time + "]";
	}
	
	
}
